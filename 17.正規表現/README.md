Haskellの正規表現ライブラリのregex-tdfaを使ってみる。

`=~`　と `=~~` 演算子だけで、マッチした個数を返したり、
最初にマッチしたものを返したりと、複数の処理を行う。
Boolを返す場合は、マッチしたかどうかの真偽値が返る等。  
Haskellらしく、返り値の **型** に応じて、処理が変わっている。
直感的とは言いがたいので、正規表現はあんまり使いたくないと思う。
最小限で…

正規表現エンジンの実装はHaskellにいくつかあり、
今回はregex-tdfaを使っている。
このライブラリはTDFAというアルゴリズムを使い、
最適化でも工夫して、計算量がO(N)で収まるなど、
安定して速いらしい。

## References
- [regex-tdfaのHackage](https://hackage.haskell.org/package/regex-tdfa-1.2.2/docs/Text-Regex-TDFA.html)
