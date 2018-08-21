Cのコードを、FFIよりも読みやすい形で使えるようにしてみる。  
inline-cパッケージのQuasiQuotesを使う。
FFIはどうも手間が多くて、遠回り感があるので。

QuasiQuotesの`pure`は見ての通り、純粋関数に使う。  
`exp`は単一の式で、値を返せる。IOモナド。  
`block`は複数行のブロックで、returnで明示すれば値を返せる。
要はCの関数で、やはりIO扱い。

実行するには、普通にstackでbuildしてexecすればいい。
（以前はもう少し手間があったが、18年8月現在、改善されていた）

なお、Cが使えるので、
Raspberry Piで低レベルハードウェアを扱うのに良いかなと思ったが、
Template Haskellがうまく動いてくれず、これもダメだった。  
う～ん。

一応、RやC++など他の言語についても、
QuasiQuotesで使えるようにするパッケージがあるらしい。

## References
- [Stackageのドキュメント](https://www.stackage.org/haddock/lts-8.13/inline-c-0.5.6.1/Language-C-Inline.html)
- [開発元からの解説](https://www.fpcomplete.com/blog/2015/05/inline-c)
