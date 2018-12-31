HaskellからSQLiteにアクセスするのに、旧式のHDBCを使ってみる。  
普通のPCならPersistentを使えばいいが、
RPiだと、Persistentのビルドはかなり苦しい。
結局、Persistentを諦めて、古いライブラリを引っ張り出すことにした。

SQL文がかなり表に出ている。  
SQL文の中身を見ないと、
`INSERT`なのか`SELECT`なのかもわからない。  
`?`のところを実際の値で置換していくという、
他の言語でよくあるパターン。  
埋め込む際、Haskellの各種の値は、
`toSql`という関数で汎用的な`SqlValue`型に適当に変換しないといけない。
型安全なし。  
`connectSqlite3`して取得したコネクションを
`run`に毎回渡すなど、
全体的にHaskellぽさがない。

## References
- [HDBC](https://hackage.haskell.org/package/HDBC-2.4.0.1/docs/Database-HDBC.html)
- [SQLiteのHDBC](https://hackage.haskell.org/package/HDBC-sqlite3-2.3.3.1/docs/Database-HDBC-Sqlite3.html)
