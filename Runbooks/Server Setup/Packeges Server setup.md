```shell
vsevolod@sevabraza:/home$ dpkg -l git curl wget htop nano ufw build-essential | grep ^ii
ii  build-essential 12.10ubuntu1        amd64        Informational list of build essential packages
ii  curl            8.5.0-2ubuntu10.9   amd64        command line tool for transferring data with URL syntax
ii  git             1:2.43.0-1ubuntu7.3 amd64        fast, scalable, distributed revision control system
ii  htop            3.3.0-4build1       amd64        interactive processes viewer
ii  nano            7.2-2ubuntu0.1      amd64        small, friendly text editor inspired by Pico
ii  ufw             0.36.2-6            all          program for managing a Netfilter firewall
ii  wget            1.21.4-1ubuntu4.1   amd64        retrieves files from the web
```

Это минимальная база на сервер, со службой, с моим стеком CoinView.

Packages listed next is can be called "basic", not just for my stack.
Installed Packages:
- node v20.20.2
- npm v10.8.2
- Python 3.12.3
- GNU Wget 1.21.4 built on linux-gnu.
- curl 8.5.0 
- ufw 0.36.2
- **build-essential**
- htop
- nano

