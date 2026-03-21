# Tracking List 2026-03-20

產出時間: 2026-03-20 09:06:52 +08:00

## 方法與限制

1. 熱門清單直接取自 CoinMarketCap `Trending` 頁面可見表格，依題目條件過濾掉 `price < 0.5 USD`，並排除 `Security Scan = Caution / unknown / unknow`。
2. `Security Scan = --` 的項目未在頁面上被明確標成 `Caution/unknown`，本次保留，但在清單中標示為未明確顯示掃描狀態。
3. RSI 直接取自 CoinMarketCap `RSI` 頁面與同頁可用的 RSI heatmap table API，補抓第 1 到第 4 頁後，依 `24H RSI <= 55` 篩選並由低到高排序。
4. CoinGlass/公開網頁上的逐幣精準空單熱力分布不易穩定批次抓取；本報告的「空單清算價集中區」以當前價格上方近期容易觸發空單回補的近端壓力區作為代理值，偏交易參考，不等同完整熱力圖原始資料。

## 目標清單1

共 38 個。

| CMC Trending Rank | Symbol | Name | Price | Security Scan |
| --- | --- | --- | ---: | --- |
| 1 | XAUt | Tether Gold | 4653.62 | Safe |
| 2 | PAXG | PAX Gold | 4662.19 | Safe |
| 3 | BTC | Bitcoin | 70363.68 | -- |
| 6 | TRUMP | OFFICIAL TRUMP | 3.35 | Safe |
| 9 | ASTER | Aster | 0.6878 | Safe |
| 10 | U | United Stables | 1.00 | Safe |
| 11 | RIVER | River | 24.50 | Safe |
| 13 | BEAT | Audiera | 0.6442 | Safe |
| 15 | LINK | Chainlink | 9.08 | Safe |
| 17 | RAY | Raydium | 0.6135 | Safe |
| 18 | XRP | XRP | 1.45 | -- |
| 20 | CAKE | PancakeSwap | 1.41 | Safe |
| 25 | ZRO | LayerZero | 2.05 | Safe |
| 27 | ETHFI | ether.fi | 0.5278 | Safe |
| 29 | DEXE | DeXe | 6.19 | Safe |
| 31 | AAVE | Aave | 112.08 | Safe |
| 36 | USD1 | World Liberty Financial USD | 0.9990 | Safe |
| 40 | ZEN | Horizen | 5.76 | Safe |
| 41 | MORPHO | Morpho | 1.76 | Safe |
| 42 | IP | Story | 0.7780 | -- |
| 52 | HNT | Helium | 1.27 | Safe |
| 54 | PENDLE | Pendle | 1.25 | Safe |
| 56 | QNT | Quant | 74.97 | Safe |
| 58 | TAO | Bittensor | 279.22 | -- |
| 59 | MNT | Mantle | 0.7498 | -- |
| 60 | ICP | Internet Computer | 2.52 | -- |
| 61 | TWT | Trust Wallet Token | 0.5133 | Safe |
| 66 | LTC | Litecoin | 55.76 | -- |
| 76 | BARD | Lombard | 0.5843 | Safe |
| 83 | DOT | Polkadot | 1.52 | -- |
| 86 | NEAR | NEAR Protocol | 1.34 | -- |
| 87 | PYUSD | PayPal USD | 0.9997 | Safe |
| 94 | CVX | Convex Finance | 1.76 | Safe |
| 95 | NEO | Neo | 2.74 | -- |
| 96 | NEXO | Nexo | 0.9024 | Safe |
| 97 | GAS | Gas | 1.57 | -- |
| 98 | LEO | UNUS SED LEO | 9.18 | Safe |
| 99 | QTUM | Qtum | 0.8844 | -- |

## 目標清單2

從清單1與 CoinMarketCap RSI 第 1-4 頁交叉比對後，`24H RSI <= 55` 的項目共有 28 個；以下保留 24H RSI 最低的前 15 個。

| Rank | Symbol | Name | Price | 24H RSI | 24H % | 空單清算價集中區（代理） | 近期動態 |
| --- | --- | --- | ---: | ---: | ---: | --- | --- |
| 1 | PAXG | PAX Gold | 4661.14 | 29.47 | -3.59% | 4720 - 4800 | 走勢仍主要跟隨現貨黃金，近期是明顯的避險/貴金屬 beta。 |
| 2 | XAUt | Tether Gold | 4651.83 | 29.48 | -3.53% | 4700 - 4780 | 與 PAXG 類似，近期關注點仍是鏈上黃金替代資產需求與金價強勢。 |
| 3 | IP | Story | 0.7780 | 31.47 | -3.84% | 0.81 - 0.85 | 題材仍圍繞 IP/內容資產上鏈，但價格仍在 post-launch 消化區。 |
| 4 | BARD | Lombard | 0.5844 | 33.45 | -12.77% | 0.61 - 0.64 | BTCFi/restaking 敘事還在，但短線回檔很深，偏超賣反抽觀察。 |
| 5 | CVX | Convex Finance | 1.7680 | 38.81 | -6.58% | 1.84 - 1.92 | DeFi 老牌槓桿收益題材仍在，但近期更像跟隨 Curve/DeFi 板塊修正。 |
| 6 | QTUM | Qtum | 0.8844 | 43.40 | -0.55% | 0.91 - 0.96 | 近期未見非常明顯的獨立催化，走勢偏大盤 beta 與資金輪動。 |
| 7 | AAVE | Aave | 112.08 | 46.01 | -2.53% | 116 - 121 | 仍是 DeFi 核心藍籌，市場持續交易協議收入、GHO 與治理預期。 |
| 8 | ASTER | Aster | 0.6877 | 46.33 | -0.74% | 0.71 - 0.74 | 幣安系永續/衍生品敘事仍在，短線動能轉弱後回到超賣整理。 |
| 9 | TRUMP | OFFICIAL TRUMP | 3.3561 | 46.65 | -4.76% | 3.48 - 3.65 | 仍高度依賴政治/社群話題，事件驅動波動很大。 |
| 10 | PENDLE | Pendle | 1.2554 | 46.65 | -0.09% | 1.30 - 1.36 | 利率與收益交易敘事未破壞，這波更像部位重置後的低位整理。 |
| 11 | RAY | Raydium | 0.6135 | 47.19 | -2.50% | 0.63 - 0.66 | 仍直接受 Solana 鏈上活躍與 memecoin 交易量影響。 |
| 12 | TWT | Trust Wallet Token | 0.5133 | 47.26 | -0.33% | 0.53 - 0.55 | 自託管/錢包敘事穩定，但近期沒有很強的新催化。 |
| 13 | GAS | Gas | 1.5780 | 47.54 | -0.78% | 1.62 - 1.69 | 主要跟隨 Neo 生態與鏈上活動，暫時仍屬次級 beta 標的。 |
| 14 | ETHFI | ether.fi | 0.5274 | 47.86 | -3.12% | 0.54 - 0.57 | 仍圍繞 liquid restaking/ETHFi 生態，但供給與輪動壓力尚未完全消化。 |
| 15 | ZEN | Horizen | 5.7614 | 47.99 | -4.58% | 5.95 - 6.20 | 缺乏強烈新敘事時，近期多半跟隨中小型公鏈/隱私題材整體波動。 |

## 觀察重點

1. 本次低 RSI 前段意外被 `PAXG / XAUt` 佔據，代表這批熱門標的裡，鏈上黃金在短線急跌後已進入明顯超賣區。
2. 若排除黃金替代資產，較值得追蹤的風險資產為 `IP / BARD / CVX / AAVE / PENDLE / RAY / ETHFI`。
3. `TRUMP` 雖然進入清單2，但屬高事件風險標的，應與 DeFi/L1 類標的分開看待。
4. `BTC / XRP / TAO / ICP / NEAR` 雖在熱門清單1，但本次 24H RSI 未壓到 `<= 55`，因此沒有進入清單2。

## 今日優先追蹤順序

1. IP
2. BARD
3. CVX
4. AAVE
5. PENDLE
6. RAY
7. ETHFI
8. TRUMP
9. TWT
10. ZEN

## 主要參考來源

- https://coinmarketcap.com/?type=coins&tableRankBy=trending_top_200_24h
- https://coinmarketcap.com/charts/rsi/
- https://www.coinglass.com/
- https://coinmarketcap.com/headlines/news/
- https://www.arkinvest.com/
