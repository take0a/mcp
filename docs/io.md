# 入出力の整理
## Ollama
### API
- https://github.com/take0a/ollama/blob/main/docs.ja/api.md
- https://github.com/take0a/ollama/blob/main/docs/api.md

#### Completion
- Generate a completion `POST /api/generate`
    - Parameters
        - model：モデル名
        - propmpt：レスポンスを生成するためのプロンプト
        - suffix：モデルのレスポンスに続くテキスト
        - images：base64エンコードされた画像のリスト（オプション）
        - think：モデルはレスポンスを返す前に考える必要があるか（思考型モデルの場合）
        ---
        - (format)：レスポンスを返す形式。`json` または JSONスキーマ
        - (options)：Modelfile に記載されている追加パラメータ（`temperature`など）
        - (system)：送信するシステムメッセージ（Modelfileを上書き）
        - (template)：使用するプロンプトテンプレート（Modelfileを上書き）
        - (stream)：`false`の場合は単一のレスポンスが返る
        - (raw)：`true`の場合プロンプトにフォーマットを適用しない
        - (keep_alive)：リクエスト後にモデルがメモリ上ある時間（デフォルトは5ms）
        - (context)：（非推奨）短い会話メモリを保持する
    - Response
        - total_duration：処理時間合計
        - load_duration：モデルのロードに要した時間
        - prompt_eval_count：プロンプト内のトークン数
        - prompt_eval_duration：プロンプトの評価に要した時間
        - eval_count；レスポンス内のトークン数
        - eval_duration：レスポンス生成時間
        - context：この会話のエンコード。会話メモリを保持する場合
        - response：ストリーミングの場合は空。そうでない場合はレスポンス全文

- Generate a chat completion　`POST /api/chat`
    - Parameters
        - model：モデル名
        - messages：チャットのメッセージ。チャットメモリの保持にも使用可能
            - role：メッセージの役割。`system`、`user`、`assistant`、`tool`
            - content：メッセージの内容
            - thinking：モデルの思考プロセス（思考モデルの場合）
            - images：メッセージに含める画像のリスト（オプション）
            - tool_calls：モデルが使用するツールの JSON リスト（オプション）
        ---
        - (format)：レスポンスを返す形式。`json` または JSON スキーマ
        - (option)：Modelfile に記載されている追加パラメータ（`temperature`など）
        - (stream)：`false`の場合は単一のレスポンスが返る
        - (keep_alive)：リクエスト後にモデルがメモリ上ある時間（デフォルトは5ms）


#### Embeddings
- Generate Embeddings `POST /api/embed`
    - Parameters
        - model：埋め込みを生成するモデル名
        - input：埋め込みを生成するテキスト
        ---
        - truncate：各入力の末尾をコンテキスト長まで切り詰める。`false`で超過はエラー
        - options：Modelfile に記載されてる追加パラメータ（`temperature`）
        - keep_alive：リクエスト後にモデルがメモリ上ある時間（デフォルトは5ms）

#### Model
- Create a Model `POST /api/create`
    - Parameters
        - model：作成するモデルの名前
        - form：新しいモデルの作成元となる既存のモデルの名前（オプション）
        - files：モデルの作成元となるファイル名とBLOBのSHA256ダイジェストの辞書（オプション）
        - adapters：LORAアダプタのBLOBのSHA256ダイジェストのファイル名の辞書（オプション）
        - template：モデルのプロンプトテンプレート（オプション）
        - license：モデルのライセンスを含む文字列（オプション）
        - system：モデルのシステムプロンプトを含む文字列（オプション）
        - parameters：モデルのパラメータの辞書（オプション）
        - messages：メッセージの会話のオブジェクト（オプション）
        - stream：`false`の場合、単一のレスポンスオブジェクト（オプション）
        - quantize：量子化されていないモデルを量子化する
            - q4_K_M
            - q4_K_S
            - q8_0

- Copy a Model
- Delete a Model
- Pull a Model
- Push a Model
- List Local Models
- List Running Models
- Show Model Information

#### Others
- Version

## LangChain
### Concept
#### Chat Model
- メソッド
    - invoke：メッセージのリストが入力、メッセージのリストが出力
    - stream：出力生成時にストリーミングする
    - batch：複数のリクエストをまとめて処理する
    - bind_tools：ツールをバインドする
    - with_structured_output：構造化出力をサポートするモデル用の `invoke` ラッパー
- 入出力
    - Message
- パラメータ
    - model：モデルの名前
    - temperature：	モデルの出力のランダム性を制御します。
    値が高いほど（例：1.0）、応答はより創造的になり、値が低いほど（例：0.0）、応答はより決定論的で焦点が絞られたものになります。
    - timeout：リクエストをキャンセルする前にモデルからの応答を待つ最大時間
    - max_tokens：レスポンス内のトークン（単語と句読点）の総数を制限します
    - stop：モデルがトークンの生成を停止するタイミングを示す停止シーケンスを指定します
    - max_retries：リクエストが失敗した場合に、システムがリクエストの再送信を試行する最大回数。
    - api_key：モデルプロバイダーへの認証に必要なAPIキー
    - base_url：リクエストが送信されるAPIエンドポイントのURL
    - rate_limiter：レート制限の超過を回避するためにリクエストの間隔を空けます。

#### Message
- メンバー
    - Role：会話内の異なるタイプのメッセージを区別する
        - `system`：チャットモデルの動作を指示し、追加のコンテキストを提供する
        - `user`：モデルと対話するユーザーからの入力
        - `assistant`：モデルからの応答。テキストやツールを呼び出す要求が含まれる
        - `tool`：ツール呼び出しの結果をモデルに返すために使用される
        - `function`：OpenAI のレガシー関数呼び出し API に対応するレガシー ロール
    - Content：メッセージテキストの内容、またはマルチモーダルデータ（画像、音声、動画など）を表す辞書のリスト
        - SystemMessage：会話を方向付けるために渡すコンテンツ
        - HumanMesage：ユーザーからの入力に含まれるコンテンツ
        - AIMessage：モデルからの応答に含まれるコンテンツ
        - Multimodality：マルチモーダルコンテンツ
    - その他
        - ID：メッセージの一意の識別子（オプション）
        - Name：同じ役割を持つ異なるエンティティ/スピーカーを区別する
        - Metadata：タイムスタンプ、トークンの使用状況など、メッセージに関する追加情報
        - Tool Calls：モデルが1つ以上のツールを呼び出すためのリクエスト

#### Tools
- インターフェース
    - name：ツールの名前
    - description：ツールの機能の説明
    - args：ツールの引数の JSON スキーマ
    ---
    - invoke：同期呼び出し
    - ainvoke：非同期呼び出し
