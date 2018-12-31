Raspberry Pi 3上で、
WiringPiというCライブラリを使って、HaskellからLチカ。

Cを呼び出すには、FFI(Foreign Function Interface)を使っている。
RPiだと、ライブラリの制限がかなり厳しいので、
簡単なケースでは、直接FFIで呼ぶのもアリ。  
`foreign import ccall "digitalWrite" c_digitalWrite :: CInt -> CInt -> IO ()`  
のように使う。
`c_`の接頭辞はただ区別しやすくするためにやっているだけで、付けなくても動く。

あと、Haskellでは、CPPの言語拡張を有効にすることで、
C風に`#include`や`#define`ができたりする。
ただし、FFIもCPP拡張も、Haskell本来の機能と
相性が良いとは思えないので、使うのは最小限にしたほうがよさそう。

WiringPiは、RasPiのGPIOにアクセスするためのライブラリ。
Arduinoのwiringに近い使用感になるよう設計されているらしい。
最近のRaspbianでは最初から入っていた。  
`/usr/lib/libwiringPi.so` とか入っていたが、
そのままだとstackが見つけてくれないので、
`extra-libraries`に明示的に追加している。

## References
- [関数レファレンス](https://projects.drogon.net/raspberry-pi/wiringpi/functions/)
- [FFIなどC連携についての日本語記事](https://qiita.com/masatoko/items/06665400b2ef10a7e2b0)