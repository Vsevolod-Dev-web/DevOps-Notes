systemd-timesyncd - это встроенная [systemd](SystemD) служба выполняющая функцию SNTP (Simple [NTP](NTP)), то есть просто синхронизирует время на машине.

При этом этот sNTP клиент - не может раздавать время другим машинам.

```shell
# Статус синхронизации
timedatectl status

# Детальный статус демона
timedatectl timesync-status

# Включить/выключить NTP-синхронизацию вообще
timedatectl set-ntp true|false

# Управление сервисом напрямую
systemctl status systemd-timesyncd
systemctl restart systemd-timesyncd
```

