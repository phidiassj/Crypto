# 每日加密貨幣追蹤報告 - 2026-04-03

## 方法與今日結論

- 篩選流程：CoinMarketCap Trending Top 200 -> 排除 `價格 < 0.5 USD` 與 `Security Scan = Caution / unknow` -> 對照 CoinMarketCap RSI 可見列 -> 保留 `24H RSI <= 60` 並依 24H RSI 由低到高排序。[1][2]
- 今日結果：Trending 共抓到 `162` 筆，目標清單1 有 `58` 檔；與 RSI 頁可見 `100` 列交叉後，目標清單2 只剩 `9` 檔，明顯少於前兩日，因此今天不硬補第 10-15 檔。
- 清算帶說明：CoinGlass 公開逐幣清算圖對這批標的覆蓋率仍不足，以下多空單清算價集中區以「現價、整數關卡、近期支撐/壓力、消息催化與常見擠倉區」保守推估，屬估算區，不是 CoinGlass 精確值。
- `refx` 補充：依任務條件讀取 `E:\work\Crypto\refx` 中建立時間 28 小時內的 Markdown 文件，今天結果為 `0` 筆，因此本報告未額外引用 X 推文作為新事實來源。
- 今日偏向：
  - `XAUt / PAXG` 仍是最完整的防守型配置。
  - `RAY / QNT` 屬有事件或資金面催化、但仍需確認延續性的觀察組。
  - `LIT / KCS / GAS / QTUM / BSV` 偏交易型或事件型，不宜視為無條件中期配置。

## 目標清單2

| 幣種 | 價格 | 24H % | 24H RSI | 多單清算密集區（估） | 空單清算密集區（估） | 近期動態 | 短中期評估 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| LIT | $0.9555 | +7.40% | 43.8 | `0.90-0.93` | `1.00-1.06` | 4/2 CMC AI 指出協議累計回購約 `955` 萬枚 LIT，短線推動價格反彈並帶動未平倉量回升，但 3/23 才剛跌破 `1.0` 心理位，長結構仍偏弱。[3] | 短線偏反彈交易。若無法有效站穩 `1.0`，中期仍屬跌深修復而非新趨勢。 |
| XAUt | $4,649.49 | +2.02% | 46.8 | `4,560-4,620` | `4,760-4,880` | 3/31 Tether Gold 管理層出現人事調整，但 Binance 與 Margex 同日擴大 XAUt 抵押/借貸用途，DeFi 與交易場景都在增加。[4] | 中期仍偏防守與避險。若宏觀風險持續，XAUt 比高 beta 山寨更適合續抱。 |
| PAXG | $4,668.07 | +2.08% | 46.9 | `4,580-4,630` | `4,780-4,900` | 3/30 OnePay 把 PAXG 納入 super app 產品，3/31 tokenized RWA 規模突破 `$20B`，PAXG 被點名為主要商品型代幣之一；3/26 的 CMC Top Stories 也指出價格回檔主要跟著金價與槓桿去化，非專案特有利空。[5][6] | 與 XAUt 類似，短線追價效率普通，但中期是高品質防守配置。 |
| KCS | $8.02 | +1.26% | 47.3 | `7.70-7.85` | `8.35-8.70` | 4/3 KuCoin 下架 HOOKUSDT 永續合約，反映平台風控持續收緊；3/31 GemPool 啟動新一輪 KCS 質押挖礦，3/30 也做了 API 效能升級。[7] | 偏穩定平台幣修復。中期可續追蹤，但更像低波動配置而非高彈性主攻標的。 |
| GAS | $1.58 | +2.43% | 49.3 | `1.50-1.54` | `1.66-1.74` | 最近可驗證的主線仍是 Neo 3/5 公布約 `$460.8M` treasury 與 Neo X 的 AI/agent-first 路線；GAS 本身缺乏新的獨立催化，屬生態映射交易。[8] | 偏技術反彈。若 Neo 生態沒有新使用量或新資金進場，中期延續性有限。 |
| QTUM | $0.8799 | +5.42% | 49.5 | `0.84-0.86` | `0.93-0.98` | Qtum 最近仍圍繞 1 月硬分叉後的技術路線，重點是以 Circle Bridged USDC Standard 做 Ethereum bridge、補齊穩定幣與 DeFi 基礎設施；3/13 也曾被視為短線現貨動能領頭之一。[9] | 短線可交易，但中期仍要看橋接與流動性是否真正落地，否則只是題材反彈。 |
| RAY | $0.6209 | +5.92% | 52.2 | `0.58-0.60` | `0.66-0.71` | 4/1 Drift `285M` 攻擊事件被指出利用了 Raydium 池子與假代幣價格操縱，短線對 Solana DeFi 情緒有壓力；但同時也有鯨魚增持與 alt season 輪動敘事在支撐。[10] | 短線高波動。若 Solana 生態恐慌消化後能守住 `0.60`，反彈空間還在；中期仍需先穿越安全疑慮。 |
| BSV | $14.61 | +3.97% | 52.2 | `13.80-14.20` | `15.50-16.70` | 4/1 BSV Browser 上線、強化錢包與身份功能；韓國交易所 Upbit/Bithumb 也在 3/31-4/1 因應 4/7 Chronicle 升級暫停充提，市場主線仍是網路升級事件。[11] | 偏事件交易。若 Chronicle 升級前後沒有把價格帶上 `15.5+`，中期仍不宜高配。 |
| QNT | $73.51 | +4.19% | 56.4 | `69-71` | `76-80` | 4/1 鯨魚增持約 `2` 萬枚 QNT，3/25 與 Murex MX.3 的整合敘事帶來一波強勢拉升；但 3/22 的 CMC Top Stories 也指出，之後回檔更多是跟著 Fed 與 BTC 風險偏好走，缺少新的協議級催化。[12][13] | 九檔中最值得中期追蹤之一，但要看到 `76-80` 被有效突破，才比較像新一段趨勢。 |

## 今日分組觀察

### 1. 可優先追蹤

- `QNT`：鯨魚增持與機構基礎設施整合敘事仍在，若市場風險偏好回升，最有機會從區間整理轉成趨勢。
- `RAY`：雖有資安陰影，但 Solana 生態一旦止穩，Raydium 仍是流動性中樞，反彈彈性大。

### 2. 防守與對沖

- `XAUt / PAXG`：兩者都有新分發或抵押場景，且受惠於當前避險與商品代幣主題。
- `KCS`：屬平台整體營運與風控改善驅動，波動通常低於題材幣。

### 3. 事件或反彈交易

- `LIT / GAS / QTUM / BSV`：都有可說的事件線，但短線更依賴技術位與情緒，不適合重倉追價。

## 風險提醒

- CoinMarketCap RSI 頁今天仍只穩定讀到可見 `100` 列，因此本報告是「Trending 候選」與「RSI 可見資料」的交集，不等於全市場完整篩選。[2]
- `Security Scan = --` 只代表 CoinMarketCap 未給明確安全標籤，不等於安全，也不等於不安全；本次僅依任務條件排除 `Caution / unknow`。
- 今日 `refx` 在建立時間 28 小時條件下沒有新檔，因此若晚間出現新的政策、ETF、鏈上攻擊或交易所公告，需視為報告外新增資訊。

## 來源

1. [CoinMarketCap Trending Top 200](https://coinmarketcap.com/?type=coins&tableRankBy=trending_top_200_24h)
2. [CoinMarketCap RSI](https://coinmarketcap.com/charts/rsi/)
3. [CMC AI - Lighter](https://coinmarketcap.com/cmc-ai/lighter/latest-updates/)
4. [CMC AI - Tether Gold](https://coinmarketcap.com/cmc-ai/tether-gold/latest-updates/)
5. [CMC AI - PAX Gold](https://coinmarketcap.com/cmc-ai/pax-gold/latest-updates/)
6. [CMC Top Stories - PAX Gold Drops 3% as Gold Selloff Hits Tokenized Assets](https://coinmarketcap.com/top-stories/69c4f6e4a252d82cb4a39eb6/)
7. [CMC AI - KuCoin Token](https://coinmarketcap.com/cmc-ai/kucoin-token/latest-updates/)
8. [CMC AI - Gas](https://coinmarketcap.com/cmc-ai/gas/latest-updates/)
9. [CMC AI - Qtum](https://coinmarketcap.com/cmc-ai/qtum/latest-updates/)
10. [CMC AI - Raydium](https://coinmarketcap.com/cmc-ai/raydium/latest-updates/)
11. [CMC AI - Bitcoin SV](https://coinmarketcap.com/cmc-ai/bitcoin-sv/latest-updates/)
12. [CMC AI - Quant](https://coinmarketcap.com/cmc-ai/quant/latest-updates/)
13. [CMC Top Stories - Quant Surges 24% on Murex Banking Integration](https://coinmarketcap.com/top-stories/69c3ddde372af204e7305687/)
