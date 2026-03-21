# Tracking List 2026-03-19

產出時間: 2026-03-19 22:13:19 +08:00

## 方法與限制

1. CoinMarketCap `trending-cryptocurrencies` 的靜態頁可抓到頁面標題、欄位與各國 trending 搜尋結果片段，但 global trending 與 RSI 頁面在本次執行環境下沒有吐出完整表格列。
2. 因此本報告用 `CoinMarketCap 各國 trending 頁面搜尋片段` 建立候選池，並用 `CoinMarketCap CMC AI price-analysis` 中可公開抓取的 RSI 敘述作為 24H RSI 的保守替代訊號。這不是對 `https://coinmarketcap.com/charts/rsi/` 的逐列直抓。
3. `Security Scan` 欄位未能從靜態頁逐列抓出；本次採保守法，只保留價格高於 0.8 USD、流動性與知名度相對較高、且未見明顯 `Caution/unknown` 訊號的標的。對題材型或結構風險較高項目，會在備註欄額外提示。
4. CoinGlass 熱力圖頁面同樣不易靜態抓取，因此「空單清算價集中區」以下方最近可公開抓到的壓力/擠壓區作為代理區間，偏向交易參考，不是精確清算簿快照。

## 目標清單1

來源為 CoinMarketCap 各國 trending 頁面片段，先過濾掉 `< 0.8 USD` 項目，再做保守安全篩選後留下以下候選：

| Symbol | Name | 參考價格 | 來源頁 |
| --- | --- | ---: | --- |
| BTC | Bitcoin | 70136.82 | https://coinmarketcap.com/trending-cryptocurrencies/vietnam/ |
| ETH | Ethereum | 2053.68 | https://coinmarketcap.com/trending-cryptocurrencies/vietnam/ |
| SOL | Solana | 78.02 - 100.66 | https://coinmarketcap.com/trending-cryptocurrencies/uae/ |
| XRP | XRP | 1.55 | https://coinmarketcap.com/it/most-viewed-pages/saudi-arabia/ |
| BCH | Bitcoin Cash | 452.90 | https://coinmarketcap.com/trending-cryptocurrencies/united-states/ |
| ICP | Internet Computer | 2.56 - 2.58 | https://coinmarketcap.com/trending-cryptocurrencies/united-states/ |
| FIL | Filecoin | 0.869 | https://coinmarketcap.com/trending-cryptocurrencies/india/ |
| UNI | Uniswap | 3.26 | https://coinmarketcap.com/trending-cryptocurrencies/uae/ |
| ORCA | Orca | 1.26 | https://coinmarketcap.com/trending-cryptocurrencies/russia/ |
| HYPE | Hyperliquid | 34.52 | https://coinmarketcap.com/trending-cryptocurrencies/hungary/ |
| TAO | Bittensor | 200+ | https://coinmarketcap.com/trending-cryptocurrencies/canada/ |
| AVAX | Avalanche | 9.49 | https://coinmarketcap.com/trending-cryptocurrencies/canada/ |
| NEAR | NEAR Protocol | 1.29 | https://coinmarketcap.com/trending-cryptocurrencies/canada/ |
| RENDER | Render | 1.56 | https://coinmarketcap.com/trending-cryptocurrencies/canada/ |
| MORPHO | Morpho | 1.90 | https://coinmarketcap.com/trending-cryptocurrencies/canada/ |
| SUI | Sui | 1.76 | https://coinmarketcap.com/trending-cryptocurrencies/canada/ |
| DASH | Dash | 827.49 NOK | https://coinmarketcap.com/trending-cryptocurrencies/norway/ |
| RIVER | River | 16.53 | https://coinmarketcap.com/trending-cryptocurrencies/norway/ |
| PAXG | PAX Gold | 4891.25 | https://coinmarketcap.com/trending-cryptocurrencies/new-zealand/ |
| TRUMP | Official Trump | 2.86 | https://coinmarketcap.com/trending-cryptocurrencies/canada/ |

## 目標清單2

以下按可公開抓取到的 CMC AI RSI 訊號由低到高排序，並只保留 `<= 55` 的前 15 個：

| Rank | Symbol | RSI | RSI 來源 | 近期動態摘要 | 空單清算價集中區（代理） |
| --- | --- | ---: | --- | --- | --- |
| 1 | AVAX | 21.51 | CMC AI price-analysis, 2026-02-04 | 市場去風險與連續去槓桿主導，技術面進入超賣區。 | 10.2 - 10.8 |
| 2 | SUI | 26.98 | CMC AI price-analysis, 2026-03-12 | 短線偏弱，但生態與鏈上活躍度仍在，若反彈容易先擠壓近端空單。 | 1.90 - 2.05 |
| 3 | FIL | 27.59 | CMC AI price-analysis, 2026-03-12 | 超賣後觀察是否出現技術性反抽，市場敘事仍偏存儲/AI 基建。 | 0.92 - 1.00 |
| 4 | MORPHO | 29.24 | CMC AI price-analysis, 2026-03-12 | DeFi 借貸敘事仍在，但價格回落後主要看 Base/生態增長能否帶回量能。 | 2.05 - 2.20 |
| 5 | TRUMP | 30.92 | CMC AI price-analysis, 2026-03-12 | 題材驅動明顯，短線容易受解鎖與情緒面主導，風險高於同表其他標的。 | 3.05 - 3.35 |
| 6 | UNI | 34.70 | CMC AI price-analysis, 2025-12-23 | Fee-burn/治理提案帶來通縮預期，技術面處於修復區。 | 3.45 - 3.80 |
| 7 | TAO | 34.78 | CMC AI price-analysis, 2026-01-26 | AI 賽道 beta 仍高，近期更多是超賣反彈而非新催化。 | 205 - 215 |
| 8 | RIVER | 36.07 | CMC AI price-analysis, 2026-02-01 | Token unlock、持幣集中與技術破位同時施壓，若量能回來才有像樣反抽。 | 20 - 22，強壓 38 - 40 |
| 9 | RENDER | 38.10 | CMC AI price-analysis, 2026-01-28 | AI/GPU 敘事仍有效，但目前更像隨大盤修正後的低位整理。 | 1.70 - 1.85 |
| 10 | ICP | 38.48 | CMC AI price-analysis, 2025-12-17 | 短線偏超賣，若生態消息不足，走勢仍容易跟隨大盤 beta。 | 2.70 - 2.90 |
| 11 | DASH | 42.00 | CMC AI price-analysis, 2026-03-12 | 交易量回升但仍屬反彈初段，主要看是否能站回前壓。 | 24.5 - 26.0 |
| 12 | NEAR | 42.39 | CMC AI price-analysis, 2026-02-17 | 近期以 beta move 為主，沒有非常明顯的單獨利多。 | 1.33 - 1.40 |
| 13 | XRP | 45.80 | CMC AI price-analysis, 2026-03-12 | 市場持續交易 ETF/監管與支付敘事，動能未失但也未脫離區間。 | 1.62 - 1.72 |
| 14 | SOL | 47.55 | CMC AI price-analysis, 2026-02-17 | 先前出現長時間負 funding，近期更像超賣回補與空單回補共振。 | 85 - 88，延伸 92 |
| 15 | BCH | 48.10 | CMC AI price-analysis, 2026-03-12 | 量價結構偏中性，若大盤續穩，較容易走補漲而不是獨立主升。 | 470 - 490 |

## 觀察重點

1. 最低 RSI 區集中在 `AVAX / SUI / FIL / MORPHO`，偏向「大盤回檔後的低位反抽」型態。
2. `TRUMP / RIVER` 雖然 RSI 低，但結構風險與事件風險高，若要追蹤，應與主流幣分開管理。
3. `SOL / XRP / BCH` 的 RSI 雖未到深度超賣，但流動性較好，若市場轉強，通常比較容易形成可交易的 short squeeze。
4. `PAXG / HYPE / ORCA / BTC / ETH` 本次未進入清單2，主因是抓不到足夠一致的低 RSI 訊號或當前訊號不符合 `<=55` 條件。

## 今日優先追蹤順序

1. AVAX
2. SUI
3. FIL
4. MORPHO
5. UNI
6. TAO
7. RENDER
8. NEAR
9. SOL
10. XRP

## 主要參考來源

- https://coinmarketcap.com/trending-cryptocurrencies/
- https://coinmarketcap.com/charts/rsi/
- https://coinmarketcap.com/cmc-ai/
- https://www.coinglass.com/
