### Определение
journalctl - утилита в Linux. Позволяет просматривать логи сервисов (логи [systemd](systemd)).

Логи хранятся в `/var/log/journal/`. journalctl читает [бинарные файлы](Бинарный%20файл) оттуда.
### Основные флаги

```bash
journalctl -u nginx          # логи конкретного сервиса
journalctl -u nginx -f       # в реальном времени, same as tail
journalctl -u nginx -n 20    # последние 20 строк
journalctl -u nginx --since "1 hour ago"  # за последний час
journalctl -p err            # только ошибки по всей системе
```
