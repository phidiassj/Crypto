# 每日加密貨幣追蹤報告 - 2026-04-18

## 方法與今日結論

- 篩選流程：CoinMarketCap Trending Top 200 第 1/2 頁 -> 排除 `價格 < 0.5 USD` 與 `Security Scan = Caution / unknow` -> 對照 CoinMarketCap RSI 可視列 -> 保留 `24H RSI <= 60` 並依 `24H RSI` 由低到高排序。
- 今日結果：`2026-04-18 08:01` 最新快照顯示 Trending 共抓到 `162` 筆，目標清單1 有 `62` 檔；RSI 頁穩定暴露 `100` 列，交叉後目標清單2 只剩 `7` 檔。
- 清算帶說明：CoinGlass 公開逐幣圖對這 7 檔仍沒有穩定、可批量直接引用的精確區間，因此以下多空單清算價集中區以「現價、整數位、近期支撐/阻力、24H RSI、事件密集價位」保守推估，屬估算區，不是 CoinGlass 精確值。
- `refx` 補充：依檔案時間 26 小時內讀取 `E:\work\Crypto\refx`，命中 `20260417-07.md`、`20260417-13.md`、`20260418-06.md` 共 3 份。共同主線已從單純停火預期，切到 `Hormuz 雖未封鎖但風險溢價仍在`，同時 `USDC Bridge / wXRP on Solana / 大額 USDT 流動 / DeFi TVL 回升` 讓鏈上流動性與基礎設施敘事偏多。
- 外部搜尋結果：交叉檢查 `CoinMarketCap CMC AI / Community`、`crypto.news`、`CoinGecko News` 後，今天真正有時間上較近、可直接支撐逐幣結論的仍以 `CMC AI / Community` 為主。`crypto.news` 對 `IP / ETHFI` 有可參考的歷史背景，但對 `MX / HNT / GAS / BSV / BNB` 沒有補出比 CMC AI 更強的即時逐幣催化；`CoinGecko News` 對這批標的依舊不適合批量逐幣取材，命中多為首頁、歷史頁或報告頁。

## 目標清單2

| 幣種 | 價格 | 24H % | 24H RSI | Security Scan | 多單清算密集區（估） | 空單清算密集區（估） | 近期動態 | 短中期評估 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| MX | $1.78 | +0.75% | 53.2 | `Safe / ETH` | `1.65-1.70` | `1.90-2.00` | `CMC AI` 於 `4/3` 提到 MEXC 正推 tokenized stock trading，擴大交易所產品線；`3/9` 的儲備與風控報告顯示 BTC 準備率達 `266%`、攔截詐騙金額約 `409 萬美元`。社群面仍圍繞 `季度回購銷毀 + Launchpad/Kickstarter` 的交易所幣邏輯。 | 這檔比較像平台幣防守組，短線看 `1.65-1.70` 能否守住；中期若 MEXC 新產品線與下一次季度 burn 能帶來實際交易量，才有機會脫離單純事件反彈。 |
| IP | $0.6175 | +5.02% | 56.2 | `--` | `0.56-0.59` | `0.66-0.72` | `CMC AI` 於 `4/16` 更新指出 Story 在 Aeneid testnet 啟用 `Confidential Data Rails`，導入加密資料流程與 DKG，直接對準 AI / 醫療 / 金融資料授權；`4/11` 又被 Grayscale 列入候選資產名單。`crypto.news` 近期沒有更近的新稿，但過去企業採用與主網敘事仍能補強其 AI x IP 基礎設施定位。 | 今天仍是名單裡事件線最完整的一檔。短線若守住 `0.56-0.59`，有機會延續技術性修復；中期要看測試網功能能否走向主網與商業採用。`Security Scan = --` 只代表未標記，不等於安全。 |
| HNT | $1.16 | +10.29% | 57.5 | `Safe / SOL` | `1.05-1.10` | `1.24-1.32` | `CMC AI` 於 `4/13` 提到 Grayscale 把 HNT 納入 `Q2 2026 Assets Under Consideration`；較早之前的 `Helium Plus` 讓企業能用既有 Wi‑Fi 參與網路，延續 DePIN 實際部署敘事。這與 `refx` 今天的「鏈上與基礎設施資金回流」主線方向相容，但外部站沒有補出更即時的單點新催化。 | 短線漲幅已經比較大，較適合等回踩 `1.05-1.10` 再觀察承接；中期若部署門檻持續下降、裝置與數據量能被更清楚量化，仍屬可追蹤的 DePIN 組。 |
| GAS | $1.78 | +1.25% | 57.9 | `--` | `1.68-1.72` | `1.90-2.00` | `CMC AI` 於 `4/4` 把 GAS 列為波動市中的 top gainer，並回顧 Neo 與 ChainGPT 的 AI 工具整合，以及 Neo 基金會與 NGD 合計 `4.608 億美元` treasury。這代表 GAS 的主線仍是「Neo 生態資源夠厚、AI tooling 有題材」，但短期缺少獨立的新里程碑。 | 這檔較像低位補漲與舊公鏈題材修復，不像新主線。短線可看 `1.68-1.72` 是否有承接；中期若 Neo 生態沒有新增開發者或使用量證據，續航會受限。`Security Scan = --` 不等於安全。 |
| ETHFI | $0.5138 | +6.75% | 59.4 | `Safe / ETH` | `0.47-0.49` | `0.56-0.60` | `CMC AI` 於 `4/15` 更新指出 ether.fi 與 ETHGas 達成約 `30 億美元`、三年的 blockspace 合作，將約 `40%` 的質押 ETH 投入新型執行市場；同時 roadmap 還有 `Cash` 遷移至 OP Mainnet 與 `5000 萬美元` buyback。`crypto.news` 沒有比這更近的逐幣新訊，但歷史稿件仍支撐其「從再質押走向支付/基礎設施」的敘事。 | 題材面其實不弱，但價格仍受 DeFi 板塊競爭與過去拋壓記憶影響。短線若無法穩站 `0.56` 上方，仍偏區間交易；中期若 blockspace 合作真的轉成收入，評價有重估空間。 |
| BSV | $16.47 | +2.72% | 59.6 | `--` | `15.20-15.80` | `17.40-18.20` | `CMC AI` 於 `4/16` 提到 `STAS 3.0` 推出 true layer-1 DEX；`4/15` 的 Goji Wallet Beta 與 `4/10` Chronicle 升級完成，也都在強化 BSV 的擴容與原教旨技術敘事。問題是外部流量與主流資金仍沒有明顯回流，社群分歧很大。 | 這檔比較像技術派與社群派資產，不是市場主線。短線若能穩在 `15.2-15.8` 上方，還有機會測 `17.4+`；中期仍要看新應用與真實使用量，否則很難脫離小圈子行情。`Security Scan = --` 不等於安全。 |
| BNB | $643.31 | +1.18% | 59.9 | `--` | `615-625` | `665-685` | `CMC AI` 於 `4/15` 指出 BNB 正測試 `615-622` 壓力；`4/12` BNB Chain 對 `4/28` 的 Osaka / Mendel hard fork 發出升級提醒，屬於偏基本面正向的網路維護訊號。更長線則還有 Grayscale 現貨 BNB ETF 申請與 `2026` 技術路線圖。 | 這檔是今天名單裡最穩的大幣，但也最接近 `RSI 60` 上緣，追價空間有限。短線重點是 `622` 是否有效站上；中期若硬分叉平穩落地且 BNB Chain 繼續拿到交易/支付流量，仍屬核心觀察組。`Security Scan = --` 不等於安全。 |

## 今日分組觀察

### 1. 優先追蹤組

- `IP / ETHFI / BNB`
- `IP` 是今天最完整的新事件線；`ETHFI` 背後是更偏機構與基礎設施的中期敘事；`BNB` 則是相對穩健、但需要等待技術突破確認。

### 2. 防守與平台組

- `MX / HNT`
- `MX` 受惠交易所產品線與季度 burn 邏輯；`HNT` 有 DePIN 實際應用與 Grayscale watchlist 支撐，但兩者都不像立即爆發型行情。

### 3. 反彈觀察組

- `GAS / BSV`
- 兩檔都有題材可講，但目前更像舊生態修復或小圈子輪動，若沒有後續新增採用數據，不適合過度上修預期。

## 市場背景與風險提醒

- `refx` 這 3 份資料的共同結論是：市場在交易「中東風險沒有完全解除，但鏈上資金與 DeFi / 跨鏈 / 穩定幣基礎設施正在轉強」的混合結構。因此今天適合關注有基礎設施敘事、但尚未過熱的標的，而不是純 meme 追價。
- 今日清單2 只有 `7` 檔，代表現在不是全面山寨超跌反彈，而是少數熱門幣剛好同時滿足 `價格門檻 + 安全條件 + RSI <= 60`。這種盤面適合提高單檔研究密度，不適合硬擴名單。
- `IP / GAS / BSV / BNB` 的 `Security Scan = --` 必須明講：這不等於安全，只代表 CoinMarketCap 當前沒有顯示 `Safe` 或 `Caution` 標記；本次流程只依任務要求排除 `Caution / unknow`。
- `CoinMarketCap RSI` 依舊只穩定暴露 `100` 列，所以本報告是「Trending 候選」與「RSI 可視資料」的交集，不等於全市場完整篩選。
- `ETHFI` 與 `IP` 雖然題材完整，但都屬中型資產，對市場風險偏好與流動性變化相對敏感；若 BTC / ETH 轉弱，這兩檔通常不會獨立走很久。

## 短中期投入評估

- 若是 `短線 1-3 天`，優先順序我會放 `IP > ETHFI > BNB > MX`。`IP` 事件線最新、彈性最大；`ETHFI` 有較新的基礎設施合作；`BNB` 相對穩但接近壓力位；`MX` 屬防守型平台幣反彈。
- 若是 `中期 2-6 週`，優先順序我會放 `BNB > ETHFI > IP > HNT`。`BNB` 的大鏈與 ETF/升級敘事最完整；`ETHFI` 若把 blockspace 與支付產品落地，重估空間不差；`IP` 題材強但要驗證真實採用；`HNT` 則是 DePIN 觀察組。
- 若要選 `防守型觀察`，我會選 `BNB`；若要選 `進攻型題材`，我會選 `IP`；若要選 `中期結構重估`，我會選 `ETHFI`。
- `GAS / BSV` 目前不會列入核心投入組，比較適合有明確交易紀律時的小倉位觀察。

## 來源

1. [CoinMarketCap Trending Top 200](https://coinmarketcap.com/?type=coins&tableRankBy=trending_top_200_24h)
2. [CoinMarketCap RSI](https://coinmarketcap.com/charts/rsi/)
3. [CMC AI - MX Token](https://coinmarketcap.com/cmc-ai/mx-token/latest-updates/)
4. [CMC AI - Story Protocol](https://coinmarketcap.com/cmc-ai/story-protocol/latest-updates/)
5. [CMC AI - Helium](https://coinmarketcap.com/cmc-ai/helium/latest-updates/)
6. [CMC AI - GAS](https://coinmarketcap.com/cmc-ai/gas/latest-updates/)
7. [CMC AI - ether.fi](https://coinmarketcap.com/cmc-ai/ether-fi-ethfi/latest-updates/)
8. [CMC AI - Bitcoin SV](https://coinmarketcap.com/cmc-ai/bitcoin-sv/latest-updates/)
9. [CMC AI - BNB](https://coinmarketcap.com/cmc-ai/bnb/latest-updates/)
10. [crypto.news - Story Protocol launches $360M IP token reserve](https://crypto.news/story-protocol-heritage-distilling-ip-token-2025/)
11. [The Defiant - LDO bucks DeFi downturn after buyback scheme](https://thedefiant.io/news/defi/ldo-bucks-defi-downturn-with-30-monthly-rally-after-dao-passes-buyback-scheme)
12. 本地參考：`E:\work\Crypto\refx\20260417-07.md`、`E:\work\Crypto\refx\20260417-13.md`、`E:\work\Crypto\refx\20260418-06.md`
