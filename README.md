# Haskellメモ
Haskellのライブラリ等についての備忘録

ビルドにはstackを利用。
brewなどでインストールしておくこと。

環境が複雑にならないよう、数字付きの各フォルダは依存関係なし。
独立したプロジェクトを入れてある。  
フォルダを移動して
> stack build  
> stack exec hello-aeson

(hello-aesonは実行可能なアプリの名前。
各`package.yaml`ファイルを見ること)  
または
`stack runghc Main.hs` 
で実行できるものもある。

LTSはなるべく新しいバージョンを使いたいところだが、
RPiだとコンパイラが非対応だったり、単純にメモリが切れたりする。
その場合、古めのLTSを使っていたりする。

これで各プロジェクトで話題にしている機能が実行できるはず。
ただ、プロジェクトによっては、Dockerを使っていたり、
前提準備が必要なものもある。
