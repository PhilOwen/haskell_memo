HaskellからOpenGLを使うのに、GLUTのHaskell版を使ってみる。

OpenGLのようなCの低レベルライブラリを
Haskellでどう扱うのかと思って試してみた。
予想通りと言うべきか、`IORef`で値をよく変更するわ、
関数が副作用のあるものばかりだわと、色々とHaskellらしくない。  
状態を引き回すには、
`IORef`を引数に取るようなコールバック用の関数をまず定義する。
その関数にIORefを部分適用して、
イベントハンドラとして設定すればいい。  
また、図形をマウスに追従するようにしたかったが、
マウスホバーイベントがサポートされないらしく、
仕方なくマウスドラッグに追従するようにした。

慣れないのを差し引いても、ものすごく生産性が悪かった。
Processingは偉大だった。
Processingと比べると、難しいというより、めんどくさいばかりで楽しくない。
**これを直接触ることは二度とない** と思う。

一応、OpenGLをより現代的に、リアクティブにプログラムするための
Reactive-glutというのもあるらしいが、う〜ん。

## Reference
- [Haskell wiki内のOpenGLチュートリアル](https://wiki.haskell.org/OpenGLTutorial1)
