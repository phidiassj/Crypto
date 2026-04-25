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
- `CMC AI` 逐幣頁今天仍是最穩的逐檔補資料來源；`LIT / MORPHO / LPT / ICP / LINK / XAUt / PAXG / AR / ZEN / QTUM` 都能直接拿到可用摘要。

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
- 先跑 automation 腳本生成 `target-list-2.json`，再針對清單2 逐檔補 `CMC AI`。
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
- 主工作樹 `E:\\work\\Crypto` 今天仍有 user 既有 `.gitignore` 修改與未追蹤 `.playwright-cli/`；commit 時只 add `TrackingList_20260406.md` 與 `Recommand.md`，不要把其他變更一起送出。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json` 與 `cmc-ai.json`。
- 再把 `refx` 的共同主線先抽出來，回填到報告的市場背景，而不是逐檔硬塞無關推文。
- 若 `crypto.news / CoinGecko News` 沒有提供比 `CMC AI` 更高品質的新訊，就明講「未見更強外部催化」，不要為了形式硬補來源。

## 2026-04-07

### 本次新增觀察
- 今天沿用 `playwright-cli` + 共享 session `aiyoperps-auth` 與 persistent profile，直接在目前 worktree 落 `.cache/daily-crypto-report/20260407/`，可穩定抓到 `160` 筆 Trending、`60` 檔清單1、`14` 檔清單2。
- 今天 `CMC AI` 對清單2 的 14 檔全部都能直接命中 `learn-faq` JSON；把 `LatestNews / PeopleSaying / Roadmap` 先抽成簡化 bullet，再寫報告，會比人工逐頁讀更穩。
- `refx` 在 26 小時條件內命中 `4` 份，今天最有用的仍是共同主線，不是逐幣訊息：`BTC / ETH 機構敘事延續`、`穩定幣 / 支付 rails / 合規` 偏多、`DeFi / perp infra` 仍有安全折價、`伊朗 / 荷姆茲海峽 / 通膨` 讓大盤高波動。

### 本次踩坑
- PowerShell 函式內不要把參數命名成 `$Args`；會和自動變數衝突，導致 `playwright-cli` 收到 `Unknown command: undefined`。
- `CMC AI` 的 `PeopleSaying` 不一定有標準化價格位，且有些內容時間較舊；適合拿來補情緒或支撐/壓力，不適合直接當當日新催化。
- 今天 `crypto.news / CoinGecko News` 對多數清單2 標的依舊沒有比 `CMC AI / Community` 更高訊號的新增內容；若外部搜尋沒補強，就保留 `未見更強外部催化` 的寫法即可。

### 下次優先順序
- 先用 Playwright 生成 `target-list-2.json`，再批量抽 `cmc-ai.json` 與 `coin-notes.json`。
- `refx` 持續只看 `CreationTime` 26 小時內的新檔，先抽共同主線，再決定哪些幣需要特別回填。
- 若清單2 低於 `15` 檔，就維持實際檔數，不要為了形式硬補。

## 2026-04-08

### 本次新增觀察
- 今天沿用 `C:\Users\phidi\.codex\worktrees\2492\Crypto\scripts\automation_daily_crypto_report.ps1`，並把 `-OutputRoot` 指到目前 worktree，可穩定抓到 `164` 筆 Trending、`62` 檔清單1、`15` 檔清單2。
- `refx` 在 `26` 小時條件內命中 `20260407-12.md`、`20260407-18.md`、`20260408-07.md` 共 `3` 份；這次最有用的共同主線是 `中東風險暫時降溫`、`BTC 重新站回 70k / 71k`、`穩定幣 / 支付 / 交易所擴張`。
- 今天的主觀強勢組從前幾日的 `BTC / ETH / LINK`，明顯切到 `SOL / BNB / XRP / HYPE / ZRO` 這種更直接承接 risk-on 與法規/基建敘事的標的。
- `CMC AI` 逐幣頁今天仍可穩定覆蓋清單2 全部 15 檔；對 `HNT / BNB / SOL / XRP / ENS / LTC / XAUt / DASH / PAXG / ZRO / ICP / FIL / HYPE` 都能直接抽出 `LatestNews / PeopleSaying / Roadmap`。

### 本次踩坑
- `CoinGecko News` 以搜尋方式做批量補充，仍容易命中報告 PDF 或無關搜尋結果，命中率明顯低於 `CMC AI / CMC Community`。
- `crypto.news` 這次不是每檔都有高品質新稿；實際較有補強價值的是 `SOL / XRP / HYPE` 這些大型或高流量標的，其餘多數仍以 `CMC AI` 訊號較乾淨。
- `CMC AI` 的社群段落會混入較舊的 technical takes，拿來抓 `支撐 / 壓力 / 市場情緒` 有用，但不能直接當作當日新催化。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json` 與 `cmc-ai.json`。
- 再先抽 `refx` 的共同主線，確認市場是 `risk-on` 還是 `避險`，再決定高 beta 組與黃金代幣組的權重。
- 外部新聞優先順序建議為：`CMC AI / CMC Community` > `crypto.news`（只補大幣或高流量標的） > `CoinGecko News`。

## 2026-04-09

### 本次新增觀察
- 今天沿用 `C:\Users\phidi\.codex\worktrees\2492\Crypto\scripts\automation_daily_crypto_report.ps1`，並把 `-OutputRoot` 指到目前 worktree，可穩定抓到 `163` 筆 Trending、`58` 檔清單1、`15` 檔清單2。
- `refx` 在 `26` 小時條件內命中 `20260408-07.md`、`20260408-13.md`、`20260408-19.md`、`20260409-07.md` 共 `4` 份；最重要的共同主線是 `美伊停火 -> 油價回落 -> 風險資產回暖`，以及 `stablecoin / 支付 rails / ETF 金融化`。
- `CMC AI` 逐幣頁今天仍可穩定覆蓋清單2 全部 15 檔；用 `Href -> slug -> /cmc-ai/<slug>/latest-updates/` 直接抽 FAQ JSON 仍是最高效率做法。
- `crypto.news` 這次真正有補強價值的只有少數標的，例如 `CVX` 的賣壓來源與 `ETH` / `MORPHO` 的基金會 treasury 管理；多數標的沒有比 `CMC AI / Community` 更強的逐幣新訊。

### 本次踩坑
- `CoinGecko News` 這次對清單2 的直接搜尋大多回首頁、歷史價格或非逐幣新聞頁，仍不適合批量當主來源。
- `CMC AI` 的 `people are saying` 有時缺少明確 `consensus` 或混入較舊觀點；報告主體還是應以 `latest news` 為主、社群段落為輔。
- 主工作樹 `E:\\work\\Crypto` 仍有 user 既有 `.gitignore` 修改與未追蹤 `.playwright-cli/`；commit 時只 add `TrackingList_20260409.md` 與 `Recommand.md`，不要把 unrelated 變更一起送出。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json`。
- 再先讀 `refx` 26 小時內檔案，判斷市場背景是 `risk-on`、`避險` 還是 `監管驅動`，再決定報告主觀強勢組。
- 外部新聞優先順序建議為：`CMC AI / CMC Community` > `crypto.news`（只補少數高價值標的） > `CoinGecko News`。

## 2026-04-10

### 本次新增觀察
- 今天沿用 `C:\Users\phidi\.codex\worktrees\2492\Crypto\scripts\automation_daily_crypto_report.ps1`，並把 `-OutputRoot` 指到目前 worktree，可穩定抓到 `165` 筆 Trending、`62` 檔清單1、`15` 檔清單2。
- `refx` 在 `26` 小時條件內命中 `20260409-07.md`、`20260409-15.md`、`20260409-21.md`、`20260410-07.md` 共 `4` 份；今天最重要的共同主線不是全面 risk-on，而是 `中東風險溢價仍在`、`能源與通膨壓力未退`、`資金更集中到 BTC / ETF / 支付 rails / 合規基建`。
- 直接用 `Href -> slug -> https://coinmarketcap.com/cmc-ai/<slug>/latest-updates/` 批量抽 `learn-faq` JSON，今天對清單2 的 15 檔全部命中，足夠整理 `LatestNews / Roadmap`。
- 今天 `crypto.news` 直接站內搜尋命中率依舊很低，多數只回站點固定頁；`CoinGecko News` 可開但不適合批量逐幣補新聞。若外部站沒有更高可信逐幣訊號，維持以 `CMC AI / Community` 為主較穩。

### 本次踩坑
- `crypto.news/?s=<keyword>` 對這批幣多半只回 `about / buy-crypto / events` 等靜態頁，不要把站內搜尋當主要自動化入口。
- `CMC AI` 有些幣只有 `LatestNews / Roadmap` 沒有可靠的 `PeopleSaying`，報告主體仍應以 `latest news` 為主，社群段落為輔。
- 主工作樹 `E:\\work\\Crypto` 今天仍有 user 既有 `.gitignore` 修改與未追蹤 `.playwright-cli/`；commit 時只 add `TrackingList_20260410.md` 與必要的 `Recommand.md`，不要把其他變更一起送出。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json` 與 `cmc-ai.json`。
- 再先讀 `refx` 26 小時內檔案，判斷市場背景是偏 `BTC / 合規基建`、`防守避險`，還是重新回到高 beta。
- 外部新聞優先順序建議為：`CMC AI / CMC Community` > `crypto.news`（只補少數命中的大型或高流量標的） > `CoinGecko News`。

## 2026-04-11

### 本次新增觀察
- 今天沿用 `C:\Users\phidi\.codex\worktrees\2492\Crypto\scripts\automation_daily_crypto_report.ps1`，並把 `-OutputRoot` 指到目前 worktree，可穩定抓到 `163` 筆 Trending、`60` 檔清單1、`11` 檔清單2。
- `refx` 在 `26` 小時條件內命中 `20260410-07.md`、`20260410-13.md`、`20260410-19.md`、`20260411-07.md` 共 `4` 份；今天最重要的共同主線是 `Hormuz / 油價 / 通膨風險未退`、`BTC / 機構化商品 / 合規基建` 仍是主資金偏好、`prediction markets / wallet trading / AI agents` 開始變成交易入口競爭。
- 直接用 `Href -> slug -> https://coinmarketcap.com/cmc-ai/<slug>/latest-updates/` 批量抽 `learn-faq` JSON，今天對清單2 的 `11` 檔全部命中；`latest news` 夠用，但 `people are saying` 仍常常缺值，報告應持續以 `latest news` 為主。
- 今天清單2 明顯偏向 `平台幣 / 基建幣 / Solana 生態 beta`，不太像全面 altseason；`SOL / MNT / LIT / OKB` 的事件線與承接度相對完整。

### 本次踩坑
- `CoinGecko News` 對這 11 檔依舊容易回首頁、報告 PDF 或歷史行情頁，仍不適合批量逐幣當主來源。
- `crypto.news` 這次即使有單篇命中，也多半已被 `CMC AI` 摘要覆蓋；與其逐檔硬搜，不如接受「未見更高可信外部催化」本身就是有效結論。
- 主工作樹 `E:\\work\\Crypto` 今天仍有 user 既有 `.gitignore` 修改與未追蹤 `.playwright-cli/`；commit 時只 add `TrackingList_20260411.md` 與必要的 `Recommand.md`，不要把其他變更一起送出。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json` 與 `cmc-ai.json`。
- 再先讀 `refx` 26 小時內檔案，判斷市場背景是偏 `BTC / 合規基建`、`防守`，還是重新回到 `高 beta / Solana 生態`。
- 若清單2 只有 `10-12` 檔，就維持實際筆數，不要為了形式硬補滿 `15`。

## 2026-04-12

### 本次新增觀察
- 今天沿用 `C:\Users\phidi\.codex\worktrees\2492\Crypto\scripts\automation_daily_crypto_report.ps1`，並把 `-OutputRoot` 指到目前 worktree、`-ProfilePath` 改成 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `167` 筆 Trending、`62` 檔清單1、`9` 檔清單2。
- 今天 `CMC AI` 逐幣頁對清單2 的 `9` 檔全部可直接命中 `learn-faq` JSON；`LatestNews` 仍是最穩的逐幣來源，`PeopleSaying / Roadmap` 依舊不穩定。
- `refx` 在 `26` 小時條件內命中 `2` 份，但其中 `20260411-13.md` 是 X timeline 擷取失敗紀錄；整理市場背景時要排除這種「失敗日誌」，不要把它和有效市場訊號混在一起。

### 本次踩坑
- `refx` 不能只看時間條件，還要判斷檔案性質；若內容明確寫的是登入失敗、抓取失敗或無法取得時間軸，應視為執行紀錄，不是市場資料。
- 今天 `crypto.news` 與 `CoinGecko News` 對 `BGB / HNT / PENDLE / NEXO / CAKE / ZEN` 等標的，依舊很難穩定命中比 `CMC AI / Community` 更高品質的逐幣新訊；若沒有更強來源，維持 `未見更強外部催化` 的寫法即可。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json`。
- 再先讀 `refx` 26 小時內檔案，但先把「失敗日誌」和「有效市場整理」分開。
- 若清單2 低於 `10` 檔，就維持實際檔數，並優先加強每檔的事件線品質，而不是硬補數量。
## 2026-04-13

### 本次新增觀察
- 今天沿用 `C:\Users\phidi\.codex\worktrees\2492\Crypto\scripts\automation_daily_crypto_report.ps1`，並把 `-OutputRoot` 指到目前 worktree、`-ProfilePath` 指向 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `163` 筆 Trending、`60` 檔清單1、`6` 檔清單2。
- 今日 `refx` 在 `26` 小時條件內命中 `4` 份，且這次沒有混入失敗日誌；共同主線很一致，都是 `Hormuz / 美伊談判破局 / 油價與美元避險走強`，以及 `BTC / 穩定幣 / DeFi 基礎設施` 仍保有中期敘事。
- `CMC AI` 逐幣頁今天對 `LPT / ZRO / SIREN / LIT / ETH / NEAR` 全部可直接命中 `learn-faq` JSON，足夠整理 `LatestNews` 與部分 `PeopleSaying / Roadmap`；外部站沒有持續補出比這更高訊號的逐幣內容。

### 本次踩坑
- 清單2 只剩 `6` 檔時，不要為了形式硬補標的；應改成加強每檔的事件線與風險描述，尤其是 `SIREN` 這種高波動題材幣。
- `Security Scan = --` 的幣仍可能進入清單1，因為任務只排除 `Caution / unknow`；報告內要明寫 `--` 不等於安全，避免誤讀成已通過安全檢查。
- `crypto.news` 與 `CoinGecko News` 今天對這 6 檔仍沒有穩定提供比 `CMC AI / Community` 更新、且更聚焦的內容；若沒有更強外部催化，就直接保留這個結論，不要硬湊來源。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json`。
- 若清單2 低於 `8-10` 檔，優先把 `CMC AI latest news + roadmap + refx 共同主線` 組成高密度報告，而不是硬補數量。
- 對 `Security Scan = --` 的候選，後續可考慮額外補一層快速風險註記，但不要改動目前的既有篩選條件。

## 2026-04-14

### 本次新增觀察
- 今天沿用 `C:\Users\phidi\.codex\worktrees\2492\Crypto\scripts\automation_daily_crypto_report.ps1`，並把 `-OutputRoot` 指到目前 worktree、`-ProfilePath` 指向 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `164` 筆 Trending、`61` 檔清單1、`12` 檔清單2。
- `refx` 在 `26` 小時條件內命中 `20260413-08.md`、`20260413-14.md`、`20260413-20.md`、`20260414-07.md` 共 `4` 份；今天最有用的共同主線是 `Hormuz / 美伊 / 油價與美元風險溢價仍高`，但同時 `ETP/ETF 資金流、Strategy/BTC treasury、MiCA/SEC/tokenization` 仍偏中期正向。
- 今天 `CMC AI` 對清單2 的 `12` 檔全部可直接命中 `learn-faq` JSON；真正能被外部站補強的只有少數高流量標的，例如 `LINK / SOL / XRP / AAVE`，其餘多數仍以 `CMC AI / Community` 最完整。
- 今日最值得優先追蹤的是 `AAVE / LINK / FIL` 這類有產品、治理或基建推進的標的；`CVX / YFI` 則更像反彈交易而不是新主線。

### 本次踩坑
- `ConvertTo-Json` 序列化批量 `CMC AI` 結果時，若誤用 PowerShell 自帶唯讀變數名例如 `$Error`，會直接報錯；延續前次經驗，函式內參數與暫存變數都要避開保留名稱。
- `crypto.news` 與 `CoinGecko News` 今天依舊不適合批量逐幣當主來源；若用一般搜尋一次丟太多小幣，命中結果很容易退化成價格頁、PDF 或舊資料。
- `Security Scan = --` 這次再次大量出現在 `BNB / XRP / SOL / GT / AR / FIL` 等候選中；報告內必須繼續明講「未標記不等於安全」，避免被誤讀成已通過安全檢查。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json` 與 `cmc-ai.json`。
- 再先讀 `refx` 26 小時內檔案，確認市場是 `宏觀風險壓制下的結構分化`，還是重新回到全面 risk-on，之後再決定高 beta 組與核心組權重。
- 外部新聞優先順序建議為：`CMC AI / CMC Community` > `crypto.news`（只補少數大型或高流量標的） > `CoinGecko News`。

## 2026-04-15

### 本次新增觀察
- 今天在主 repo 新增本地腳本 `scripts/automation_daily_crypto_report.ps1`，直接以 `E:\work\browser-profiles\x-playwright` 跑 Playwright；`2026-04-15 08:10` 最新快照穩定抓到 `160` 筆 Trending、`59` 檔清單1、`13` 檔清單2。
- 直接沿用 `Href -> slug -> https://coinmarketcap.com/cmc-ai/<slug>/latest-updates/` 批量抽 `learn-faq` JSON，今天對 `RIVER / APT / BNB / XRP / OKB / AR / AAVE / NEO / GT / NEXO / PAXG / XAUt / EDGE` 全部命中，仍是逐幣事件線最穩來源。
- `refx` 在 `26` 小時條件內命中 `20260414-07.md`、`20260414-13.md`、`20260414-19.md`、`20260415-07.md` 共 `4` 份；今天最有用的共同主線已從單純宏觀避險，轉成 `risk-on 修復 + 合規平台/交易基建/支付 rails 升溫`，同時黃金代幣仍受平台分發與避險需求支撐。

### 本次踩坑
- `crypto.news` 站內搜尋 `?s=<keyword>` 今天仍幾乎只回固定頁、分類頁或低訊號結果，不適合批量逐幣當主來源。
- `CoinGecko News` 今天也沒有穩定提供比 `CMC AI / Community` 更新、更聚焦的逐幣消息；若搜尋沒有補到東西，應接受「外部新訊不足」本身就是結論。
- `Security Scan = --` 今天再次大量出現在 `APT / BNB / XRP / OKB / GT` 等候選，報告內仍要明講「未標記不等於安全」。

### 下次優先順序
- 先跑本地 `scripts/automation_daily_crypto_report.ps1` 生成 `target-list-2.json` 與 `cmc-ai.json`。
- 再先讀 `refx` 26 小時內檔案，判斷市場是否延續 `risk-on + 合規平台主線`，或重新切回 `宏觀避險`。
- 外部新聞優先順序建議為：`CMC AI / CMC Community` > `crypto.news`（只補少數大型或高流量標的） > `CoinGecko News`。

## 2026-04-17

### 本次新增觀察
- 今天直接沿用主 repo 的 `scripts/automation_daily_crypto_report.ps1`，並指定 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `163` 筆 Trending、`62` 檔清單1、`3` 檔清單2。
- 今日清單2 極度收斂到 `IP / TRUMP / ENS` 三檔，代表不是市場遍地超跌，而是只有少數熱門標的同時符合 `價格門檻 + 安全條件 + RSI <= 60`。
- `CMC AI` 仍是最穩的逐幣主來源：`IP` 可直接抓到 `4/16 Confidential Data Rails testnet` 與 `4/11 Grayscale 候選名單`，`TRUMP` 可直接抓到 `4/25 Mar-a-Lago holder gala`，`ENS` 可抓到 `ENS Explorer` 與 `Trend Research` 約 `550 萬美元` 的持倉訊號。
- `refx` 在 `26` 小時條件內命中 `4` 份，這次最有用的共同主線是 `中東停火 / 伊朗協議預期 -> 油價與通膨壓力緩和 -> 風險資產修復`，再疊加 `tokenization / stablecoin / ETF / 機構入口`。

### 本次踩坑
- 當清單2 只剩 `3` 檔時，不要為了形式硬補標的；應改成提高單檔敘事品質，並明講這是 `RSI 可視資料` 與熱門榜交叉後的實際結果。
- `crypto.news` 與 `CoinGecko News` 今天對 `IP / ENS` 沒有穩定提供比 `CMC AI` 更新、更聚焦的逐幣催化；接受「外部新訊有限」本身就是結論。
- `IP` 的 `Security Scan = --` 仍需明講「未標記不等於安全」；不要因為它通過本次過濾就暗示安全性已確認。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json`；若清單2 小於 `5` 檔，直接改成高密度報告，不要硬補滿。
- `IP / ENS` 這類基礎設施幣優先補 `CMC AI / Community` 與市場背景；`TRUMP` 這類事件幣則優先確認活動日期、持幣條件與團隊錢包動向。
- `refx` 若持續呈現 `風險資產修復 + tokenization / stablecoin` 主線，後續優先注意基礎設施與機構入口類標的，而不是純 meme 輪動。

## 2026-04-18

### 本次新增觀察
- 今天直接沿用主 repo 的 `scripts/automation_daily_crypto_report.ps1`，並指定 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `162` 筆 Trending、`62` 檔清單1、`7` 檔清單2。
- 今日清單2 回升到 `7` 檔，但仍不是適合硬補 `15` 檔的日子；應維持高密度報告，主體集中在 `IP / ETHFI / BNB / MX / HNT / GAS / BSV`。
- `refx` 在 26 小時條件內命中 `3` 份，最有用的共同主線不再是單一停火利多，而是「Hormuz 風險溢價仍在」與「USDC Bridge / wXRP / USDT 流動 / DeFi TVL 回升」並存，代表市場同時交易宏觀風險與鏈上流動性改善。
- `CMC AI` 仍是最穩的逐幣來源；今天對 `MX / IP / HNT / GAS / ETHFI / BSV / BNB` 全部都能直接命中 `learn-faq` JSON，其中時間最接近當日的訊號主要集中在 `IP / ETHFI / BNB / HNT`。

### 本次踩坑
- `CoinGecko News` 這次對這 7 檔依舊沒有穩定補出可直接引用的逐幣新訊，搜尋結果常回首頁、歷史頁或產業報告頁；若沒有新增高可信內容，應直接保留「未見更強外部催化」。
- `crypto.news` 對今天這批標的大多只有較舊背景稿，只有 `IP / ETHFI` 勉強可作次級背景來源；不要把舊稿誤寫成當日新催化。
- `Security Scan = --` 今天再次出現在 `IP / GAS / BSV / BNB`，報告內仍必須明講「未標記不等於安全」。

### 下次優先順序
- 先跑 automation 腳本生成 `target-list-2.json`；若清單2 低於 `8` 檔，就維持實際檔數，重點放在單檔事件線與市場背景密度。
- 再先讀 `refx` 26 小時內檔案，判斷市場到底是偏 `宏觀風險殘留` 還是 `鏈上流動性改善` 主導，之後再決定優先追蹤高 beta 題材或平台/基建幣。
- 對 `IP / ETHFI / BNB` 優先補 `CMC AI / Community`；`MX / HNT` 補平台或機構 watchlist 脈絡即可；`GAS / BSV` 若外部站沒有新訊，就接受它們更像反彈觀察組。

## 2026-04-19

### 本次新增觀察
- 今天直接沿用主 repo 的 `scripts/automation_daily_crypto_report.ps1`，並指定 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `161` 筆 Trending、`61` 檔清單1、`7` 檔清單2。
- `refx` 在 `26` 小時條件內命中 `5` 份，這次最有用的共同主線是：`Hormuz / 油運 / 航運保險風險升高` 壓抑高 beta，但 `BTC ETF / 穩定幣 rails / 合規支付基礎設施` 仍對大型與制度化敘事偏多。
- 今天可以明確把 `rsETH / Kelp DAO exploit -> Aave 凍結 rsETH 市場 -> Ethereum / 再質押信用層承壓` 當成市場背景，而不是只寫成單點 DeFi 新聞；這對 `ETH beta` 判讀很重要。
- `CMC AI` 仍是最穩的逐幣主來源；`crypto.news` 這次只有 `XRP / LTC` 勉強補出可用次級背景，對 `BNB / XMR / EGLD / MX / AR` 沒有比 `CMC AI / Community` 更近、更聚焦的逐幣催化。

### 本次踩坑
- `CoinGecko News` 對今天這批 `7` 檔依舊不適合批量逐幣取材，命中大多是價格頁、研究報告或非逐幣頁面，不要硬把它當主要來源。
- `MX` 這類平台幣在 `CMC AI` 上最近常只剩舊 burn 與平台營運資訊；若外部站沒有新訊，就接受「缺乏新催化」本身就是有效結論。
- `Security Scan = --` 今天再次大量出現在 `LTC / BNB / XMR / EGLD / XRP / AR`，報告內必須持續明講「未標記不等於安全」。

### 下次優先順序
- 先跑本地 `scripts/automation_daily_crypto_report.ps1` 生成 `target-list-2.json`。
- 再先讀 `refx` 26 小時內檔案，先判斷市場主線是否仍是 `宏觀風險 + BTC/穩定幣支撐` 的拉扯，或重新轉回全面 risk-on。
- 外部新聞優先順序建議為：`CMC AI / CMC Community` > `crypto.news`（只補少數真正命中的大幣） > `CoinGecko News`。

## 2026-04-20

### 本次新增觀察
- 今天直接沿用主 repo 的 `scripts/automation_daily_crypto_report.ps1`，並指定 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `164` 筆 Trending、`61` 檔清單1、`8` 檔清單2。
- 今日清單2 為 `BGB / MX / ASTER / HNT / ZEN / XMR / PENDLE / AR`；這次比前兩日更偏 `交易所 / 支付 rails / DePIN / 合規隱私計算`，而不是全面高 beta 反彈。
- `CMC AI` 對清單2 的 `8` 檔全部可直接命中 `learn-faq` JSON；真正有額外補強價值的 `crypto.news` 只有少數幾檔，例如 `BGB` 的 `VIP Fast Track`、`ASTER` 的 `buyback / mainnet` 背景。`CoinGecko News` 對這批標的仍多數只回價格頁或泛用介紹。
- `refx` 在 `26` 小時條件內命中 `4` 份；今天最有用的共同主線不是單純 risk-on，而是 `Hormuz / 伊朗 / 能源風險未退`、`Aave / rsETH` 壓抑 ETH / DeFi 信用層，同時 `交易所產品 / 穩定幣結算 / 支付基建` 仍偏多。

### 本次踩坑
- `CMC AI` 的最新消息雖然穩，但部分標的會混入較舊文章或分析文，例如 `AR / MX`；整理時要明確區分「近期事件」與「中期敘事」，不要把舊文包裝成當日新催化。
- `BGB / XMR / AR` 今天都出現 `Security Scan = --`；報告內要繼續明講「未標記不等於安全」，避免讀者誤解成已通過安全檢查。
- `CoinGecko News` 今天再次證明不適合批量逐幣當主來源；對這批清單2 幾乎沒有比 `CMC AI / Community` 更新、且更聚焦的內容。

### 下次優先順序
- 先跑本地 `scripts/automation_daily_crypto_report.ps1` 生成 `target-list-2.json`。
- 若清單2 低於 `10` 檔，就維持實際檔數，優先提高每檔事件線與市場背景密度，不要為了形式硬補滿 `15`。
- 外部新聞優先順序建議為：`CMC AI / CMC Community` > `crypto.news`（只補少數真正命中的標的） > `CoinGecko News`。

## 2026-04-21

### 本次新增觀察
- 今天直接沿用主 repo 的 `scripts/automation_daily_crypto_report.ps1`，並指定 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `161` 筆 Trending、`60` 檔清單1、`7` 檔清單2。
- 今日清單2 為 `ASTER / LINK / RAY / BNB / ZEN / XRP / PENDLE`；整體偏 `perp DEX / RWA oracle / Solana DEX / 平台幣 / yield DeFi / XRP institutional rails`，不是全面 altseason。
- `CMC AI` 對 7 檔全部可直接命中 `learn-faq` JSON，今天最有用的逐幣新訊是 `ASTER 15M users`、`LINK / KAIO / Tether tokenization`、`RAY / EURAU on Raydium`、`PENDLE real yield demand`、`XRP regulatory / triangle setup`。
- `refx` 在 `26` 小時條件內命中 `20260420-18.md` 1 份；共同主線是 `BTC ETF / 加密基金流入偏多`、`CEX stablecoin 調度與 USDC loans`，但 `Kelp / rsETH / LayerZero` 事件仍壓抑 DeFi 風險偏好，`Hormuz / 伊朗 / 油價` 仍是宏觀波動源。

### 本次踩坑
- `CoinGecko News` 對今天這批標的仍大多回價格頁、歷史資料或舊研究文，不適合批量逐幣當主來源。
- `crypto.news` 只有少數標的提供可用背景，且很多不是當日新聞；寫報告時要明確區分「近期背景」與「今日催化」。
- `BNB / XRP` 今天的 `Security Scan = --`，仍需在報告明講「未標記不等於安全」。

### 下次優先順序
- 先跑本地 `scripts/automation_daily_crypto_report.ps1` 生成 `target-list-2.json`。
- 再批量抽 `CMC AI learn-faq`，以 `latest news` 作主體、`people are saying` 只補情緒與支撐壓力。
- 若 CoinGlass 仍無法穩定批量取值，清算區繼續用現價、近期支撐阻力、整數關卡與社群提及價位推估，並在報告明確標示。

## 2026-04-22

### 本次新增觀察
- 今天直接沿用主 repo 的 `scripts/automation_daily_crypto_report.ps1`，並指定 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `163` 筆 Trending、`61` 檔清單1、`11` 檔清單2。
- 今日清單2 為 `BCH / CVX / DASH / LTC / NEXO / RAY / BNB / LINK / NEAR / ZEN / PENDLE`；整體偏 `老牌支付鏈 / DeFi 收益 / RWA oracle / Solana DEX / BNB 生態 / AI 與隱私基建`，不是全面高 beta 題材。
- `CMC AI` 對清單2 的 11 檔全部可直接命中 `learn-faq` JSON；逐幣主線以 `LINK RWA/KAIO/Tether`、`BNB burn + hard fork roadmap`、`PENDLE real yield / Boros / RWA pools`、`RAY wXRP / EURAU pools`、`LTC LitecoinVM / Coinbase UK collateral` 最有用。
- `refx` 在 `26` 小時條件內命中 `20260421-15.md`、`20260421-21.md`、`20260422-07.md` 共 3 份；共同主線是 `BTC ETF / Strategy 持倉 / 機構配置` 支撐大型資產，但 `Warsh 利率訊號 / Iran-Hormuz / KelpDAO-Arbitrum-LayerZero exploit / NY AG 預測市場訴訟` 讓風險偏好分歧。

### 本次踩坑
- `crypto.news` 與 `CoinGecko News` 對今日 11 檔多數仍只回舊稿、價格頁、產業報告或非逐幣頁面；只有少數大型幣可作背景，不適合批量當主來源。
- `CMC AI` 的社群段落可能混入舊技術分析或高波動價格喊單，報告主體仍應以 `latest news / roadmap` 為主，`people are saying` 只用來補支撐壓力與情緒。
- 今日 `BCH / DASH / LTC / BNB / NEAR` 的 `Security Scan = --`；報告內仍需明講「未標記不等於安全」。

### 下次優先順序
- 先跑本地 `scripts/automation_daily_crypto_report.ps1` 生成 `target-list-2.json`。
- 再批量抽 `CMC AI learn-faq`，優先寫 `latest news + roadmap`，社群段落只補情緒與支撐壓力。
- 若外部站沒有比 `CMC AI / refx` 更聚焦的新訊，就不要硬湊新聞；直接標記為「未見更強外部催化」。

## 2026-04-23

### 本次新增觀察
- 今天直接沿用主 repo 的 `scripts/automation_daily_crypto_report.ps1`，並指定 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `165` 筆 Trending、`62` 檔清單1、`8` 檔清單2。
- 今日清單2 為 `RIVER / IP / BGB / BCH / NEXO / BNB / NEAR / ETH`；整體偏 `主流 ETH / 平台幣 / 支付鏈 / AI x IP / 高波動新幣`，不是全面山寨幣超跌。
- `CMC AI` 對 8 檔全部可直接命中 `learn-faq` JSON；最有用的逐幣線索是 `BNB 4/28 Osaka/Mendel hard fork`、`BGB Morph payment accelerator + VIP Fast Track`、`NEXO U.S. compliance return`、`ETH Kelp DAO exploit vs long-term monetary thesis`。
- `refx` 在 `26` 小時條件內命中 4 份；共同主線是 `BTC/ETH 反彈 + 機構流入`，但 `Hormuz/Iran 通膨風險` 與 `Kelp/Volo DeFi 安全事件` 讓高 beta altcoin 仍需保守。

### 本次踩坑
- `RIVER` 雖然 24H RSI 最低，但 CMC AI 明確提到 manipulation / supply concentration warning；低 RSI 不能自動解讀成安全抄底。
- `CoinGecko News` 對今天 8 檔依舊大多回價格頁或泛資料，沒有比 `CMC AI / refx` 更聚焦的新訊。
- 主工作樹 `E:\work\Crypto` 仍有 user 既有 `.gitignore` 修改與未追蹤 `.playwright-cli/`；commit 時只 add `TrackingList_20260423.md` 與 `Recommand.md`，不要把其他變更一起送出。

### 下次優先順序
- 先跑本地 `scripts/automation_daily_crypto_report.ps1` 生成 `target-list-2.json`。
- 若清單2 低於 `10` 檔，就維持實際檔數，優先提高每檔事件線與風險描述，不要硬補滿 15。
- 外部新聞優先順序建議為：`CMC AI / CMC Community` > `crypto.news`（只補真正命中的標的） > `CoinGecko News`。

## 2026-04-24

### 本次新增觀察
- 今天直接沿用主 repo 的 `scripts/automation_daily_crypto_report.ps1`，並指定 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `165` 筆 Trending、`62` 檔清單1、`9` 檔清單2。
- 今日清單2 為 `MNT / TAO / BGB / DASH / BCH / ENS / LTC / BNB / NEAR`；整體偏 `AI / 模組化 L2 / 平台幣 / 老牌支付鏈 / identity`，不是全面 altseason。
- `CMC AI` 對 9 檔全部可直接命中 `learn-faq` JSON；今天最有用的逐幣線索是 `MNT AI hackathon + Bybit/USD1`、`TAO Grayscale 權重上升 + ETF 申請`、`BGB Morph payment accelerator + Cobo`、`BNB Binance.US 低費率 + 4/28 hard fork`、`NEAR AI-native execution vs Rhea exploit`。
- `refx` 在 `26` 小時條件內命中 `20260423-07.md`、`20260423-13.md`、`20260423-19.md` 共 3 份；共同主線仍是 `Hormuz / Iran / 油價 / 美元` 壓制高 beta，但 `ETF / AI 半導體 / 支付 rails / 交易所生態` 仍提供風險資產底部支撐。

### 本次踩坑
- `crypto.news` 站內搜尋這次依舊低命中；即使以逐幣關鍵字查詢，回傳頁面也常缺少可穩定抽取的文章連結，不適合當批量主來源。
- `CoinGecko News` 對今日 9 檔同樣沒有穩定補出比 `CMC AI / Community` 更聚焦的逐幣新訊；很多結果仍是價格頁、教學頁或泛市場內容。
- `ENS` 這類標的即使 `Security Scan = Safe`，近期風險仍可能來自入口基礎設施而不是合約本身；報告不能把 `Security Scan` 直接等同全方位安全。

### 下次優先順序
- 先跑本地 `scripts/automation_daily_crypto_report.ps1` 生成 `target-list-2.json`。
- 再批量抽 `CMC AI learn-faq`，主體優先寫 `latest news + roadmap`，社群段落只補情緒與支撐壓力。
- 若 `crypto.news / CoinGecko News` 仍沒有更高品質逐幣內容，就直接保留「未見更強外部催化」的寫法，不要硬湊來源。

## 2026-04-25

### 本次新增觀察
- 今天直接沿用主 repo 的 `scripts/automation_daily_crypto_report.ps1`，並指定 `E:\work\browser-profiles\x-playwright`，可穩定抓到 `167` 筆 Trending、`64` 檔清單1、`7` 檔清單2。
- 今日清單2 只剩 `LIT / BGB / LTC / EGLD / ORDI / ENS / APT` 七檔，代表今天不是全面超跌，而是少數具交易基建、平台、支付或 BTC 原生敘事的標的同時滿足 `價格門檻 + 安全條件 + RSI <= 60`。
- `CMC AI` 對這 `7` 檔全部都能直接命中 `learn-faq` JSON；其中最有用的是 `LIT` 的 `RWA 流動性激勵 + EVM mainnet`、`BGB` 的 `Morph payment accelerator`、`APT` 的 `post-quantum / institutional infra`。
- `refx` 在 `26` 小時條件內命中 `20260424-14.md`、`20260424-20.md` 共 `2` 份；這次最有用的共同主線是 `BTC ETF / 穩定幣流動性 / RWA 基建偏多`，但 `Hormuz / 伊朗 / 油氣 / 美元` 與 `KelpDAO / Aave` 修復線仍壓抑高 beta 風險偏好。

### 本次踩坑
- `crypto.news` 與 `CoinGecko News` 今天對這 `7` 檔仍然低命中；多數搜尋結果只回價格頁、歷史頁或舊稿，沒有比 `CMC AI / Community` 更近、更聚焦的逐幣催化。
- `ORDI` 雖然量價較強，但 `24H RSI` 已接近上緣，不適合因「仍低於 60」就誤判為低風險超跌。
- `BGB / LTC / EGLD / ORDI / APT` 今天的 `Security Scan = --`；報告內仍要持續明講「未標記不等於安全」。

### 下次優先順序
- 先跑本地 `scripts/automation_daily_crypto_report.ps1` 生成 `target-list-2.json`。
- 若清單2 低於 `8` 檔，就維持實際檔數，優先提高每檔事件線與清算帶估算密度，不要為了形式硬補滿 `15`。
- 外部新聞優先順序建議為：`CMC AI / CMC Community` > `crypto.news`（只補真正命中的標的） > `CoinGecko News`。
