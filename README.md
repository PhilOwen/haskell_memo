# Haskellメモ
Haskellのライブラリ等についての備忘録

ビルドにはstackを利用。
brewなどでインストールしておくこと。

環境が複雑にならないよう、数字付きの各フォルダには
独立したプロジェクトが入っている。  
フォルダを移動して
> stack build  
> stack exec -- hello-aeson

(hello-aesonは実行可能なアプリの名前。
各`cabal`ファイルを見ること)  
または
`stack runghc Main.hs`

で実行。
これで各プロジェクトで話題にしている機能が実行できるはず。
ただ、プロジェクトによっては、Dockerを使っていたり、
前提準備が必要なものもある。
