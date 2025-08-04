# ER図
## 目的
- テスト用の本格的なモデルを用意するため
- 見込み顧客から要望があるため調査する

## dbdiagram.io
### ドキュメント
- https://docs.dbdiagram.io/
- https://qiita.com/zumax/items/0b7682ef52de72cf9efc
- https://hackernoon.com/dbdiagram-io-a-database-diagram-designer-built-for-developers-and-analysts-975f310d4f13

位置情報が保存できないので、少ないテーブル数（おもちゃ）以外は無理。


## draw.io
### インストール
- VSCode 拡張
    - Draw.io Integration

### 使い方
- .dio か .drawio ファイルを開くだけ
- `+その他図形`から ER を選ぶ
- XML で開く場合は、ファイル右クリックの `ファイルを開くアプリケーションの選択` で `テキストエディター`
- https://drawio-app.com/erd/

- 配置＞挿入＞高度な設定＞テキストから挿入
    ```
    販売計画
        - 計画開始日
        - 計画終了日
        - 営業部門コード
        - 営業担当者コード
        - 製品（品目）コード
        - 月別販売計画数量[6]
        - 月別販売計画金額[6]
        - 月別販売実績数量[6]
        - 月別販売実績・見積限界利益
    ```
- https://www.drawio.com/blog/insert-from-text

- ＞SQL
- https://www.drawio.com/blog/insert-sql
- 全般
- https://www.drawio.com/doc/faq/arrange-insert-menu
