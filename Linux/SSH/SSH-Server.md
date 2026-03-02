**SSH-server** (демон sshd) - это программный компонетнт работающий на удалённой машине, принимающий зашифрованные соединения от [SSH-client](SSH-Client).

Установка и запуск SSH-serever
```bash
sudo apt install openssh-server -y

sudo systemctl status ssh # if ssh is disabled, enable it

sudo systemsctl enable --now ssh
```