Haskellのhmatrixで、行列やベクトルの計算をしてみる。  
ベクトルはともかく、行列は答えがパット見てわからないが…

hmatrixは、一通りの行列計算をカバーしているらしい
（あまりマニアックなのはないかもしれないが、
自分はそれが気になるレベルではないので）。  
Fortranの数値計算ライブラリBLASとLAPACKを
呼び出して使っているので、かなり速い。
Haskellで長いリストの計算が遅いことはたまに気になるが、
多分これなら大丈夫。

Haskellだと演算子が簡単に定義できるのと、
型クラスのおかげで型の違うものも自然に計算できて、
コードがかなりすっきりする。
たとえば、MatlabやNumpyなどのように、普通の`+`演算子で
ベクトルどうしや、スカラと行列を足し算できる。
ベクトルについて、`dot`で内積や`cross`で外積を計算するのも簡単。

なお、どんな行列ライブラリでも、計算誤差はいくらか出る。
ちゃんとしたソルバを使うときれいに計算されたりと、
注意点やノウハウがあったりする。

## References
- [hmatrixのHaddock](https://www.stackage.org/haddock/lts-7.7/hmatrix-0.17.0.2/Numeric-LinearAlgebra.html)
- [hmatrix作者によるチュートリアル](http://dis.um.es/~alberto/hmatrix/hmatrixtut.html)
