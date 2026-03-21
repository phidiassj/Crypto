# Tracking List 2026-03-21

產出時間: 2026-03-21 16:27:18 +08:00

## 方法與限制

1. 熱門清單取自 CoinMarketCap `Trending` 頁面前 163 筆可見資料，依題目條件過濾掉 `price < 0.5 USD`，並排除 `Security Scan = Caution / Unknown / unknow`。
2. `Security Scan = --` 代表頁面未明確標示為 `Caution/Unknown`，本次保留，但在清單中維持 `--`。
3. RSI 直接取自 CoinMarketCap `RSI` dashboard 對應 heatmap table API，使用 `24H RSI <= 55` 篩選，並依 `24H RSI` 由低到高保留前 15 名。
4. CoinGlass `Liquidation Heatmap` 個別幣種頁面可視化可正常開啟，但穩定批次抽出精準熱區數值較困難；因此本報告的「空單清算價集中區」採用 CoinGlass 熱圖觀察邏輯下的上方近端壓力代理區，偏交易參考，不等同原始熱力圖數值。
5. 「近期動態」採一般網路搜尋與官方/新聞頁面摘要，優先記錄最近可辨識的催化、解鎖、產品更新或敘事變化。

## 目標清單1

共 57 個。

| CMC Trending Rank | Symbol | Name | Price | Security Scan |
| --- | --- | --- | ---: | --- |
| 1 | ETHFI | ether.fi | 0.5975 | Safe |
| 3 | ETH | Ethereum | 2152.15 | -- |
| 6 | RIVER | River | 24.93 | Safe |
| 8 | TRUMP | OFFICIAL TRUMP | 3.34 | Safe |
| 9 | XAUt | Tether Gold | 4494.95 | Safe |
| 10 | BEAT | Audiera | 0.6480 | Safe |
| 12 | PAXG | PAX Gold | 4508.47 | Safe |
| 14 | ASTER | Aster | 0.6890 | Safe |
| 15 | U | United Stables | 1.00 | Safe |
| 16 | CAKE | PancakeSwap | 1.38 | Safe |
| 24 | LINK | Chainlink | 9.11 | Safe |
| 27 | ZRO | LayerZero | 2.05 | Safe |
| 28 | RAY | Raydium | 0.6167 | Safe |
| 30 | XRP | XRP | 1.44 | -- |
| 34 | USD1 | World Liberty Financial USD | 0.9996 | Safe |
| 36 | DEXE | DeXe | 6.31 | Safe |
| 37 | ZEN | Horizen | 5.72 | Safe |
| 44 | IP | Story | 0.7451 | -- |
| 46 | LTC | Litecoin | 56.27 | -- |
| 50 | PENDLE | Pendle | 1.26 | Safe |
| 51 | MORPHO | Morpho | 1.75 | Safe |
| 54 | AAVE | Aave | 111.36 | Safe |
| 56 | QNT | Quant | 78.29 | Safe |
| 59 | TWT | Trust Wallet Token | 0.5055 | Safe |
| 62 | HNT | Helium | 1.25 | Safe |
| 63 | ICP | Internet Computer | 2.50 | -- |
| 65 | MNT | Mantle | 0.7506 | -- |
| 75 | BARD | Lombard | 0.5337 | Safe |
| 76 | PYUSD | PayPal USD | 0.9997 | Safe |
| 78 | DOT | Polkadot | 1.49 | -- |
| 83 | AVAX | Avalanche | 9.55 | -- |
| 85 | APT | Aptos | 1.00 | -- |
| 89 | BERA | Berachain | 0.5583 | -- |
| 96 | BGB | Bitget Token | 2.13 | -- |
| 102 | NEXO | Nexo | 0.8983 | Safe |
| 104 | BTC | Bitcoin | 70540.88 | -- |
| 105 | BNB | BNB | 642.52 | -- |
| 106 | SOL | Solana | 89.92 | -- |
| 107 | BCH | Bitcoin Cash | 468.65 | -- |
| 108 | TAO | Bittensor | 271.88 | -- |
| 111 | NEAR | NEAR Protocol | 1.31 | -- |
| 112 | HYPE | Hyperliquid | 39.55 | -- |
| 113 | LIT | Lighter | 1.08 | Safe |
| 115 | KCS | KuCoin Token | 8.16 | -- |
| 116 | LEO | UNUS SED LEO | 9.21 | Safe |
| 117 | OKB | OKB | 88.89 | -- |
| 119 | RLUSD | Ripple USD | 0.9999 | Safe |
| 122 | DASH | Dash | 32.15 | -- |
| 123 | GT | GateToken | 6.83 | -- |
| 124 | BSV | Bitcoin SV | 14.61 | -- |
| 127 | FIL | Filecoin | 0.9044 | -- |
| 128 | CVX | Convex Finance | 1.84 | Safe |
| 147 | GAS | Gas | 1.57 | -- |
| 159 | QTUM | Qtum | 0.8820 | -- |
| 160 | EGLD | MultiversX | 4.13 | -- |
| 162 | NEO | Neo | 2.70 | -- |
| 163 | MX | MX Token | 1.79 | Safe |

## 目標清單2

以下為 `24H RSI <= 55` 且依 `24H RSI` 由低到高保留前 15 個項目。

| Rank | Symbol | Name | Price | 24H RSI | 24H % | 空單清算價集中區（代理） | 近期動態 |
| --- | --- | --- | ---: | ---: | ---: | --- | --- |
| 1 | XAUt | Tether Gold | 4494.74 | 24.62 | -4.62% | 4560 - 4660 | 近期核心敘事仍是金價飆升與代幣化黃金需求增強，市場同時關注 Tether 持續擴大黃金相關布局。 |
| 2 | PAXG | PAX Gold | 4508.73 | 24.99 | -4.50% | 4575 - 4680 | 與 XAUt 類似，近期主要受全球避險情緒與黃金現貨強勢帶動，24/7 可交易特性仍是主賣點。 |
| 3 | IP | Story | 0.7455 | 29.09 | -3.49% | 0.78 - 0.83 | Story 近期較明確的事件是將大型解鎖延後到 2026 年 8 月，以降低短期賣壓並爭取更多用例落地時間。 |
| 4 | BARD | Lombard | 0.5339 | 32.03 | -5.42% | 0.56 - 0.60 | Lombard 近期一方面面臨 3 月解鎖壓力，另一方面持續推進 Bitcoin Smart Accounts 與 BTCFi 擴張敘事。 |
| 5 | BGB | Bitget Token | 2.1389 | 34.12 | -0.20% | 2.20 - 2.32 | Bitget 近期仍圍繞 Morph 生態升級與激勵釋放，BGB 的 gas / governance 敘事延續，但價格動能偏溫和。 |
| 6 | LIT | Lighter | 1.0835 | 39.60 | -10.47% | 1.12 - 1.20 | Lighter 近期最受關注的是平台曾出現 BTC 瞬間深插針事件，短線對交易所微結構與流動性風險敏感度升高。 |
| 7 | GT | GateToken | 6.8384 | 41.23 | -0.37% | 7.05 - 7.35 | 近期未見很強的單一 GT 專屬催化，走勢更像跟隨交易所平台幣板塊與市場風險偏好。 |
| 8 | MX | MX Token | 1.7903 | 42.17 | -0.03% | 1.85 - 1.94 | 近期公開資訊裡缺乏特別強烈的新催化，短線仍偏交易所平台幣 beta 與量能驅動。 |
| 9 | CVX | Convex Finance | 1.8414 | 43.17 | 0.37% | 1.90 - 2.00 | Convex 最近沒有明確單點催化，仍主要跟隨 Curve / DeFi 收益與槓桿收益板塊情緒。 |
| 10 | QTUM | Qtum | 0.8821 | 43.47 | -0.67% | 0.91 - 0.96 | 一般搜尋中未見強烈 Qtum 專屬事件，現階段更像老牌公鏈資產的低波動輪動標的。 |
| 11 | EGLD | MultiversX | 4.1380 | 43.52 | -1.27% | 4.28 - 4.48 | MultiversX 3 月持續推 Battle of Nodes 與 agent / AI 相關生態內容，敘事仍以生態活化為主。 |
| 12 | DASH | Dash | 32.1579 | 43.80 | 0.47% | 33.2 - 34.8 | Dash 近期較具體的進展是 Evolution 鏈整合 Zcash Orchard shielded pool，市場仍把它視為隱私支付敘事延伸。 |
| 13 | FIL | Filecoin | 0.9048 | 44.73 | 0.47% | 0.94 - 1.00 | Filecoin 近期敘事集中在 Onchain Cloud / Data & AI 基礎設施需求，但暫未看到單一爆發型催化。 |
| 14 | AAVE | Aave | 111.3348 | 45.20 | -1.13% | 115 - 120 | Aave 近期官方更新仍圍繞 GHO 收入提升與 2026 產品路線，基本面敘事在 DeFi 藍籌中仍相對完整。 |
| 15 | BERA | Berachain | 0.5586 | 45.28 | 0.31% | 0.58 - 0.62 | Berachain 近期焦點在機構與基礎設施部署，例如 Greenlane 將 BERA 部位投入 validator 相關基礎建設，但解鎖供給仍是壓力源。 |

## 觀察重點

1. 本次清單2 最低 RSI 仍由 `XAUt / PAXG` 佔據，表示熱門標的中的黃金代幣在急跌後進入顯著超賣區。
2. 若排除黃金替代資產，較值得優先追蹤的風險資產是 `IP / BARD / BGB / LIT / CVX / AAVE / BERA`。
3. `GT / MX / QTUM` 這類標的近期缺乏強催化，若反彈通常更仰賴市場普漲與空單回補，而非基本面事件。
4. `BTC / ETH / SOL / XRP / TAO / NEAR / DOT / AVAX` 雖在目標清單1，但本次 24H RSI 沒有壓到前 15 名，因此未進入清單2。

## 今日優先追蹤順序

1. IP
2. BARD
3. BGB
4. LIT
5. CVX
6. AAVE
7. BERA
8. DASH
9. FIL
10. QTUM

## 主要參考來源

- https://coinmarketcap.com/?type=coins&tableRankBy=trending_top_200_24h
- https://coinmarketcap.com/charts/rsi/
- https://www.coinglass.com/pro/futures/LiquidationHeatMap?coin=AAVE&type=symbol
- https://coinmarketcap.com/cmc-ai/tether-gold/latest-updates/
- https://coinmarketcap.com/cmc-ai/bitget-token-new/latest-updates/
- https://www.kucoin.com/news/flash/story-protocol-delays-token-unlock-until-2026-citing-need-for-more-time-to-build-use-cases
- https://www.lombard.finance/blog/lombard-introduces-bitcoin-smart-accounts/
- https://coinmarketcap.com/top-stories/69a9e0ab199dd00852615212/
- https://www.kucoin.com/news/flash/bitcoin-briefly-plunges-30-on-lighter-amid-crypto-rally
- https://governance.aave.com/t/al-development-update-february-2026/24198
- https://multiversx.com/blog
- https://coinmarketcap.com/top-stories/69a0374d56874b46886d77a5/
- https://www.globenewswire.com/news-release/2026/03/03/3248226/0/en/Greenlane-Provides-Digital-Asset-Treasury-Update-Completes-Deployment-of-Approximately-50-Million-Units-of-BERA.html
