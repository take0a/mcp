# Ollama
## Windows
### デフォルト
- インストール
    - インストーラ
        - https://ollama.com/download/OllamaSetup.exe
        - 715,286 KB
    - インストール先
        - C:\Users\araki\AppData\Local\Programs\Ollama
        - 3.93 GB
        - Microsoft Visual C++ 2015-2022 Redistributable(x64) - 14.44.35208
            - 29.7 MB
    - 設定＞アプリ＞スタートアップ
        - ollama.exe：オン
    - タスクバー
        - Settings
            - Expose Ollama to the network：オフ
            - Model location：C:\Users\araki\.ollama\models
        - View logs
            - C:\Users\araki\AppData\Local\Ollama

- server.log
    ```
    time=2025-07-23T18:46:52.526+09:00 level=WARN source=amd_windows.go:138 msg="amdgpu is not supported (supported types:[gfx1030 gfx1100 gfx1101 gfx1102 gfx1151 gfx906])" gpu_type=gfx1103 gpu=0 library=C:\Users\araki\AppData\Local\Programs\Ollama\lib\ollama\rocm
    time=2025-07-23T18:46:52.528+09:00 level=INFO source=gpu.go:377 msg="no compatible GPUs were discovered"
    ```
    ということで、デフォルトでは、サポート対象の GPU として見つけられない。

- 実行
    ```bash
    $ ollama run gemma3
    pulling manifest
    pulling aeda25e63ebd: 100% ▕███████████████████████████████████████████████▏ 3.3 GB
    pulling e0a42594d802: 100% ▕███████████████████████████████████████████████▏  358 B
    pulling dd084c7d92a3: 100% ▕███████████████████████████████████████████████▏ 8.4 KB
    pulling 3116c5225075: 100% ▕███████████████████████████████████████████████▏   77 B
    pulling b6ae5839783f: 100% ▕███████████████████████████████████████████████▏  489 B
    verifying sha256 digest
    writing manifest
    success
    >>> 
    ```
    - モデルのダウンロードが開始する
        - C:\Users\araki\.ollama\models
        - gemma3 は、3.3 GB

    ```
    >>> 2023年1月1日に昭和電工と昭和電工マテリアルズが統合してできた新会社を答えてください。
    2023年1月1日に昭和電工と昭和電工マテリアルズが統合してできた新会社は、**昭和電工**です。

    統合後の会社名は「昭和電工」であり、両社の事業を一本化して、より一層の事業拡大を目指しています。

    >>> 友達と自然を楽しんだり温泉に入ったりしてのんびりするような旅行がしたいと考えています。 旅行先とその具体的なプランについて案を出してください。
    友達と自然と温泉でのんびり過ごす旅行、いいですね！いくつかプランをご提案させていただきます。予算や時期、友達の好みに合わせて調整し     
    てくださいね。

    **1. 飛騨・白川郷・上高地（3泊4日）**

    *   **テーマ:** 日本の原風景と絶景、温泉の組み合わせ
    *   **おすすめポイント:**
        *   **白川郷:** 合掌造り集落の美しい景観は圧巻。体験プログラムも充実しています。
        *   **上高地:** 整備されたハイキングコースで、豊かな自然を満喫。五箇山の合場は絶景スポットです。
        *   **温泉:** 上高地温泉、白川郷温泉など、自然に囲まれた温泉でゆったりと過ごせます。
        *   **アクティビティ:** ハイキング、写真撮影、伝統工芸体験（藁葺き体験など）
    *   **予算目安:** 1人あたり5万円～10万円
    *   **時期:** 春（桜）、秋（紅葉）がおすすめです。

    **2. 軽井沢・野沢温泉（3泊4日）**

    *   **テーマ:** おしゃれなリゾートと温泉の贅沢
    *   **おすすめポイント:**
        *   **軽井沢:** おしゃれなカフェやレストラン、ショッピングなど、洗練された雰囲気が魅力。
        *   **野沢温泉:** 湯治場のような温かい雰囲気で、家族経営の旅館が多く、おもてなしが心地よいです。
        *   **アクティビティ:** ゴルフ、乗馬、サイクリング、温泉巡り
    *   **予算目安:** 1人あたり4万円～8万円
    *   **時期:** 春（ tulips）、秋（紅葉）がおすすめです。

    **3. 箱根・伊豆（3泊4日）**

    *   **テーマ:** 海と山の絶景、多様な温泉
    *   **おすすめポイント:**
        *   **箱根:** 芦ノ湖、大涌谷、箱根ロープウェイなど、見どころ満載。
        *   **伊豆:** 海岸線沿いの温泉旅館や、太平洋を一望できる展望温泉など、様々な温泉が楽しめます。
        *   **アクティビティ:** 海水浴、マリンスポーツ、温泉巡り、美術館巡り
    *   **予算目安:** 1人あたり5万円～10万円
    *   **時期:** 夏（海水浴）、秋（紅葉）がおすすめです。

    **4. 志摩・伊勢（3泊4日）**

    *   **テーマ:** 海の恵みと歴史、神秘的な観光スポット
    *   **おすすめポイント:**
        *   **志摩:** 志摩スペイン村、白砂青松海岸など、テーマパークや美しい海岸線。
        *   **伊勢:** 伊勢神宮、なら、古都の風情。
        *   **温泉:** 志摩ぬれ温泉など、様々な温泉が楽しめます。
        *   **アクティビティ:** 海水浴、マリンスポーツ、歴史探訪、温泉巡り
    *   **予算目安:** 1人あたり6万円～12万円
    *   **時期:** 夏（海水浴）、春（桜）がおすすめです。

    **プランを立てる際のポイント:**

    *   **予算:** 宿泊費、交通費、食費、アクティビティ費用などを考慮して、無理のない範囲で予算を設定しましょう。
    *   **時期:** 各地の観光スポットやイベントに合わせて、最適な時期を選びましょう。
    *   **移動手段:** 鉄道、バス、レンタカーなど、移動手段を事前に検討しましょう。
    *   **宿泊施設:** 温泉旅館、ホテル、民宿など、好みに合わせて宿泊施設を選びましょう。
    *   **アクティビティ:** 興味のあるアクティビティを事前に調べて、予約しておきましょう。

    これらのプランはあくまで提案ですので、友達と話し合って、みんなが楽しめる最高の旅行プランを作り上げてくださいね！
    もし、もっと具体的な要望（例えば、特定のテーマやアクティビティ、予算など）があれば、さらに詳細なプランをご提案できますので、お気軽     
    にお知らせください。

    >>> Send a message (/? for help)
    ```
    かなり早い。が、昭和電工のは間違い。

- mmnga/Gemma-2-Llama-Swallow-9b-it-v0.1-gguf
    ```
    $ ollama run hf.co/mmnga/Gemma-2-Llama-Swallow-9b-it-v0.1-gguf
    pulling manifest
    pulling 53cb4b802be7: 100% ▕█████████████████████████████████████████████████████████████████████████▏ 5.8 GB
    pulling e0a42594d802: 100% ▕█████████████████████████████████████████████████████████████████████████▏  358 B
    pulling aa9944b56495: 100% ▕█████████████████████████████████████████████████████████████████████████▏   44 B
    pulling f779095f000f: 100% ▕█████████████████████████████████████████████████████████████████████████▏  555 B
    verifying sha256 digest
    writing manifest
    success>>> 2023年1月1日に昭和電工と昭和電工マテリアルズが統合してできた新会社を答えてください。
    2023年1月1日に昭和電工と昭和電工マテリアルズが統合してできた新会社は **レゾナック・ホールディングス** です。 





    >>> 友達と自然を楽しんだり温泉に入ったりしてのんびりするような旅行がしたいと考えています。 旅行先とその具体的なプランについて案を出して
    ... ください
    ## 自然満喫＆温泉でリフレッシュ！ のんびり旅行プラン案

    友達とゆっくり過ごしたい気持ち、すごくよく分かります！ 

    いくつか旅行先候補と具体的なプランを提案させてください。 

    **1.  長野県・軽井沢エリア**

    * **自然:** 
        * 軽井沢高原教会や雲場池で散策。
        * 白糸の滝へハイキング。
        * 星野温泉「星野リゾート 軽井沢ホテル」で星空観察。
    * **温泉:** 
        *  「万平ホテル」の庭園露天風呂で贅沢なひとときを。
        *  「軽井沢プリンスショッピングプラザ」内の日帰り温泉施設「湯けむり処」で気軽に温泉体験。
    * **グルメ:** 
        *  軽井沢名物「プリン」を食べ比べ！
        *  地元食材を使ったイタリアンレストランでディナー。

    **2. 静岡県・伊豆半島**

    * **自然:** 
        *  「伊豆シャボテン公園」でカラフルなサボテンを鑑賞。
        *  「熱海城」からの絶景を眺めながらハイキング。
        *  「堂ヶ島海岸」で美しい海と奇岩を楽しむクルーズ。
    * **温泉:** 
        *  「熱海温泉」の老舗旅館で贅沢な温泉ステイ。
        *  「伊豆高原温泉」の日帰り温泉施設で、海を眺めながら温泉に浸かる。
    * **アクティビティ:** 
        *  「伊東温泉」周辺でサイクリング。
        *  「下田公園」で歴史を感じながら散策。

    **3. 兵庫県・有馬温泉エリア**

    * **自然:** 
        *  「六甲山」のロープウェイから絶景を堪能。
        *  「神戸布引ハーブ園」でハーブガーデンを散策。
        *  「有馬温泉」周辺の紅葉スポットを巡る。
    * **温泉:** 
        *  「金泉・銀泉」と呼ばれる異なる種類の温泉を楽しめる旅館に宿泊。
        *  「有馬温泉街」の足湯や日帰り温泉施設で気軽に温泉体験。
    * **グルメ:** 
        *  「有馬温泉名物」の「炭酸せんべい」を味わう。
        *  神戸牛を使ったディナーを楽しむ。

    **プラン作成のヒント**

    * 友達と事前に好みや予算、旅行期間などを話し合って決める。
    * 各地の観光情報サイトやブログなどを参考に、興味のあるスポットをピックアップする。
    * 予約が必要な施設やアクティビティは早めに予約しておく。
    * 移動手段や宿泊施設も事前に検討しておく。

    楽しい旅行になりますように！
    ```
    一代前のモデルでも昭和電工は正解。パラメータ数が倍だと少し遅くなったかもしれないが早い。

    Gemma2 の公開は 2024/6/27
    Gemma2-Swallow の公開は 2025/5/19
    Gemma3 の公開は 2025/3/12

- 検証
    - `/set verbose` 指定する
    - プロンプトは、`AIの未来を予測してください。（100字）`
    - Gemma3 シリーズ
        - https://ollama.com/library/gemma3
        - gemma3:1b
        - gemma3:4b
        - gemma3:12b
        - gemma3:27b

```
$ ollama run gemma3:1b
pulling manifest
pulling 7cd4618c1faf: 100% ▕█████████████████████████████████████████████████████████████████████████▏ 815 MB
pulling e0a42594d802: 100% ▕█████████████████████████████████████████████████████████████████████████▏  358 B
pulling dd084c7d92a3: 100% ▕█████████████████████████████████████████████████████████████████████████▏ 8.4 KB
pulling 3116c5225075: 100% ▕█████████████████████████████████████████████████████████████████████████▏   77 B
pulling 120007c81bf8: 100% ▕█████████████████████████████████████████████████████████████████████████▏  492 B
verifying sha256 digest
writing manifest
success
>>> /set verbose
Set 'verbose' mode.
>>> AIの未来を予測してください。（100字）
AIは、医療、教育、環境問題など、あらゆる分野で革新をもたらし、生活を豊かにするでしょう。一方で、雇用、倫理、プライバシーといった課     
題も顕在化し、人間の価値観との相互作用が重要になります。未来は、AIとの協調によって、より良い社会を築く鍵となるでしょう。

total duration:       1.5225842s
load duration:        87.4568ms
prompt eval count:    21 token(s)
prompt eval duration: 97.9245ms
prompt eval rate:     214.45 tokens/s
eval count:           74 token(s)
eval duration:        1.3358862s
eval rate:            55.39 tokens/s
>>> 
```

```
$ ollama run gemma3:4b
pulling manifest
pulling aeda25e63ebd: 100% ▕█████████████████████████████████████████████████████████████████████████▏ 3.3 GB
pulling e0a42594d802: 100% ▕█████████████████████████████████████████████████████████████████████████▏  358 B
pulling dd084c7d92a3: 100% ▕█████████████████████████████████████████████████████████████████████████▏ 8.4 KB
pulling 3116c5225075: 100% ▕█████████████████████████████████████████████████████████████████████████▏   77 B
pulling b6ae5839783f: 100% ▕█████████████████████████████████████████████████████████████████████████▏  489 B
verifying sha256 digest
writing manifest
success
>>> /set verbose
Set 'verbose' mode.
>>> AIの未来を予測してください。（100字）
AIは、より高度な自然言語処理、画像認識、そして創発的な能力を獲得し、社会インフラ、医療、教育などあらゆる分野に浸透すると予想されま     
す。同時に、倫理的な課題や雇用の変化など、人間社会への影響も増大し、AIとの共存が試されるでしょう。

total duration:       3.7849146s
load duration:        84.0733ms
prompt eval count:    21 token(s)
prompt eval duration: 266.0957ms
prompt eval rate:     78.92 tokens/s
eval count:           69 token(s)
eval duration:        3.4336901s
eval rate:            20.09 tokens/s
>>>
```

```
$ ollama run gemma3:12b
pulling manifest
pulling e8ad13eff07a: 100% ▕█████████████████████████████████████████████████████████████████████████▏ 8.1 GB
pulling e0a42594d802: 100% ▕█████████████████████████████████████████████████████████████████████████▏  358 B
pulling dd084c7d92a3: 100% ▕█████████████████████████████████████████████████████████████████████████▏ 8.4 KB
pulling 3116c5225075: 100% ▕█████████████████████████████████████████████████████████████████████████▏   77 B
pulling 6819964c2bcf: 100% ▕█████████████████████████████████████████████████████████████████████████▏  490 B
verifying sha256 digest
writing manifest
success
>>> /set verbose
Set 'verbose' mode.
>>> AIの未来を予測してください。（100字）
AIは、より人間らしく、創造的になり、あらゆる産業に深く浸透するでしょう。自動化が進む一方で、新たな仕事も生まれ、社会構造や倫理観に     
大きな変革をもたらす可能性があります。

total duration:       7.201542s
load duration:        91.5682ms
prompt eval count:    21 token(s)
prompt eval duration: 812.7965ms
prompt eval rate:     25.84 tokens/s
eval count:           47 token(s)
eval duration:        6.2961502s
eval rate:            7.46 tokens/s
>>> Send a message (/? for help)
```

```
$ ollama run gemma3:27b
pulling manifest
pulling e796792eba26: 100% ▕█████████████████████████████████████████████████████████████████████████▏  17 GB
pulling e0a42594d802: 100% ▕█████████████████████████████████████████████████████████████████████████▏  358 B
pulling dd084c7d92a3: 100% ▕█████████████████████████████████████████████████████████████████████████▏ 8.4 KB
pulling 3116c5225075: 100% ▕█████████████████████████████████████████████████████████████████████████▏   77 B
pulling f838f048d368: 100% ▕█████████████████████████████████████████████████████████████████████████▏  490 B
verifying sha256 digest
writing manifest
success
>>> /set verbose
Set 'verbose' mode.
>>> AIの未来を予測してください。（100字）
AIは、より専門化・多様化し、社会インフラや医療、教育に不可欠な存在となるでしょう。同時に、倫理的な課題や雇用への影響も大きく、人間     
との共存が鍵となります。汎用AIの登場は、社会構造を根底から変える可能性も秘めています。


total duration:       22.710211s
load duration:        91.2959ms
prompt eval count:    21 token(s)
prompt eval duration: 1.9460741s
prompt eval rate:     10.79 tokens/s
eval count:           70 token(s)
eval duration:        20.6723354s
eval rate:            3.39 tokens/s
>>>
```

### 780M
- https://github.com/likelovewant/ollama-for-amd/releases
- https://github.com/ByronLeeeee/Ollama-For-AMD-Installer/releases

```
$ ollama run gemma3:27b
>>> /set verbose
Set 'verbose' mode.
>>> AIの未来を予測してください。（100字）
Error: model runner has unexpectedly stopped, this may be due to resource limitations or an internal error, check ollama server logs for details

$ ollama run gemma3:1b
>>> /set verbose
Set 'verbose' mode.
>>> AIの未来を予測してください。（100字）
Error: model runner has unexpectedly stopped, this may be due to resource limitations or an internal error, check ollama server logs for details
```

```server.log
time=2025-07-24T18:29:05.861+09:00 level=INFO source=routes.go:1235 msg="server config" env="map[CUDA_VISIBLE_DEVICES: GPU_DEVICE_ORDINAL: HIP_VISIBLE_DEVICES: HSA_OVERRIDE_GFX_VERSION: HTTPS_PROXY: HTTP_PROXY: NO_PROXY: OLLAMA_CONTEXT_LENGTH:4096 OLLAMA_DEBUG:INFO OLLAMA_FLASH_ATTENTION:false OLLAMA_GPU_OVERHEAD:0 OLLAMA_HOST:http://127.0.0.1:11434 OLLAMA_INTEL_GPU:false OLLAMA_KEEP_ALIVE:5m0s OLLAMA_KV_CACHE_TYPE: OLLAMA_LLM_LIBRARY: OLLAMA_LOAD_TIMEOUT:5m0s OLLAMA_MAX_LOADED_MODELS:0 OLLAMA_MAX_QUEUE:512 OLLAMA_MODELS:C:\\Users\\araki\\.ollama\\models OLLAMA_MULTIUSER_CACHE:false OLLAMA_NEW_ENGINE:false OLLAMA_NOHISTORY:false OLLAMA_NOPRUNE:false OLLAMA_NUM_PARALLEL:0 OLLAMA_ORIGINS:[http://localhost https://localhost http://localhost:* https://localhost:* http://127.0.0.1 https://127.0.0.1 http://127.0.0.1:* https://127.0.0.1:* http://0.0.0.0 https://0.0.0.0 http://0.0.0.0:* https://0.0.0.0:* app://* file://* tauri://* vscode-webview://* vscode-file://*] OLLAMA_SCHED_SPREAD:false ROCR_VISIBLE_DEVICES:]"
time=2025-07-24T18:29:05.878+09:00 level=INFO source=images.go:476 msg="total blobs: 14"
time=2025-07-24T18:29:05.878+09:00 level=INFO source=images.go:483 msg="total unused blobs removed: 0"
time=2025-07-24T18:29:05.878+09:00 level=INFO source=routes.go:1288 msg="Listening on 127.0.0.1:11434 (version 0.9.6)"
time=2025-07-24T18:29:05.878+09:00 level=INFO source=gpu.go:217 msg="looking for compatible GPUs"
time=2025-07-24T18:29:05.878+09:00 level=INFO source=gpu_windows.go:167 msg=packages count=1
time=2025-07-24T18:29:05.878+09:00 level=INFO source=gpu_windows.go:214 msg="" package=0 cores=8 efficiency=0 threads=16
time=2025-07-24T18:29:06.398+09:00 level=INFO source=types.go:130 msg="inference compute" id=0 library=rocm variant="" compute=gfx1103 driver=6.1 name="AMD Radeon 780M Graphics" total="33.7 GiB" available="33.6 GiB"
[GIN] 2025/07/24 - 18:29:06 | 200 |            0s |       127.0.0.1 | HEAD     "/"
[GIN] 2025/07/24 - 18:29:06 | 200 |     79.0733ms |       127.0.0.1 | POST     "/api/show"
time=2025-07-24T18:29:06.963+09:00 level=INFO source=sched.go:189 msg="one or more GPUs detected that are unable to accurately report free memory - disabling default concurrency"
time=2025-07-24T18:29:07.044+09:00 level=INFO source=sched.go:788 msg="new model will fit in available VRAM in single GPU, loading" model=C:\Users\araki\.ollama\models\blobs\sha256-e796792eba26c4d3b04b0ac5adb01a453dd9ec2dfd83b6c59cbf6fe5f30b0f68 gpu=0 parallel=2 available=36083236864 required="20.1 GiB"
time=2025-07-24T18:29:07.461+09:00 level=INFO source=server.go:135 msg="system memory" total="47.8 GiB" free="41.3 GiB" free_swap="41.7 GiB"
time=2025-07-24T18:29:07.462+09:00 level=INFO source=server.go:175 msg=offload library=rocm layers.requested=-1 layers.model=63 layers.offload=63 layers.split="" memory.available="[33.6 GiB]" memory.gpu_overhead="0 B" memory.required.full="20.1 GiB" memory.required.partial="20.1 GiB" memory.required.kv="1.6 GiB" memory.required.allocations="[20.1 GiB]" memory.weights.total="15.4 GiB" memory.weights.repeating="14.3 GiB" memory.weights.nonrepeating="1.1 GiB" memory.graph.full="565.0 MiB" memory.graph.partial="1.6 GiB" projector.weights="795.9 MiB" projector.graph="1.0 GiB"
time=2025-07-24T18:29:07.517+09:00 level=INFO source=server.go:438 msg="starting llama server" cmd="C:\\Users\\araki\\AppData\\Local\\Programs\\Ollama\\ollama.exe runner --ollama-engine --model C:\\Users\\araki\\.ollama\\models\\blobs\\sha256-e796792eba26c4d3b04b0ac5adb01a453dd9ec2dfd83b6c59cbf6fe5f30b0f68 --ctx-size 8192 --batch-size 512 --n-gpu-layers 63 --threads 8 --parallel 2 --port 49262"
time=2025-07-24T18:29:07.521+09:00 level=INFO source=sched.go:483 msg="loaded runners" count=1
time=2025-07-24T18:29:07.521+09:00 level=INFO source=server.go:598 msg="waiting for llama runner to start responding"
time=2025-07-24T18:29:07.521+09:00 level=INFO source=server.go:632 msg="waiting for server to become available" status="llm server error"
time=2025-07-24T18:29:07.553+09:00 level=INFO source=runner.go:925 msg="starting ollama engine"
time=2025-07-24T18:29:07.570+09:00 level=INFO source=runner.go:983 msg="Server listening on 127.0.0.1:49262"
time=2025-07-24T18:29:07.610+09:00 level=INFO source=ggml.go:92 msg="" architecture=gemma3 file_type=Q4_K_M name="" description="" num_tensors=1247 num_key_values=37
time=2025-07-24T18:29:07.772+09:00 level=INFO source=server.go:632 msg="waiting for server to become available" status="llm server loading model"
ggml_cuda_init: GGML_CUDA_FORCE_MMQ:    no
ggml_cuda_init: GGML_CUDA_FORCE_CUBLAS: no
ggml_cuda_init: found 1 ROCm devices:
  Device 0: AMD Radeon 780M Graphics, gfx1103 (0x1103), VMM: no, Wave Size: 32
load_backend: loaded ROCm backend from C:\Users\araki\AppData\Local\Programs\Ollama\lib\ollama\ggml-hip.dll
load_backend: loaded CPU backend from C:\Users\araki\AppData\Local\Programs\Ollama\lib\ollama\ggml-cpu-icelake.dll
time=2025-07-24T18:29:33.274+09:00 level=INFO source=ggml.go:104 msg=system CPU.0.SSE3=1 CPU.0.SSSE3=1 CPU.0.AVX=1 CPU.0.AVX2=1 CPU.0.F16C=1 CPU.0.FMA=1 CPU.0.BMI2=1 CPU.0.AVX512=1 CPU.0.AVX512_VBMI=1 CPU.0.AVX512_VNNI=1 CPU.0.LLAMAFILE=1 CPU.1.LLAMAFILE=1 ROCm.0.NO_VMM=1 ROCm.0.NO_PEER_COPY=1 ROCm.0.PEER_MAX_BATCH_SIZE=128 compiler=cgo(clang)
time=2025-07-24T18:29:34.425+09:00 level=INFO source=ggml.go:359 msg="offloading 62 repeating layers to GPU"
time=2025-07-24T18:29:34.425+09:00 level=INFO source=ggml.go:365 msg="offloading output layer to GPU"
time=2025-07-24T18:29:34.425+09:00 level=INFO source=ggml.go:375 msg="offloaded 63/63 layers to GPU"
time=2025-07-24T18:29:34.425+09:00 level=INFO source=ggml.go:377 msg="model weights" buffer=ROCm0 size="16.2 GiB"
time=2025-07-24T18:29:34.425+09:00 level=INFO source=ggml.go:377 msg="model weights" buffer=CPU size="1.1 GiB"
time=2025-07-24T18:29:34.657+09:00 level=INFO source=ggml.go:666 msg="compute graph" backend=ROCm0 buffer_type=ROCm0 size="1.1 GiB"
time=2025-07-24T18:29:34.657+09:00 level=INFO source=ggml.go:666 msg="compute graph" backend=CPU buffer_type=CPU size="0 B"
time=2025-07-24T18:29:35.056+09:00 level=INFO source=ggml.go:666 msg="compute graph" backend=ROCm0 buffer_type=ROCm0 size="1.1 GiB"
time=2025-07-24T18:29:35.056+09:00 level=INFO source=ggml.go:666 msg="compute graph" backend=CPU buffer_type=CPU size="10.5 MiB"
time=2025-07-24T18:29:42.580+09:00 level=INFO source=server.go:637 msg="llama runner started in 35.06 seconds"
[GIN] 2025/07/24 - 18:29:42 | 200 |   36.0816407s |       127.0.0.1 | POST     "/api/generate"
ggml_cuda_compute_forward: SCALE failed
ROCm error: invalid device function
  current device: 0, in function ggml_cuda_compute_forward at C:/a/ollama/ollama/ml/backend/ggml/ggml/src/ggml-cuda/ggml-cuda.cu:2366
  err
C:/a/ollama/ollama/ml/backend/ggml/ggml/src/ggml-cuda/ggml-cuda.cu:76: ROCm error
time=2025-07-24T18:30:30.045+09:00 level=ERROR source=server.go:807 msg="post predict" error="Post \"http://127.0.0.1:49262/completion\": read tcp 127.0.0.1:49264->127.0.0.1:49262: wsarecv: An existing connection was forcibly closed by the remote host."
[GIN] 2025/07/24 - 18:30:30 | 200 |    524.4162ms |       127.0.0.1 | POST     "/api/chat"
time=2025-07-24T18:30:30.079+09:00 level=ERROR source=server.go:464 msg="llama runner terminated" error="exit status 0xc0000409"

```

- 一旦、インストーラで上書きして動くようにした。

```
$ ollama run gemma3:1b
>>> AIの未来を予測してください。（100字）
AIの未来は、**最適化された協調**で大きく変化するでしょう。複雑な問題を解決し、**創造性を拡張**することで、医療、科学、芸術など、あ     
らゆる分野に革命をもたらす。しかし、**倫理的な課題**と**雇用の変化**も同時に進み、人間の価値観との整合性を追求する必要があります。

>>> /bye
```