Haskellからローカルのsyslogにログを送ってみる。

ログを出す方法は無数にあるが、RPiでは何かと制約が多い。
そこで今回、**古典的で軽量で確実**な方法ということで、syslogを試してみた。  
今回、ログへは単に標準入力をそのまま流す。
テキストファイルでも、キーボード入力でも、何か適当に流し込めば良い。

syslogは意外とあなどれない。
こちらのアプリが、ローカルにsyslogを送っておけば、
あとはsyslogデーモンが適宜リモートへ転送してもらうようにもできる。
Haskell側でがんばらなくていい。

リモート転送の設定は、Debian系なら
`/etc/rsyslog.d/50-default.conf`あたりで、
> user.* @@some-remote-server.net

と書けば簡単。  
これを受ける別のsyslog側も`/etc/rsyslog.conf`とかの

    # provides UDP syslog reception
    #$ModLoad imudp
    #$UDPServerRun 514

    # provides TCP syslog reception
    #$ModLoad imtcp
    #$InputTCPServerRun 514
あたりのコメントを外すと、
外部からのログをリッスンしてくれる。

なお、`logger`コマンド自体もあなどれない。
`logger`コマンドは標準入力を受け取れるので、
アプリ側の標準出力を、単にパイプでsyslogに送れる。
つまり、今のアプリでやったことくらいなら、
実はhsyslogパッケージは不要…

## References
- [loggerコマンド](http://man7.org/linux/man-pages/man1/logger.1.html)
- [Haskellのhsyslogパッケージ](http://hackage.haskell.org/package/hsyslog-4/docs/System-Posix-Syslog.html#g:3)