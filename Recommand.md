# Recommand / run notes

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
