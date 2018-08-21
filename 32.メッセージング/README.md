メッセージのやり取りを仲介するミドルウェアのRabbitMQを、
Haskellから使ってみる。

Haskellが、消費者（Consumer）かつ生産者（Producer）を
自演する、単純なアプリ。  
メッセージがRabbitMQに届くのに合わせ、こちらのアプリで自動的に消費させるようにするのが`consumeMsgs`。
メッセージをこちらのアプリからRabbitMQに送るのが`publishMsg`。

RabbitMQの統計情報などをブラウザで見れるようにするプラグインもある。
今回RabbitMQは、Docker上で動かしているが、
管理プラグイン付きのDockerイメージはrabbitmq:management。  
RabbitMQの起動コマンドは以下の通り。
> docker run -d --hostname my-rabbit --name some-rabbit -p 5672:5672  -p 15672:15672 rabbitmq:management

5672がメッセージングのポートで、15672が管理用。

RabbitMQ起動後に、こちらのアプリを起動すると、
> sending...  
> Received: 2018-08-21 12:19:04.380254 UTC  
> sending...  
> Received: 2018-08-21 12:19:04.886198 UTC

のようにシェルに出るはず。

自分がアプリエンジニアなせいか、
メッセージングと言われても、応用範囲広すぎ、
インフラ的であまりピンとこない。
が、RabbitMQは、DockerHub上の人気ランキングで30位以内と
かなり高い（ちなみにTomcatは、2018年8月時点で31位）。
ちゃんと使えば、役には立ちそうではある。

## References
- [RabbitMQのDocker](https://hub.docker.com/_/rabbitmq/)
- [Haskellのクライアントライブラリ](http://hackage.haskell.org/package/amqp-0.14.1/docs/Network-AMQP.html)
- [RabbitMQの記事](https://codezine.jp/article/detail/9288)
