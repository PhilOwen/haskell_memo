HaskellのテストフレームワークHspecを使ってみる。  
フィボナッチ数をナイーブに実装してみて、
それが狙った挙動になっているかテストしてみた。

> stack test

で実行できる。

HspecはRubyのRspecのHaskell版。
`describe`や`it`を使ってテストを構造化する。
より深くネストしたい場合は、`context`も使える。  
テスト前後の処理には、`before`や`after`が使える。  
`shouldBe`や`shouldContain`、`shouldThrow`など、
関数名がそのまんまでわかりやすい。  
シンプルだが、今言った関数だけでかなりのケースはカバーできるはず。

## References
- [Hspecの公式マニュアル](http://hspec.github.io/)
- [should系のHackage](https://hackage.haskell.org/package/hspec-expectations-0.8.2/docs/Test-Hspec-Expectations.html)
