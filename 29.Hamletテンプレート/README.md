HaskellのHTML用テンプレートエンジンHamletを使ってみる。  
手始めにループとif。

タグをインデントしつつ、変数を埋め込んでいく感じは
普通にJadeなどに近い。
埋め込む変数は明示的に渡さず、letでスコープに入れておけばいい。  
短いコードなのに、Template Haskellを使ったりして、微妙に高度。
型関係のエラーでたまに怒られるが、原因調査は結構難しい…。

実行にはstackを使った。
> stack build  
> stack exec hamlet-test

## Reference
- [Yesod公式の解説](http://www.yesodweb.com/book/shakespearean-templates)
