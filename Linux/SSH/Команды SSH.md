```bash
# Генерация ключей
ssh-keygen -t ed25519 -c "vsevolod@work"
# Создаст: ~/.ssh/id_ed25519 (приватный) и ~/.ssh/id_ed25519.pub (публичный)

# Скопировать публичный ключ на сервер
ssh-copy-id user@server_ip
# Это автоматически добавит ключ в ~/.ssh/authorized_keys на сервере

# Подключиться
ssh user@server_ip
```

