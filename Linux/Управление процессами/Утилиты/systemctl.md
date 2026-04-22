### systemctl
**systemctl** - утилита для управления [systemd](SystemD) и сервисами.

### Статусы сервиса
- У каждого сервиса есть два независимых статуса: **Active/Inactive** — запущен ли сервис прямо сейчас 
- **Enabled/Disabled** — запускается ли сервис автоматически при загрузке системы Enabled/Disabled реализован через [символические ссылки](Symlink.md):
	- enable = создать симлинк на [unit-файл ](unit-файл)в /etc/systemd/system/multi-user.target.wants/
	- disable = удалить этот симлинк

### Основные команды 

```bash
systemctl status <сервис> # посмотреть статус 
systemctl start <сервис> # запустить systemctl 
stop <сервис> # остановить systemctl 
restart <сервис> # перезапустить systemctl 
enable <сервис> # добавить в автозапуск systemctl 
disable <сервис> # убрать из автозапуска
sudo systemctl daemon-reload # systemd перечитал все unit-файлы с диска
```

