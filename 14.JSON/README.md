HaskellのJSONライブラリAesonで
Haskellのレコード等々をJSON化してみた。

`toJSON :: a -> Value`
を使えば、StringやIntegerなどからJSONのプリミティブはすぐ作れる。
配列も、toJSONで変換できる。
（ちなみにHaskellのタプルはJSONの配列扱いになる）

JSONオブジェクトになると、多少複雑。
toJSONに`Text`をキーとした`Map`を与えると作れる。
ただ、toJSON関数を使うより、
`object ["key" .= "value"]`
のようにしたほうが短く直感的に書けると思う。

自分でレコード型を定義した場合、
まず`Generic`クラスのインスタンスを自動導出させる。
さらに
> instance FromJSON Pair  
> instance ToJSON Pair

とすればJSONと相互変換できるようになる。
レコードの属性名がJSONオブジェクトの各キーで、
レコードの値はそのままオブジェクトの各値になる。
すごく普通の挙動。  
万一この挙動が嫌であれば、ToJSON、FromJSONのインスタンスを自力実装すればいい。

説明はちょっと回りくどくなっているが、
使う側のコードは短いので、難しくないと思う。

## Reference
- [AesonのHackageドキュメント](https://hackage.haskell.org/package/aeson-1.0.2.1/docs/Data-Aeson.html)
