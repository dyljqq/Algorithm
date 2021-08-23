# LibreSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443

解决上述问题，亲测方案：



更改gitconfig的配置如下:



[http]
        sslBackend = openssl
        proxy = socks5://127.0.0.1:1086



这里的1086是我自己的shadowsocks的sock是端口号，你们需要根据自身情况进行替换。