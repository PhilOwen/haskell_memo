Haskellにインラインで、Rの構文を埋め込みつつ、
R環境で評価された値をちゃんと受け取ってみる。

inline-rというパッケージを使う。
が、これは2018/12現在、stackageから消えている。
なので`stack.yaml`で参照を追加したり工夫する必要あり。

型の変換がやや面倒。
あと、コード生成をがんばっているせいか、コンパイル時間が結構かかる。
なので、素直にファイルなどを介するほうが実は無難。
または、HというGHCi的なREPL環境もあるらしいので、それでやるとか。

## やったこと
Haskell->Rと値を渡して、R環境に計算させるのは簡単だった。
Haskellの変数に_hsを付けたものが、Rに見える。
Doubleと[Double]はすぐに渡せた。

ただ、R->Haskellと値を返さないようだとあまり面白くない。
なので次に、数値と数値のリストも取り出した。
型がやっかいだが、このコード例をコピペすれば大丈夫だと思う。
「Rをちょっと使う」くらいの用途では、
数値と数値リストを受け渡しできるだけでもかなり便利。

なお、Rでは数値はデフォルトで浮動小数点数。
整数は、明示しないと出てこない。


あと、inline-rとMac OS上のCヘッダが
何か相性が良くないらしい。
stackでDockerを使うことで回避した。

`stack.yaml`内で

    docker:  
        enable: true

とやっておく。
その後、`stack docker pull`しておくこと。
これで、stackの標準Dockerイメージが`pull`され、
それ以降、普通に`stack build`等できるようになる。

なお、このDockerには、R本体をインストールしていなくてもいいらしい。
どういう仕組みだろう…。

## References
- [inline-rでの型キャスト](https://tweag.github.io/HaskellR/docs/casts-and-coercions.html)
- [stackとdocker](https://docs.haskellstack.org/en/stable/docker_integration/)
