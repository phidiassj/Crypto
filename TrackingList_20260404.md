# 每日加密貨幣追蹤報告 - 2026-04-04

## 方法與今日結論

- 篩選流程：CoinMarketCap Trending Top 200 -> 排除 `價格 < 0.5 USD` 與 `Security Scan = Caution / unknow` -> 對照 CoinMarketCap RSI 可見列 -> 保留 `24H RSI <= 60` 並依 24H RSI 由低到高排序。[1][2]
- 今日結果：Trending 共抓到 `165` 筆，目標清單1 有 `58` 檔；與 RSI 頁可見 `100` 列交叉後，目標清單2 有 `11` 檔，因此今天維持實際筆數，不硬補到 `15` 檔。
- 清算帶說明：CoinGlass 公開逐幣清算圖對這批標的覆蓋率仍不足，以下多空單清算價集中區以「現價、整數關卡、近期支撐/壓力、RSI 狀態、消息催化與常見擠倉區」保守推估，屬估算區，不是 CoinGlass 精確值。
- `refx` 補充：本次依任務條件讀取 `E:\work\Crypto\refx` 中建立時間 26 小時內的 Markdown 文件，命中 `20260404-06.md` 1 筆。其主線是「中東風險升溫、BTC 礦商賣幣轉 AI、避險情緒增強」，對 `XAUt / PAXG` 偏正面，對高 beta 山寨偏保守。
- 今日偏向：
  - `XAUt / PAXG` 仍是最完整的防守型配置。
  - `ICP / NEAR` 是這批裡面相對有中期基本面支撐的觀察組。
  - `LIT / RAY / BSV / QTUM / NEO` 偏事件或反彈交易，追價紀律要更嚴格。
  - `FIL / YFI` 仍有敘事，但現階段更像等待確認的弱勢修復。

## 目標清單2

| 幣種 | 價格 | 24H % | 24H RSI | 多單清算密集區（估） | 空單清算密集區（估） | 近期動態 | 短中期評估 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| FIL | $0.8347 | +2.22% | 42.9 | `0.78-0.81` | `0.88-0.92` | 4/1 CMC Community 仍把 FIL 定位在 falling wedge 內的弱勢整理，關鍵是能否重新站回 `1.00-1.10`；但 3/26 Filecoin Onchain Cloud 上主網後，AI / DePIN 長線敘事沒有消失。[3] | 短線屬弱勢修復。若無法先收復 `0.86` 再站上 `1.0`，中期仍不宜高配，只適合觀察是否有結構反轉。 |
| YFI | $2,464.04 | +2.10% | 43.0 | `2,320-2,380` | `2,580-2,680` | 最近可驗證主線仍是韓國交易所合規恢復與舊池 exploit 後續善後，官方社群仍強調整合與產品韌性，但鮮少看到新的強催化。[4] | 高波動反彈型標的。短線可交易，但中期仍受歷史安全事件陰影拖累，不適合作為高信念配置。 |
| ICP | $2.28 | +1.76% | 43.3 | `2.15-2.22` | `2.38-2.50` | 4/2 CMC AI 指出伊朗風險與 AI 類資產同步承壓，但 3/30 也有 ICP 被 137 家瑞士超市接受付款的採用面消息，基本面不算差。[5] | 這批裡中期質地較好的一檔。若能守住 `2.2` 附近並持續看到真實採用，適合比純題材幣更高權重追蹤。 |
| XAUt | $4,631.21 | +0.39% | 45.9 | `4,560-4,610` | `4,720-4,800` | 3/31 Tether Gold 管理層調整，但同日 Margex 擴大 XAUt 抵押用途；配合 `refx` 顯示的地緣風險升溫，避險主線仍在。[6] | 中期仍偏多且偏防守。若市場繼續交易戰事與風險資產降溫，XAUt 比多數山寨更適合續抱。 |
| PAXG | $4,648.20 | +0.42% | 46.0 | `4,580-4,620` | `4,740-4,820` | 3/30 OnePay 擴大加密產品線納入 PAXG，3/31 tokenized RWA 規模突破 `$20B`，商品型代幣仍受益於傳統資產上鏈敘事。[7] | 與 XAUt 同屬高品質防守配置。短線爆發力有限，但中期在避險與 RWA 雙題材下仍值得保留。 |
| LIT | $0.9865 | +3.21% | 46.5 | `0.93-0.96` | `1.02-1.08` | 4/2 Telegram Wallet 加入 LIT 50x perpetuals，CMC AI 也持續提到協議費用回購與日活用戶增長，是今天少數有新入口流量的標的。[8] | 偏事件驅動的短線交易。若能有效站穩 `1.0`，短線還有延續空間；否則中期仍先視為交易型而非配置型。 |
| NEAR | $1.20 | +4.03% | 46.7 | `1.12-1.16` | `1.26-1.32` | 4/1 Arizona 州儲備法案把 NEAR 納入討論標的，3/31 Robinhood 也新增現貨交易，法規與零售可得性兩條線同時偏正面。[9] | 這批裡中期相對值得追蹤的一檔。若 `1.1` 上方能守住，後續比單純題材幣更有延續基礎。 |
| BSV | $14.81 | +1.38% | 54.5 | `14.10-14.40` | `15.80-16.80` | 4/7 Chronicle 升級進入倒數，4/1 BSV Browser 上線補強入口體驗，短線主要還是圍繞升級事件交易。[10] | 偏事件交易，不偏長抱。若升級前後無法推動價格有效突破 `15.8`，中期配置價值仍有限。 |
| RAY | $0.6394 | +2.95% | 55.3 | `0.60-0.62` | `0.67-0.72` | 4/2 市場仍在消化 Drift 事件對 Raydium 池子的負面聯想，但同時有鯨魚在 4 月初增持，屬風險與彈性並存的 Solana Beta 倉位。[11] | 高波動反彈組。若 `0.60` 不失守，短線還可續看反彈；中期仍要先確認資安陰影是否淡化。 |
| NEO | $2.83 | +6.86% | 56.2 | `2.65-2.74` | `2.95-3.15` | 3/5 Neo 公布約 `$460M` treasury 與去中心化計畫，4/1 又被點名為高 TPS 公鏈，主線仍是資金厚度加 Neo X / AI 敘事。[12] | 可列入中期觀察，但仍需要價格與生態同步驗證。若無法站穩 `3.0`，更像消息驅動反彈。 |
| QTUM | $0.9706 | +10.33% | 58.9 | `0.91-0.94` | `1.02-1.08` | 3/29 Qtum 鏈升級與 2026 Ethereum bridge / USDC 整合仍是主敘事，且 4/2 社群還有橋接開發進度的討論；但今天 RSI 已接近篩選上限。[13] | 偏後段動能交易。短線若續強有機會摸 `1.0+`，但中期仍要等橋接與流動性真正落地，否則容易回到題材輪動。 |

## 今日分組觀察

### 1. 可優先追蹤

- `XAUt / PAXG`：有最清楚的宏觀主線支撐，且 `refx` 的避險脈絡與其方向一致。
- `ICP / NEAR`：不只 RSI 偏低，近期也各自有採用面或法規/交易可得性題材，較像能延續到中期的觀察組。

### 2. 事件與反彈交易

- `LIT / RAY / BSV / QTUM / NEO`：都有明確事件線，但更依賴市場情緒與技術位，不適合無條件追價。
- `RAY` 與 `LIT` 的彈性較大，但也伴隨較高回撤風險；`BSV` 與 `QTUM` 則更像單一事件窗口交易。

### 3. 等待確認

- `FIL / YFI`：有長線敘事，但眼前更像結構修復而非趨勢扭轉，必須先看關鍵壓力位是否被收復。

## 風險提醒

- CoinMarketCap RSI 頁今天仍只穩定讀到可見 `100` 列，因此本報告是「Trending 候選」與「RSI 可見資料」的交集，不等於全市場完整篩選。[2]
- `Security Scan = --` 只代表 CoinMarketCap 沒有給出明確安全標籤，不等於安全，也不等於不安全；本次僅依任務條件排除 `Caution / unknow`。
- `YFI / BSV / QTUM / NEO` 的近期敘事，有一部分已回落到「舊事件延續」而非當日新催化，因此更適合當交易觀察，不適合誤判成全新基本面重估。
- 本次 `refx` 只有 1 份新檔，且主線偏宏觀；若晚間出現新的 ETF、法規、鏈上攻擊或交易所公告，需視為報告外新增資訊。

## 來源

1. [CoinMarketCap Trending Top 200](https://coinmarketcap.com/?type=coins&tableRankBy=trending_top_200_24h)
2. [CoinMarketCap RSI](https://coinmarketcap.com/charts/rsi/)
3. [CMC AI - Filecoin](https://coinmarketcap.com/cmc-ai/filecoin/latest-updates/)
4. [CMC AI - yearn.finance](https://coinmarketcap.com/cmc-ai/yearn-finance/latest-updates/)
5. [CMC AI - Internet Computer](https://coinmarketcap.com/cmc-ai/internet-computer/latest-updates/)
6. [CMC AI - Tether Gold](https://coinmarketcap.com/cmc-ai/tether-gold/latest-updates/)
7. [CMC AI - PAX Gold](https://coinmarketcap.com/cmc-ai/pax-gold/latest-updates/)
8. [CMC AI - Lighter](https://coinmarketcap.com/cmc-ai/lighter/latest-updates/)
9. [CMC AI - NEAR Protocol](https://coinmarketcap.com/cmc-ai/near-protocol/latest-updates/)
10. [CMC AI - Bitcoin SV](https://coinmarketcap.com/cmc-ai/bitcoin-sv/latest-updates/)
11. [CMC AI - Raydium](https://coinmarketcap.com/cmc-ai/raydium/latest-updates/)
12. [CMC AI - Neo](https://coinmarketcap.com/cmc-ai/neo/latest-updates/)
13. [CMC AI - Qtum](https://coinmarketcap.com/cmc-ai/qtum/latest-updates/)
14. 本地參考：`E:\work\Crypto\refx\20260404-06.md`
