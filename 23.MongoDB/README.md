MongoDBにデータを入れてみる。  
PersistentでもMongoは使えるそうだが、
ビルドが重すぎて、RPiなどでは苦しい。
そこで、mongoDBというまんまな名前のパッケージでやってみた。

実行すると、コンソールから入力を待って、
各行をMongoにタイムスタンプ付きで書き込む。
3行読んで、保存したら終わり。

MongoDBでは、データはJSONぽいBSONという形式で扱う。
MongoDBならスキーマを最初から厳密にやらなくても良く、
データ構造をネストするのも楽。  
見たまんまなコードで、ちゃんと動いてくれる。
簡単なので、実験的にやるには便利そう。

環境をちょっと作るのには、やっぱりDockerがラク。  
`docker run -it --rm -p 27017:27017 mongo`  
だけでMongoが使えるようになる。

## Reference
- [mongoDBパッケージのGitHub](https://github.com/mongodb-haskell/mongodb)
