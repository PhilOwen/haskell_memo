テンプレートエンジンmustacheのHaskell実装であるstacheを使ってみる。

mustacheは、RubyやJS、Java、.netなど多数の実装がある。
Haskell内でも複数の実装があるが、それっぽいmustacheとmastacheというパッケージは
実はmustacheの仕様を満たしていなかった。
ちょっと探して、stacheというパッケージに行き着いた。

stacheはかなりシンプルな設計になっている。
> compileMustacheFile :: (MonadIO m, MonadThrow m) => FilePath -> m Template  
> compileMustacheText :: PName -> Text -> Either (ParseError Char Dec) Template

でテンプレートを生成する。
関数名とシグニチャを見れば、何をするか大体わかる。

> renderMustache :: Template -> Value -> Text

もそのまま。

mustacheは、logic-lessテンプレートということで、
細かい制御をあえてしない仕様になっている。  
`{{variable-name}}`で変数の値を置換するのが基本。  
`{{# listname}`　…　`{{/ listname}}`で
配列を列挙できる（logic-lessだが、ループはできる）。
列挙される要素自体にアクセスするときは、`{{.}}`を使う。
配列の要素がオブジェクト（Haskellでは`Map`）であるときは、
ループ内で`{{key}}`を書けば、そのキーに対応する値に置換される。

HTMLでない、ちょっとしたテキストを生成するには
簡単で良さそうな感じ。

> stack build  
> stack exec hello-stache

で実行。

## Reference
- [stacheのHackageドキュメント](https://hackage.haskell.org/package/stache-0.1.7/docs/Text-Mustache.html)
- [stacheのチュートリアル](https://www.stackbuilders.com/tutorials/haskell/mustache-templates/)
