# Gemma3
## Function calling
### 結論

結論としては、お手本どおりにやれば、動くには動きそうだが、
今どきの LLM の tools calling で、どうすれば MCP が正しく選択されるか？
の実験用には、調整するパラメータ（システムプロンプトがダメなのか？）を減らしたいので、
別のもの（phi4-mini:3.8b）にする。


### 情報
1. https://ai.google.dev/gemma/docs/capabilities/function-calling?hl=ja
2. https://www.reddit.com/r/LocalLLaMA/comments/1jauy8d/giving_native_tool_calling_to_gemma_3_or_really/
3. https://qiita.com/Stellarium/items/406a56c78a90c792090b
4. https://www.philschmid.de/gemma-function-calling

3.は2.の完コピなので、2.から。

### Gemma 3 (または実際にはどのモデルでも) に「ネイティブ」ツール呼び出しを提供する
Gemma 3は指示に従うのが得意ですが、「ネイティブ」なツールや関数の呼び出し機能がありません。
これを（少なくともできる限り）変更しましょう。

(注記: ここでは Ollama を例として使用しますが、これは Jinja テンプレートでも同様に機能します。
構文を少し変更するだけです。)

#### ツールの定義
まず、Ollamaにおける「ネイティブ」関数呼び出しがどのように動作するかを理解しましょう。
qwen2.5のチャットテンプレートは次のとおりです。

```
{{- if or .System .Tools }}<|im_start|>system
{{- if .System }}
{{ .System }}
{{- end }}
{{- if .Tools }}
# Tools
You may call one or more functions to assist with the user query.
You are provided with function signatures within <tools></tools> XML tags:
<tools>

{{- range .Tools }}
{"type": "function", "function": {{ .Function }}}
{{- end }}
</tools>

For each function call, return a json object with function name and arguments within <tool_call></tool_call> XML tags:
<tool_call>
{"name": <function-name>, "arguments": <args-json-object>}
</tool_call>
{{- end }}<|im_end|>
```

これがよくある自作ツールのシステムプロンプト呼び出しの後半部分みたいだと思ったら、その通りです。
**これは文字通り、利用可能なツールとその呼び出し方法に関するマークダウン形式の指示をシステムプロンプトの末尾に追加しているだけです。**

すでに、Ollama は OpenAI 補完リクエストの一部で指定したツールを認識し tools、システム プロンプトに挿入します。

#### 解析ツール
少し下にスクロールして、ツール呼び出しメッセージがどのように処理されるかを見てみましょう。

```
{{ else if eq .Role "assistant" }}<|im_start|>assistant
{{ if .Content }}{{ .Content }}
{{- else if .ToolCalls }}<tool_call>
{{ range .ToolCalls }}{"name": "{{ .Function.Name }}", "arguments": {{ .Function.Arguments }}}
{{ end }}</tool_call>
{{- end }}{{ if not $last }}<|im_end|>
```

これは**ツール呼び出しパーサー**です。
モデルが出力する最初のトークン（またはいくつかのトークン）が の場合<tool_call>、Ollama はツール呼び出しの解析を処理します。
モデルが指示に適切に従えると仮定すると、ツール呼び出しは実際に tool_calls は ではなく というフィールド contentに入力されます。

#### デモンストレーション

ということで、ちょっとしたお遊びとして、Gemma 3 でツールを正しく呼び出せるかどうか試してみましょう。
qwen2.5 のチャットテンプレートと同じコンセプトを Gemma 3 のチャットテンプレートに応用しました。
そのテンプレートを紹介する前に、実際に動作することを確認しておきましょう。

```py
import ollama
def add_two_numbers(a: int, b: int) -> int:
    """
    Add two numbers
    Args:
        a: The first integer number
        b: The second integer number
    Returns:
        int: The sum of the two numbers
    """
    return a + b

response = ollama.chat(
    'gemma3-tools',
    messages=[{'role': 'user', 'content': 'What is 10 + 10?'}],
    tools=[add_two_numbers],
)
print(response)

# model='gemma3-tools' created_at='2025-03-14T02:47:29.234101Z' 
# done=True done_reason='stop' total_duration=19211740040 
# load_duration=8867467023 prompt_eval_count=79 
# prompt_eval_duration=6591000000 eval_count=35 
# eval_duration=3736000000 
# message=Message(role='assistant', content='', images=None, 
# tool_calls=[ToolCall(function=Function(name='add_two_numbers', 
# arguments={'a': 10, 'b': 10}))])
```

やったー！Gemma 3 によるネイティブ関数呼び出し。

文法を厳密に適用していないため、万能というわけではありません。
しかし、モデルが指示に従うと仮定すれば、ほとんどの場合は動作するはずです。

---

使用したテンプレートはこちらです。
構造とロジックはqwen2.5によく似ていますが、Gemma 3のタグを使用しています。
ぜひ試してみてください。
ツールを使いたい他のモデルにもこのパターンを適用できると、さらに良いでしょう。

```
TEMPLATE """{{- if .Messages }}
{{- if or .System .Tools }}<start_of_turn>user
{{- if .System}}
{{ .System }}
{{- end }}
{{- if .Tools }}
# Tools
You may call one or more functions to assist with the user query.
You are provided with function signatures within <tools></tools> XML tags:
<tools>

{{- range $.Tools }}
{"type": "function", "function": {{ .Function }}}
{{- end }}
</tools>

For each function call, return a json object with function name and arguments within <tool_call></tool_call> XML tags:
<tool_call>
{"name": <function-name>, "arguments": <args-json-object>}
</tool_call>
{{- end }}<end_of_turn>
{{ end }}
{{- range $i, $_ := .Messages }}
{{- $last := eq (len (slice $.Messages $i)) 1 -}}
{{- if eq .Role "user" }}<start_of_turn>user
{{ .Content }}<end_of_turn>
{{ else if eq .Role "assistant" }}<start_of_turn>model
{{ if .Content }}{{ .Content }}
{{- else if .ToolCalls }}<tool_call>
{{ range .ToolCalls }}{"name": "{{ .Function.Name }}", "arguments": {{ .Function.Arguments}}}
{{ end }}</tool_call>
{{- end }}{{ if not $last }}<end_of_turn>
{{ end }}
{{- else if eq .Role "tool" }}<start_of_turn>user
<tool_response>
{{ .Content }}
</tool_response><end_of_turn>
{{ end }}
{{- if and (ne .Role "assistant") $last }}<start_of_turn>model
{{ end }}
{{- end }}
{{- else }}
{{- if .System }}<start_of_turn>user
{{ .System }}<end_of_turn>
{{ end }}{{ if .Prompt }}<start_of_turn>user
{{ .Prompt }}<end_of_turn>
{{ end }}<start_of_turn>model
{{ end }}{{ .Response }}{{ if .Response }}<end_of_turn>{{ end }}"""
```