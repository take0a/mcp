# LangChain
- https://github.com/take0a/langchain/blob/master/docs/docs.ja/introduction.mdx

## concept
- なぜ、LangChain か
    - https://github.com/take0a/langchain/blob/master/docs/docs.ja/concepts/why_langchain.mdx
    - インターフェースの標準化
        - AIアプリケーション向けのモデルと関連コンポーネントのインターフェース公開
    - オーケストレーション
        - モデルとコンポーネントを効率的に制御フローに接続
    - 可観測性と評価
        - LLM を比較できる

- コンセプト
    - https://github.com/take0a/langchain/blob/master/docs/docs.ja/concepts/index.mdx
    - モデルは２つ
        - チャットモデル：チャットAPIを介して公開されるLLM
        - 埋め込みモデル：テキストや画像などのデータをベクトル表現するモデル
    - コンポーネント
        - メッセージ
        - チャット履歴
        - ツール：名前、説明、引数を定義するスキーマの付いた関数。
        - ツール呼び出し：のAPI
        - 構造化出力：JSONなどの構造化形式で出力
        - メモリ：会話情報の永続化、再利用
        - マルチモダリティ
        - 実行可能インターフェース
        - ストリーミング：生成された結果
        - LangChain Expression Language：オーケストレーションする構文
        - ドキュメントローダー
        - 検索：データソースからデータを取得
        - テキストスプリッター
        - ベクターストア
        - リトリーバー：ナレッジベースから関連ドキュメントを返す
        - RAG
        - エージェント：LLMを使用して、実行するアクションのシーケンスを選択する
            - エージェントはツールを介して外部リソースと対話できる
        - プロンプトテンプレート
        - 出力パーサー：出力をどうこうする。ツール呼び出しと構造化出力で代替されてる
        - few-shot prompting：プロンプトで実行する例を提供する
        - 例セレクタ：データセットから入力と関連性の高い例を選択する
        - 非同期プログラミング
        - コールバック
        - トレース
        - 評価
        - テスト

## tutorial
- https://github.com/take0a/langchain/blob/master/docs/docs.ja/tutorials/index.mdx

- 要するに、LLM ができることは、チャットと埋め込み
    - チャットは、１）チャット、３）分類、４）抽出ができる
    - 埋め込みは、２）ベクトルを作るだけ


ー