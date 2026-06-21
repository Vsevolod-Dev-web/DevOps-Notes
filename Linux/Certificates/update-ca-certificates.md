update-ca-certificates - это shell-скрипт который:
1. Читает /etc/ca-certificates.conf 
2. Читает `/usr/local/share/ca-certificates
3. Чистит `/etc/ssl/certs/`
4. Создаёт симлинки на все активные серты
5. --
6. Собирает /etc/ca-certificates.crt - склеивает все PAM блоки в одном файле.