# 每日加密貨幣追蹤報告 - 2026-04-20

## 方法與今日結論

- 篩選流程：CoinMarketCap Trending Top 200 第 1/2 頁 -> 排除 `價格 < 0.5 USD` 與 `Security Scan = Caution / unknow` -> 對照 CoinMarketCap RSI 可視列 -> 保留 `24H RSI <= 60` 並依 `24H RSI` 由低到高排序。
- 今日結果：`2026-04-20 08:02` 最新快照顯示 Trending 共抓到 `164` 筆，目標清單1 有 `61` 檔；RSI 頁穩定暴露 `100` 列，交叉後目標清單2 只有 `8` 檔。
- 清算帶說明：CoinGlass 公開逐幣圖仍不適合批量穩定取得精確區間，因此以下多空單清算價集中區以「現價、整數位、近期支撐/阻力、24H RSI、近期事件密集價位」保守推估，屬估算區，不是 CoinGlass 精確值。
- `refx` 補充：依建立時間 26 小時內讀取 `E:\work\Crypto\refx`，命中 `20260419-07.md`、`20260419-13.md`、`20260419-22.md`、`20260420-06.md` 共 `4` 份。共同主線很清楚：`Hormuz / 伊朗 / 能源與油運風險` 尚未解除，`Aave / rsETH` 事件仍壓抑 ETH / DeFi 信用層，反而 `支付 rails / 交易所產品 / 穩定幣結算 / 基礎設施` 類敘事更能承接資金。
- 外部搜尋結果：今天真正能補出時間較近、可直接支撐逐幣判讀的來源，仍以 `CoinMarketCap CMC AI / Community` 為主。`crypto.news` 對 `BGB` 補到 `4/3 VIP Fast Track`，對 `ASTER` 補到 `主網 / buyback` 背景；`CoinGecko News` 這批標的仍多數只回價格頁或泛用介紹，沒有比 `CMC AI` 更高品質的逐幣新增催化。

## 目標清單2

| 幣種 | 價格 | 24H % | 24H RSI | Security Scan | 多單清算密集區（估） | 空單清算密集區（估） | 近期動態 | 短中期評估 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| BGB | $1.88 | +1.12% | 39.1 | `--` | `1.76-1.80` | `1.96-2.05` | `CMC AI` 顯示 `4/16` Cobo 加入 Morph `150M` Payment Accelerator、`4/8` Morph 啟動支付加速器、`4/3` `crypto.news` 補到 Bitget 上線 `VIP Fast Track`。主線已不是單純交易所折扣，而是往支付與結算 utility 延伸。 | 這檔是今天名單裡結構最完整的交易所/支付基建幣之一。短線若守住 `1.76-1.80`，有機會回測 `1.96+`；中期要看 Morph 支付量與 BGB burn/激勵機制能否持續轉成實際需求。`Security Scan = --` 不等於安全。 |
| MX | $1.77 | +0.23% | 42.3 | `Safe / ETH` | `1.68-1.72` | `1.85-1.92` | `CMC AI` 顯示 MX 最近仍缺乏新的 token 專屬催化，主要還是 `3/6` 平台上幣與交易成績、`3/9` 安全透明報告，以及 `4/15-5/15` 的 EMBLEM Launchpool。外部站沒有補出更近的新事件。 | 這檔仍偏平台幣防守組，不像要直接走趨勢擴張。短線看 `1.68-1.72` 能否守住；中期要等 burn、launchpool 或新產品線真正拉回注意力。 |
| ASTER | $0.6692 | +0.42% | 48.4 | `Safe / BSC` | `0.61-0.63` | `0.71-0.75` | `CMC AI` 顯示 `4/17` Hyperliquid 重新奪回 perp DEX 主導權，Aster 市占降到約 `15%`，這是明確壓力；但 `4/14` Binance Wallet 內建交易擴充到股票、ETF、商品，`crypto.news` 也補到 buyback 與主網背景。 | 這檔短線仍有產品敘事，但競爭壓力很實在。若無法快速站回 `0.71+`，更像反彈交易而不是新主線；中期要看錢包整合、主網與治理/質押功能能否把流量留住。 |
| HNT | $1.07 | +3.28% | 49.9 | `Safe / SOL` | `0.98-1.01` | `1.12-1.18` | `CMC AI` 顯示 `4/13` Grayscale 把 HNT 納入 Q2 watchlist，`4/2` 社群通過可轉移 staked HNT，且 `8/1` 還有下一次 emission halving。`refx` 的市場背景偏好實體 utility，對 DePIN 比純高 beta 更友善。 | 這檔今天是中期觀察價值偏高的一檔。短線先看 `1.12-1.18` 是否出現壓力；中期若 Grayscale 觀察名單持續發酵、DePIN 重回主流、halving 接近，勝率高於一般題材幣。 |
| ZEN | $5.77 | +1.45% | 51.2 | `Safe / BASE` | `5.35-5.50` | `6.10-6.35` | `CMC AI` 顯示 `4/19` SoDex Horizen TGE 上線、`3/16` Vela confidential compute 平台推出、`3/18` SEC 終止對 Horizen Labs 的案件。這組合讓 ZEN 從老隱私幣敘事轉向「可合規的隱私計算 / appchain」。 | 這檔屬今天最值得留意的中期題材組。短線若站上 `6.10` 才算更明確轉強；中期則要看 Base 上的 confidential compute 與開發者擴張是否真的跑出使用量。 |
| XMR | $347.31 | +0.69% | 53.6 | `--` | `330-338` | `360-375` | `CMC AI` 顯示 `4/19` Monero 12 週年偏中性、`4/18` 市場交易 THORChain bridge 預期、`4/16` Qubic 逐步把礦工獎勵從 XMR 轉向 DOGE 則是逆風。近期強勢背後有橋接與隱私需求，但也有礦工經濟變動。 | 這檔不是弱勢，但已不算便宜。短線看 `330-338` 能否守住；中期仍可追蹤 THORChain 整合是否落地，但位置偏高，較適合觀察回踩而不是追價。`Security Scan = --` 不等於安全。 |
| PENDLE | $1.23 | +8.99% | 54.0 | `Safe / ARB` | `1.12-1.16` | `1.32-1.38` | `CMC AI` 顯示 `4/18` 上漲主因是實際收益需求，而不是純投機；`4/15` STRC 高收益股票在鏈上交易量放大，強化 Pendle 在 RWA/yield trading 的基建角色。 | 這檔是今天少數基本面和敘事都算順的 DeFi 標的，但 `refx` 對 DeFi 信用層整體仍偏保守。短線先看能否穩住 `1.20` 上方；中期若 RWA 收益與 Boros/傳統資產延伸持續，仍屬優先追蹤組。 |
| AR | $2.04 | +0.68% | 59.4 | `--` | `1.90-1.95` | `2.15-2.28` | `CMC AI` 顯示近期 AR 的主軸仍是 `permaweb / AI infra / 去中心化儲存` 的長線重估，`4/11` 的樂觀分析與 `3/3` AWS outage 的敘事驗證都偏結構性，不是當日型催化。 | 這檔比較像中期題材觀察，不像短線強攻組。今天 `24H RSI` 已接近上緣，若要布局更適合等回踩 `1.90-1.95`；中期則看 AI / 永久儲存需求能否持續轉成可驗證的網路使用量。`Security Scan = --` 不等於安全。 |

## 今日分組觀察

### 1. 優先追蹤組

- `BGB / HNT / PENDLE`
- `BGB` 有支付 rails 與平台激勵雙主線；`HNT` 有 Grayscale watchlist 與 halving 預期；`PENDLE` 則是少數仍有實際收益需求支撐的 DeFi 基建幣。

### 2. 中期題材組

- `ZEN / AR`
- `ZEN` 偏合規隱私計算與 appchain；`AR` 偏 AI 資料層與永久儲存。兩檔都不是今天最強動能，但中期敘事完整度不差。

### 3. 反彈與觀察組

- `MX / ASTER / XMR`
- `MX` 偏平台幣防守；`ASTER` 有產品更新但面臨競爭壓力；`XMR` 已有橋接預期與隱私需求，但價格位置偏高、波動也大。

## 市場背景與風險提醒

- `refx` 這 4 份資料的共同結論是：`Hormuz / 伊朗 / 油運` 風險還沒解除，所以高 beta 山寨不適合用全面 risk-on 心態看待。
- 加密內部今天最重要的負面背景仍是 `Aave / rsETH / Kelp DAO` 後續處理，這會持續壓抑 ETH beta、再質押與部分 DeFi 信用層估值。
- 另一條需要注意的線是 `ENS gateway DNS hijack` 與 `Vercel breach`，代表市場對 Web3 入口層與基礎設施供應鏈風險會更敏感。
- 相對地，`BGB / HNT / ZEN` 這類偏交易基礎設施、實體網路 utility、合規隱私計算的敘事，更符合今天的資金偏好。
- 今日清單2 只有 `8` 檔，代表現在不是全面 altseason，而是少數熱門幣剛好同時滿足 `價格門檻 + 安全條件 + RSI <= 60`。這種盤面更適合提高單檔研究密度，不適合擴表。
- `BGB / XMR / AR` 的 `Security Scan = --` 必須明講：這不等於安全，只代表 CoinMarketCap 當前沒有顯示 `Safe` 或 `Caution` 標記；本次流程只依任務要求排除 `Caution / unknow`。
- `CoinMarketCap RSI` 依舊只穩定暴露 `100` 列，所以本報告是「Trending 候選」與「RSI 可視資料」的交集，不等於全市場完整篩選。

## 短中期投入評估

- 若是 `短線 1-3 天`，優先順序我會放 `BGB > PENDLE > HNT > ZEN`。`BGB` 結構最平衡；`PENDLE` 有量能與 yield 敘事；`HNT` 有機構 watchlist；`ZEN` 則偏事件剛起步。
- 若是 `中期 2-6 週`，優先順序我會放 `HNT > BGB > ZEN > PENDLE`。`HNT` 有 halving 與 DePIN 主線；`BGB` 有支付 rails 與 Morph 生態；`ZEN` 有合規隱私計算；`PENDLE` 則看 RWA/yield trading 能否持續擴大。
- 若要選 `防守型觀察`，我會選 `BGB / MX`；若要選 `中期成長題材`，我會選 `HNT / ZEN`；若要選 `高波動但仍有基本面支撐`，我會選 `PENDLE`。
- `ASTER / XMR / AR` 目前不會放進第一層核心投入組。`ASTER` 競爭壓力高，`XMR` 位置偏高，`AR` 則較像等待更明確量能驗證的中期題材。

## 來源

1. [CoinMarketCap Trending Top 200](https://coinmarketcap.com/?type=coins&tableRankBy=trending_top_200_24h)
2. [CoinMarketCap RSI](https://coinmarketcap.com/charts/rsi/)
3. [CMC AI - Bitget Token](https://coinmarketcap.com/cmc-ai/bitget-token-new/latest-updates/)
4. [CMC AI - MX Token](https://coinmarketcap.com/cmc-ai/mx-token/latest-updates/)
5. [CMC AI - Aster](https://coinmarketcap.com/cmc-ai/aster/latest-updates/)
6. [CMC AI - Helium](https://coinmarketcap.com/cmc-ai/helium/latest-updates/)
7. [CMC AI - Horizen](https://coinmarketcap.com/cmc-ai/horizen/latest-updates/)
8. [CMC AI - Monero](https://coinmarketcap.com/cmc-ai/monero/latest-updates/)
9. [CMC AI - Pendle](https://coinmarketcap.com/cmc-ai/pendle/latest-updates/)
10. [CMC AI - Arweave](https://coinmarketcap.com/cmc-ai/arweave/latest-updates/)
11. [crypto.news - Bitget launches VIP Fast Track to tie perks directly to trading behavior](https://crypto.news/bitget-launches-vip-fast-track-to-tie-perks-directly-to-trading-behavior)
12. [crypto.news - Aster holds range as traders position for March mainnet launch](https://crypto.news/aster-holds-range-as-traders-position-for-march-mainnet-launch/)
13. [crypto.news - Aster activates additional buyback reserve with up to 40% daily fees](https://crypto.news/aster-strategic-buyback-reserve-daily-fees-2025/)
14. 本地參考：`E:\work\Crypto\refx\20260419-07.md`、`E:\work\Crypto\refx\20260419-13.md`、`E:\work\Crypto\refx\20260419-22.md`、`E:\work\Crypto\refx\20260420-06.md`
