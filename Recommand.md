# Recommand / run notes

## 2026-03-26

### 可行方法
- CoinMarketCap 熱門榜 `https://coinmarketcap.com/?type=coins&tableRankBy=trending_top_200_24h` 可直接從頁面 table 抓出 `Price`、`Security Scan`、`DEX Liquidity` 等欄位。
- 熱門榜需要補抓第 2 頁，因為第 1 頁只顯示 100 筆，總數約 163-164 筆。
- CoinMarketCap RSI `https://coinmarketcap.com/charts/rsi/` 可以用名稱回查熱門名單中的幣，但要接受頁面只穩定暴露一部分可見列。
- 對於清算帶，如果 CoinGlass 無法直接取得單幣精準頁面，可用現價附近的心理整數位、最近提到的支撐/壓力區、RSI 狀態做區間推估，並在報告中明講是推估。

### 本次踩坑
- CMC RSI 頁面雖然 table 可讀，但分頁資訊不可靠，畫面會出現 `Showing 1 - 0 out of 0`，不適合直接拿來當完整資料源。
- CoinGlass 以搜尋方式找單一幣種 liquidation map 命中率不高，Solana 這類大幣比較容易找到二手引用，小幣常常找不到直接頁面。
- 單純搜尋 `CoinGecko + 幣名 + recent news` 不一定會有真正的新消息，很多時候只有行情頁；這種情況要把「缺乏新催化」本身當作有效結論。

### 下次優先順序
- 先抓熱門榜並完成安全/價格過濾。
- 再把候選名稱回查 CMC RSI，若不足 15 筆就保留實際可對齊筆數，不要硬補。
- 最新動態優先看 CoinMarketCap Top Stories / CMC AI、CoinGecko 行情頁，再補官方社群或專案週報。

## 2026-03-27

### 本次新增觀察
- 今日 Trending Top 200 實際只抓到 `164` 筆，目標清單 1 有 `62` 筆，但能在 CMC RSI 成功對齊且 `24H RSI <= 60` 的只有 `11` 筆，這次不適合硬補到 15 檔。
- 用 Playwright 直接在同一個 page 依序 `goto` 第 1 頁、第 2 頁、RSI 頁，比抓原始 HTML 再 parse 穩定，因為原始 HTML 不一定含完整已渲染 table。
- DuckDuckGo HTML 搜尋在短時間重複查多個幣時會觸發 bot challenge；若要補新聞，優先少量查詢、保留第一次成功結果，或改成直接查 CoinMarketCap Top Stories / CMC AI 固定頁。

### 不建議的方法
- 不要依賴 CoinGecko API 大量逐幣查詢，免費端很快回 `429 Throttled`。
- 不要假設 RSI 頁可完整分頁，實際上最穩的是直接讀當前可見 100 列再做交叉比對。

## 2026-03-28

### 本次新增觀察
- 這次 Trending 清單在 Playwright 直接 parse 時，穩定取得的是 `35 + 26 = 61` 個通過安全/價格條件的候選；完整頁面行數與前兩日略有波動，但交叉結論一致。
- RSI 頁仍然只能穩定拿到當前可見 `100` 列，與熱門候選交叉後這次依舊只有 `11` 檔符合 `24H RSI <= 60`。
- 要補近期動態時，`CoinMarketCap Top Stories` 比廣泛搜尋穩定許多，尤其是 `ASTER`、`XMR`、`KCS`、`HYPE` 這種中型幣。

### 本次踩坑
- 在 Playwright `run_code` 內一次連跳多頁抓表格，容易只拿到虛擬表格的部分列數；分頁後各自 evaluate DOM 比較穩。
- 對 `GAS`、`SIREN` 這類較小或較舊的標的，搜尋結果常只有價格頁或無法驗證的二手內容，這種情況要接受「找不到夠強的新催化」本身就是結論。

### 下次優先順序
- 熱門榜仍先做 `價格 >= 0.5` 與 `Security Scan` 過濾，再與 RSI 可視資料交叉。
- 新聞補充優先順序建議為：`CoinMarketCap Top Stories / CMC AI` > 一般新聞 / 官方站 > 其他搜尋結果。
- 若 worktree 是 detached HEAD，而主工作樹 `E:\\work\\Crypto` 在 `master`，最後 commit / push 直接在主工作樹進行會比較安全。

## 2026-03-29

### 本次新增觀察
- 今日 Trending Top 200 透過 `?page=1` 與 `?page=2` 直接抓表格，穩定取得 `164` 筆；通過價格與安全過濾後的目標清單 1 為 `58` 檔。
- RSI 頁今天仍只穩定提供 `100` 筆可視列，與目標清單 1 交叉後，符合 `24H RSI <= 60` 的目標清單 2 只有 `11` 檔。
- `CoinMarketCap Top Stories` 這次比一般搜尋更有用，尤其是 `HYPE`、`NEXO`、`KCS`、`SIREN`、`PAXG/XAUt`；很多標的可以直接從故事頁或首頁摘要拿到近期脈絡。

### 本次踩坑
- `CoinGlass` 單幣清算地圖仍不適合當唯一資料源，很多幣缺少穩定可直接引用的公開頁；實務上還是要接受用價格結構與整數關卡做區間推估。
- 一般搜尋對 `GAS`、`BCH` 這類標的容易只回價格頁或過舊內容；找不到高可信新訊時，不要硬湊新聞。

### 下次優先順序
- 先用 CMC Trending `page=1/2` 抓完，再做 `價格 >= 0.5` 與 `Security Scan` 過濾。
- 再到 CMC RSI 做交叉；若仍只有約 10-12 檔，就維持實際筆數。
- 最新動態優先順序建議為：`CMC Top Stories / 摘要` > `CoinGecko / 其他媒體` > `一般搜尋結果`。

## 2026-03-30

### 本次新增觀察
- 今天用 Playwright 直接讀 DOM，比直接 `requests` CoinMarketCap HTML 穩定；`requests` 抓 Trending 首頁會落回一般市值榜，不會保留 `tableRankBy=trending_top_200_24h` 的已渲染資料。
- 今日 Trending page 1 / 2 綜合後，通過 `價格 >= 0.5` 與安全條件的目標清單 1 為 `59` 檔；與 RSI 頁 100 筆可視資料交叉後，目標清單 2 仍只有 `11` 檔。
- 本次可用的 RSI 候選主要集中在 `PAXG`、`XAUt`、`GT`、`CVX`、`BSV`、`ASTER`、`OKB`、`DASH`、`KCS`、`NEXO`、`SIREN`。
- `Aster` 是今天少數具近期明確事件線的標的，主網與 USD1 合作仍是主要敘事；其餘多數平台幣仍是「低 RSI 但缺新催化」。

### 本次踩坑
- 單純用 `requests` 或 `Invoke-WebRequest` 直接抓 CMC 頁面，不一定能拿到 Trending / RSI 的實際已渲染表格資料；尤其 RSI 原始 HTML 常只剩空白 cell。
- 一般搜尋對 `CVX`、`BSV`、`GT` 這類標的容易充滿價格預測站，訊噪比很差；這次以 `CMC Top Stories / CMC AI / Academy` 為主反而更穩。
- `CoinGlass` 公開頁面仍不適合批量逐幣精準取值，因此清算帶繼續以支撐/壓力區與整數位推估。

### 下次優先順序
- 保留 Playwright DOM 抽表流程，不要退回純 HTTP 抓 HTML。
- 熱門榜依舊先抓 `page=1/2` 後做價格與安全過濾，再與 RSI 100 筆可視列交叉。
- 新聞補充優先順序建議為：`CMC Top Stories / CMC AI / Academy` > `crypto.news` > 其他搜尋結果。

## 2026-03-31

### 本次新增觀察
- `CMC AI` 的逐幣頁面 URL 可直接用 slug 猜測，格式例如 `https://coinmarketcap.com/cmc-ai/<slug>/latest-updates/`；今天對 `GT / MX / ASTER / NEXO / CAKE / BTC / LINK / MNT / CVX / QNT / ZEN / GAS / OKB / KCS` 都能直接打開，補近期動態比一般搜尋穩定。
- 今日 Trending page 1 / 2 綜合後，通過 `價格 >= 0.5` 與安全條件的目標清單 1 為 `60` 檔；與 RSI 可視 100 列交叉後，目標清單 2 剛好能湊滿 `15` 檔。
- `QNT`、`DASH` 這類標的在 CMC AI 的 `latest news` 區塊可能直接顯示資料不足，但 `people are saying` / `roadmap` 區塊仍能提供可用脈絡，適合當次級來源。

### 本次踩坑
- Playwright MCP 的 `browser_navigate` 在這台機器會先嘗試建立 `C:\\Windows\\System32\\.playwright-mcp`，容易噴 `EPERM`；但如果頁面已載入，改用 `browser_run_code` / `browser_evaluate` 仍可正常抽 DOM。
- 針對指定站點做一般搜尋時，搜尋引擎常先回 CoinMarketCap PDF、百科或無關頁面；直接猜 `cmc-ai/<slug>/latest-updates/` 反而更有效。

### 下次優先順序
- 先走 `Trending page=1/2 -> 價格與安全過濾 -> RSI 100 列交叉`。
- 補逐幣新聞時優先試 `CMC AI slug 直開`，找不到再退到 `crypto.news` / 其他站。
- 清算帶仍以推估為主，報告內要持續標明是估算區，而不是 CoinGlass 精確值。

## 2026-04-01

### 本次新增觀察
- 用 `playwright-cli` 搭配共享 session `aiyoperps-auth` 與 persistent profile，可以在 headless 模式穩定抓 `Trending page=1/2` 與 `RSI`；今天結果是 `158` 筆 Trending、`58` 檔清單1、`15` 檔清單2。
- 今天把抽表流程包成 `scripts/automation_daily_crypto_report.ps1`（在 automation worktree），可直接落 raw JSON 到 `.cache/daily-crypto-report/yyyyMMdd/`，後續整理報告時不必重跑整段瀏覽流程。
- `CMC AI` 逐幣頁今天仍是最穩定的逐檔補資料來源；`LIT / MORPHO / LPT / ICP / LINK / XAUt / PAXG / AR / ZEN / QTUM` 都能直接拿到可用摘要。

### 本次踩坑
- `playwright` MCP 仍會卡在 `C:\Windows\System32\.playwright-mcp` 的 `EPERM`，不要再用 `browser_navigate` 當主流程；改用 `playwright-cli` 或 shell 包裝比較穩。
- `playwright-cli run-code --filename` 傳入檔案時，要給 Windows path，不要硬轉成 `/mnt/...`；否則 CLI 會把它錯解成 `C:\mnt\...` 並報 `outside allowed roots`。
- `RSI` 頁的第二個 table 欄位位置與 Trending 不同，正確索引是 `rank/name/price/.../RSI(4h)/RSI(24h)/RSI(7d)`，不要沿用 Trending 的 cell 索引。

### 下次優先順序
- 先直接跑 automation 腳本，確認 `.cache/daily-crypto-report/yyyyMMdd/target-list-2.json` 是否產生 10-15 檔。
- 逐幣動態優先走 `CMC AI`，`BTC / LINK` 再額外對照 `refx` 是否有新推文交叉支持。
- 清算帶仍維持「估算區」寫法；如果 CoinGlass 找不到單幣精準圖，不要硬湊精確數字。

## 2026-04-02

### 本次新增觀察
- 今天直接沿用 `automation_daily_crypto_report.ps1`，用 `playwright-cli` + 共享 session `aiyoperps-auth` 在 headless 模式穩定抓到 `163` 筆 Trending、`59` 檔清單1、`14` 檔清單2。
- 今天目標清單2 比昨天少一檔，主因仍是 CMC RSI 只穩定暴露可見 `100` 列；若交叉後只有 `14` 檔，就維持實際結果，不要硬補。
- `CMC AI` 逐幣頁今天對 `LIT / BSV / XMR / ZEN / AVAX / MNT / LINK / KCS / XAUt / PAXG / MX / GAS / NEO / QTUM` 都可直接讀到近期摘要，足夠支撐報告主體。
- `crypto.news` 這次最有價值的是 `AVAX` 與 `LINK` 補充：前者多了 ETF/支付場景，後者多了跨鏈與企業採用脈絡；其餘標的仍以 `CMC AI` 比一般搜尋穩。

### 本次踩坑
- `CMC AI` 頁面最上方會混入 cookie 說明文字，做自動摘要時不要直接取第一段，應該優先抓標題與第一批有效新聞段落。
- `CoinGecko News` 對 `XAUt / PAXG` 這類商品型代幣，常回到行情或歷史資料頁，不能假設一定會有可直接引用的新聞稿。
- `GAS` 這種 ticker 容易混入無關 meme / 能源商品結果；若要保留，最好明確以 `Neo GAS` 或直接走 `CMC AI`。

### 下次優先順序
- 先跑 automation 腳本生成 `.cache/daily-crypto-report/yyyyMMdd/target-list-2.json`，再針對清單2 逐檔補 `CMC AI`。
- 有較強基本面的大中型幣先補 `crypto.news` 交叉驗證，例如 `LINK / AVAX / MNT`；沒有高可信新訊時接受「缺乏新催化」本身就是結論。
- 若主工作樹 `E:\\work\\Crypto` 仍有 unrelated 變更，commit 時只 add `TrackingList_yyyyMMdd.md` 與必要的 `Recommand.md`，不要把其他檔一起送出。

## 2026-04-03

### 本次新增觀察
- 直接沿用 `C:\Users\phidi\.codex\worktrees\2492\Crypto\scripts\automation_daily_crypto_report.ps1` 可正常抓資料，但 `OutputRoot` 必須改到目前 worktree，例如 `C:\Users\phidi\.codex\worktrees\79b1\Crypto\.cache\daily-crypto-report`；否則 Playwright CLI 會因 `outside allowed roots` 拒絕讀取暫存 JS。
- 今天 Trending 共抓到 `162` 筆，通過價格與安全條件後清單1 為 `58` 檔；與 RSI 可視 100 列交叉後，清單2 只剩 `9` 檔，代表今天不適合硬補滿 `15` 檔。
- 依「建立時間 28 小時內」讀取 `E:\work\Crypto\refx`，今天結果是 `0` 筆；若沒有新推文檔，就不要沿用舊的 `refx` 內容硬湊當日結論。
- 今天 `CMC AI` 仍是最穩的逐幣來源；一般搜尋與 `CoinGecko News` 對 `LIT / KCS / GAS / QTUM / BSV` 這類標的，容易沒有高可信新消息或只回舊行情頁。

### 本次踩坑
- 不要直接在目前 worktree 執行位於其他 worktree 的 automation 腳本而沿用預設 `.cache` 路徑，Playwright 允許根目錄只包含「當前 worktree 與其 `.playwright-cli`」，會報 `File access denied ... outside allowed roots`。
- `refx` 任務條件是看 `CreationTime`，不是 `LastWriteTime`；若用修改時間篩，會誤把舊推文檔算進去。

### 下次優先順序
- 先跑 automation 腳本，但明確帶入當前 worktree 的 `-OutputRoot`。
- 若清單2 少於 10 檔，就維持實際筆數，並在報告明確寫出 `RSI` 可視資料限制。
- `refx` 若 28 小時內沒有新檔，就直接在報告註明「本次無新增 X 事實來源」，不要引用前一天內容混入今天報告。

## 2026-04-04

### 本次新增觀察
- 今天直接沿用 automation 腳本並把 `-OutputRoot` 指到目前 worktree，可穩定抓到 `165` 筆 Trending、`58` 檔清單1、`11` 檔清單2。
- `CMC AI` 頁面的 `application/ld+json` / `data-type=\"learn-faq\"` 內直接包含 `latest news / people are saying / codebase / roadmap` 四組 FAQ，可以用 `Invoke-WebRequest` + regex 取出，不必再靠 Playwright 逐頁人工讀。
- `refx` 這次在 `26` 小時條件內命中 `20260404-06.md` 1 筆；內容偏宏觀風險與避險資產，對 `XAUt / PAXG` 判讀最有幫助，對大多數山寨則只能當背景。
- 今天最像中期觀察組的是 `ICP / NEAR / XAUt / PAXG`；`LIT / RAY / BSV / QTUM / NEO` 仍較像事件或反彈交易。

### 本次踩坑
- `CMC AI` 的 FAQ 問句鍵名是依 symbol 組成，例如 `What is the latest news on FIL?`，但有些幣的 roadmap 第一條可能為空字串；報告生成時要容忍缺欄位。
- `YFI` 這類標的雖然有 CMC AI 頁，但最近有效內容常回到 `2025Q4` 舊 exploit 或合規事件，不能誤寫成「今天的新催化」。
- `crypto.news` 與 `CoinGecko News` 對這次 11 檔命中率仍不高；若沒有高可信直接新訊，繼續以 `CMC AI` 作主來源會比較穩。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json`。
- 再直接批量抽 `CMC AI` FAQ，優先寫 `latest news + people are saying`，必要時再補其他站。
- `refx` 持續只看 `CreationTime` 26 小時內的新檔，不要回收舊檔混進今日結論。

## 2026-04-05

### 本次新增觀察
- 今天沿用 `C:\Users\phidi\.codex\worktrees\2492\Crypto\scripts\automation_daily_crypto_report.ps1`，並把 `-OutputRoot` 指到目前 worktree，可穩定抓到 `164` 筆 Trending、`61` 檔清單1、`13` 檔清單2。
- `refx` 在 `26` 小時條件內命中 `20260404-06.md`、`20260404-15.md`、`20260405-07.md` 共 `3` 份；這次比前幾天更有用，因為可直接補「Fear 28、Q1 成交量 90% 來自衍生品、BTC ETF 仍有淨流入、USDT 流入 Binance 待命」這些市場背景。
- `CMC AI` 的 `learn-faq` 仍是最穩的逐幣來源；今天對 `ENS / ICP / LTC / LIT / KCS / HYPE / NEAR / CAKE / NEO / ETC / ZEC / QTUM / EDGE` 全部都能直接抽到 `latest news` 與 `people are saying`。
- `crypto.news` 與 `CoinGecko News` 這次對清單2 命中率依舊偏低；除了 `QTUM` 可找到偏交易流的 `crypto.news` 文章外，多數標的沒有比 `CMC AI / CMC Community` 更高可信的新催化，接受「沒有更強外部新訊」本身就是結論。

### 本次踩坑
- `CMC AI` 內容有時會混入較舊的社群貼文或技術分析，不要把 `people are saying` 直接當成當日事實；要優先以 `latest news` 區塊的日期較新事件為主，再用社群段落補情緒與關鍵價位。
- `Invoke-WebRequest` 抓 `CMC AI` 時，若直接取整頁第一段容易混入 SEO 文案；正確做法是 regex 抓 `<script type=\"application/ld+json\" data-type=\"learn-faq\">` 內的 JSON。
- 主工作樹 `E:\\work\\Crypto` 仍有 user 既有 `.gitignore` 修改；commit 時只 add `TrackingList_20260405.md` 與 `Recommand.md`，不要把 unrelated 變更一起送出。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json` 與 `summary.json`。
- 再批量抽 `CMC AI` FAQ，先用 `latest news` 定事件，再用 `people are saying` 補情緒與支撐/壓力位。
- `refx` 若 26 小時內命中超過 1 份，優先抽共同主線，不要把每份文件的細節逐條搬進報告。

## 2026-04-06

### 本次新增觀察
- 今天沿用 `C:\Users\phidi\.codex\worktrees\2492\Crypto\scripts\automation_daily_crypto_report.ps1`，並把 `-OutputRoot` 指到目前 worktree，可穩定抓到 `163` 筆 Trending、`60` 檔清單1、`15` 檔清單2，代表今天 RSI 可視列剛好能回到完整名單。
- 直接用 `Href -> slug -> https://coinmarketcap.com/cmc-ai/<slug>/latest-updates/` 批量抽 `learn-faq` JSON，今天對 15 檔全部命中，足夠整理 `latest news` 與部分 `people are saying`。
- `refx` 在 `26` 小時條件內命中 `20260405-07.md`、`20260405-21.md`、`20260406-07.md` 共 3 份；這次最有用的不是單一幣訊，而是三條市場背景主線：`BTC 機構/企業買盤加強`、`DeFi/perps infra 安全折價擴大`、`wallet/self-custody 入口敘事升溫`。

### 本次踩坑
- `CMC AI` 某些幣（例如 `BTC`）的 TLDR 區段不一定維持 `1. 2. 3.` 編號格式，若要自動抽 headline，不要只依賴固定 numbering。
- `crypto.news` 與 `CoinGecko News` 今天對大多數清單2 標的仍然低命中，尤其 `DCR / GT / CVX / KCS / LIT` 這類中型或平台型資產，外部搜尋噪音仍比 `CMC AI / Community` 高。
- 主工作樹 `E:\\work\\Crypto` 今天仍有 user 既有 `.gitignore` 修改，且有未追蹤 `.playwright-cli/`；commit 時只 add `TrackingList_20260406.md` 與 `Recommand.md`，不要把其他變更一起送出。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json` 與 `cmc-ai.json`。
- 再把 `refx` 的共同主線先抽出來，回填到報告的市場背景，而不是逐檔硬塞無關推文。
- 若 `crypto.news / CoinGecko News` 沒有提供比 `CMC AI` 更高品質的新訊，就明講「未見更強外部催化」，不要為了形式硬補來源。
