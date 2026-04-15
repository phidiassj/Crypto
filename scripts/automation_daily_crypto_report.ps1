param(
    [string]$OutputRoot = 'E:\work\Crypto\.cache\daily-crypto-report',
    [string]$ProfilePath = 'E:\work\browser-profiles\x-playwright',
    [string]$SessionName = 'crypto-daily-report'
)

$ErrorActionPreference = 'Stop'

$CliScript = 'C:\Users\phidi\.codex\skills\playwright\scripts\playwright_cli.sh'
$OutputDate = Get-Date -Format 'yyyyMMdd'
$RunDir = Join-Path $OutputRoot $OutputDate
New-Item -ItemType Directory -Force -Path $RunDir | Out-Null

function Invoke-PlaywrightCli {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Arguments
    )

    $quotedArgs = $Arguments | ForEach-Object {
        "'" + ($_ -replace "'", "'\\''") + "'"
    }
    $bashCli = $CliScript.Replace('\', '/').Replace('C:', '/mnt/c')
    $cmd = "PLAYWRIGHT_CLI_SESSION=$SessionName `"$bashCli`" $($quotedArgs -join ' ')"
    return bash -lc $cmd
}

function Ensure-Session {
    $listOutput = Invoke-PlaywrightCli -Arguments @('list')
    if ($listOutput -notmatch [Regex]::Escape($SessionName)) {
        Invoke-PlaywrightCli -Arguments @(
            'open',
            'about:blank',
            '--persistent',
            '--profile',
            $ProfilePath
        ) | Out-Null
    }
}

function Invoke-PlaywrightJson {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Url,
        [Parameter(Mandatory = $true)]
        [string]$JavaScript,
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    $tempJs = Join-Path $RunDir "$Name.js"
    Set-Content -LiteralPath $tempJs -Value $JavaScript -Encoding UTF8

    Invoke-PlaywrightCli -Arguments @('goto', $Url) | Out-Null
    $output = Invoke-PlaywrightCli -Arguments @('run-code', '--filename', $tempJs)
    $lines = $output -split "`r?`n"
    $idx = [Array]::IndexOf($lines, '### Result')
    if ($idx -lt 0 -or ($idx + 1) -ge $lines.Length) {
        throw "Playwright output for $Name did not contain a JSON result.`n$output"
    }

    $json = $lines[$idx + 1]
    Set-Content -LiteralPath (Join-Path $RunDir "$Name.raw.json") -Value $json -Encoding UTF8
    return $json | ConvertFrom-Json
}

function Convert-UsdTextToNumber {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text) -or $Text -eq '--') { return $null }
    $clean = $Text.Trim().TrimStart('$').Replace(',', '')
    if ($clean.EndsWith('T')) { return [double]$clean.TrimEnd('T') * 1e12 }
    if ($clean.EndsWith('B')) { return [double]$clean.TrimEnd('B') * 1e9 }
    if ($clean.EndsWith('M')) { return [double]$clean.TrimEnd('M') * 1e6 }
    if ($clean.EndsWith('K')) { return [double]$clean.TrimEnd('K') * 1e3 }
    return [double]$clean
}

function Convert-PercentTextToNumber {
    param([string]$Text)
    if ([string]::IsNullOrWhiteSpace($Text) -or $Text -eq '--') { return $null }
    return [double]($Text.TrimEnd('%').Replace(',', ''))
}

Ensure-Session

$trendingJs = @'
async (page) => {
  await page.waitForTimeout(2500);
  return await page.evaluate(() => {
    const table = [...document.querySelectorAll('table')][1];
    if (!table) {
      return { error: 'missing trending table', url: location.href };
    }
    const rows = [...table.querySelectorAll('tbody tr')].map((tr) => {
      const cells = [...tr.querySelectorAll('td')];
      const link = tr.querySelector('a[href*="/currencies/"]');
      const nameParts = cells[2] ? cells[2].innerText.split('\n').map((x) => x.trim()).filter(Boolean) : [];
      return {
        rank: cells[1]?.innerText?.trim() ?? null,
        name: nameParts[0] ?? null,
        symbol: nameParts[1] ?? null,
        price: cells[3]?.innerText?.trim() ?? null,
        hour1: cells[4]?.innerText?.trim() ?? null,
        hour24: cells[5]?.innerText?.trim() ?? null,
        marketCap: cells[6]?.innerText?.trim() ?? null,
        volume24h: cells[7]?.innerText?.trim() ?? null,
        dexLiquidity: cells[8]?.innerText?.trim() ?? null,
        age: cells[9]?.innerText?.trim() ?? null,
        dexTxns24h: cells[10]?.innerText?.trim() ?? null,
        securityScan: cells[11]?.innerText?.trim() ?? null,
        href: link?.getAttribute('href') ?? null
      };
    });
    const pager = document.body.innerText.match(/Showing\s+\d+\s+-\s+\d+\s+out of\s+(\d+)/i);
    return {
      total: pager ? Number(pager[1]) : null,
      rows
    };
  });
}
'@

$rsiJs = @'
async (page) => {
  await page.waitForTimeout(2500);
  return await page.evaluate(() => {
    const table = [...document.querySelectorAll('table')][1];
    if (!table) {
      return { error: 'missing rsi table', url: location.href };
    }
    const rows = [...table.querySelectorAll('tbody tr')].map((tr) => {
      const cells = [...tr.querySelectorAll('td')];
      const link = tr.querySelector('a[href*="/currencies/"]');
      const nameParts = cells[1] ? cells[1].innerText.split('\n').map((x) => x.trim()).filter(Boolean) : [];
      return {
        rank: cells[0]?.innerText?.trim() ?? null,
        name: nameParts[0] ?? null,
        symbol: nameParts[1] ?? null,
        price: cells[2]?.innerText?.trim() ?? null,
        rsi4h: cells[8]?.innerText?.trim() ?? null,
        rsi24h: cells[9]?.innerText?.trim() ?? null,
        rsi7d: cells[10]?.innerText?.trim() ?? null,
        href: link?.getAttribute('href') ?? null
      };
    });
    const pager = document.body.innerText.match(/Showing\s+\d+\s+-\s+\d+\s+out of\s+(\d+)/i);
    return {
      total: pager ? Number(pager[1]) : null,
      rows
    };
  });
}
'@

$trendingPage1 = Invoke-PlaywrightJson -Url 'https://coinmarketcap.com/?type=coins&tableRankBy=trending_top_200_24h&page=1' -JavaScript $trendingJs -Name 'trending-page1'
$trendingPage2 = Invoke-PlaywrightJson -Url 'https://coinmarketcap.com/?type=coins&tableRankBy=trending_top_200_24h&page=2' -JavaScript $trendingJs -Name 'trending-page2'
$rsiData = Invoke-PlaywrightJson -Url 'https://coinmarketcap.com/charts/rsi/' -JavaScript $rsiJs -Name 'rsi-page'

$trendingRows = @($trendingPage1.rows) + @($trendingPage2.rows)
$list1 = $trendingRows |
    Where-Object { $_.symbol } |
    ForEach-Object {
        [pscustomobject]@{
            Rank = $_.rank
            Name = $_.name
            Symbol = $_.symbol
            PriceText = $_.price
            Price = Convert-UsdTextToNumber $_.price
            Hour1 = Convert-PercentTextToNumber $_.hour1
            Hour24 = Convert-PercentTextToNumber $_.hour24
            MarketCapText = $_.marketCap
            Volume24hText = $_.volume24h
            DexLiquidityText = $_.dexLiquidity
            Age = $_.age
            DexTxns24hText = $_.dexTxns24h
            SecurityScan = $_.securityScan
            Href = $_.href
        }
    } |
    Where-Object {
        $_.Price -ge 0.5 -and
        $_.SecurityScan -and
        $_.SecurityScan -notmatch '(?i)caution' -and
        $_.SecurityScan -notmatch '(?i)unknow'
    }

$rsiLookup = @{}
foreach ($row in $rsiData.rows) {
    if (-not $row.symbol) { continue }
    $rsiLookup[$row.symbol.ToUpperInvariant()] = [pscustomobject]@{
        Name = $row.name
        Symbol = $row.symbol
        PriceText = $row.price
        Rsi4hText = $row.rsi4h
        Rsi24hText = $row.rsi24h
        Rsi7dText = $row.rsi7d
        Rsi4h = if ($row.rsi4h -match '^-?\d+(\.\d+)?$') { [double]$row.rsi4h } else { $null }
        Rsi24h = if ($row.rsi24h -match '^-?\d+(\.\d+)?$') { [double]$row.rsi24h } else { $null }
        Rsi7d = if ($row.rsi7d -match '^-?\d+(\.\d+)?$') { [double]$row.rsi7d } else { $null }
        Href = $row.href
    }
}

$list2 = @(foreach ($coin in $list1) {
    $symbol = $coin.Symbol.ToUpperInvariant()
    if (-not $rsiLookup.ContainsKey($symbol)) { continue }
    $rsi = $rsiLookup[$symbol]
    if ($null -eq $rsi.Rsi24h -or $rsi.Rsi24h -gt 60) { continue }
    [pscustomobject]@{
        Rank = $coin.Rank
        Name = $coin.Name
        Symbol = $coin.Symbol
        Price = $coin.Price
        PriceText = $coin.PriceText
        Hour24 = $coin.Hour24
        MarketCapText = $coin.MarketCapText
        Volume24hText = $coin.Volume24hText
        SecurityScan = $coin.SecurityScan
        Age = $coin.Age
        Href = $coin.Href
        Rsi4h = $rsi.Rsi4h
        Rsi24h = $rsi.Rsi24h
        Rsi7d = $rsi.Rsi7d
        Rsi4hText = $rsi.Rsi4hText
        Rsi24hText = $rsi.Rsi24hText
        Rsi7dText = $rsi.Rsi7dText
    }
}) |
    Sort-Object Rsi24h, Price |
    Select-Object -First 15

$summary = [pscustomobject]@{
    generatedAt = (Get-Date).ToString('s')
    trendingTotal = $trendingPage1.total
    trendingRowsCaptured = $trendingRows.Count
    list1Count = @($list1).Count
    rsiRowsCaptured = @($rsiData.rows).Count
    list2Count = @($list2).Count
}

Set-Content -LiteralPath (Join-Path $RunDir 'summary.json') -Value ($summary | ConvertTo-Json -Depth 10) -Encoding UTF8
Set-Content -LiteralPath (Join-Path $RunDir 'target-list-1.json') -Value (@($list1) | ConvertTo-Json -Depth 10) -Encoding UTF8
Set-Content -LiteralPath (Join-Path $RunDir 'target-list-2.json') -Value (@($list2) | ConvertTo-Json -Depth 10) -Encoding UTF8

$summary | ConvertTo-Json -Depth 10
