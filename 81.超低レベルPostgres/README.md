RasPi上で、HaskellからPostgresへデータを入れてみる。

RasPiだと色んなライブラリが使えないが、
Persistentはもちろん、HDBCも使えないらしくてわりと困る。
libpqというかなり低レベルなライブラリがあったので、
それで何とかやってみた。

`?`のプレースホルダすら使わずに
ByteStringのSQL文を組み立てて、それを実行した。
`execPrepared`という便利そうな関数もあったが、
Oidがどうのこうのと、めんどくさそうだったので
原始的に文をそのまま実行する`exec`でやっている。  
やり方が雑だが、まぁ小規模なRasPiだし…

このアプリは、PostgresへのHaskellクライアントとしては残念な感じだが、
RPiはpostgresサーバ自体は普通に動かせる。
Persistentなどをリモートで使って、
RPi上のDBを操作する分には問題なさそう。

## Reference
- [libpqのドキュメント](https://www.stackage.org/haddock/lts-8.9/postgresql-libpq-0.9.3.0/Database-PostgreSQL-LibPQ.html)
