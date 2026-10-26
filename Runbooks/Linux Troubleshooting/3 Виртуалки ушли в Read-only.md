Обнаружение: Алерт в Zabbix: no connection to zabbix agent (3m) на gitlab

Посмотрел через VNC в вебе VMManager - пишет что ФС в read-only.
Пробую по SSH цепанутся - не даёт.

Смотрю другие виртуалки на той же ноде.
Такая же ситуация на 3. Всего на ноде 4 виртуалки. Четвёртая - ОК
А нет. VNC показывает окно логина, но не реагирует. SSH тоже не идёт

Заходим на ноду. Смотрим Smartctl что с диском

ввёл `smartctl -a /dev/sdc`
вывело:
```shell
administrator@srnode03:~$ sudo smartctl -a -d nvme /dev/sdc
smartctl 7.2 2020-12-30 r5155 [x86_64-linux-5.15.0-70-generic] (local build)
Copyright (C) 2002-20, Bruce Allen, Christian Franke, www.smartmontools.org

Smartctl open device: /dev/sdc failed: No such device or address
```
`-a `
`sdc` - диск с LVM

```shell
administrator@srnode03:~$ sudo dmesg -t | grep -iE 'sdc|ata|reset|offline|detach|timeout' | head -40
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 6144 op 0x1:(WRITE) flags 0x100000 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 6477152 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
blk_update_request: I/O error, dev sdc, sector 251730544 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0

```

```shell
administrator@srnode03:~$ cat /sys/block/sdc/device/state
offline
```

В итоге выясняется, что ядро диск отключило и забыло
На серваке собран аппаратный рейд, RAID 5. Рейд-контроллре от HP.
Подходящая утилита для мониторинга этого рейд контроллера: 

`curl -fsSLO [https://downloads.linux.hpe.com/SDR/repo/mcp/pool/non-free/](https://downloads.linux.hpe.com/SDR/repo/mcp/pool/non-free/)hpssacli-2.40-13.0_amd64.deb`

# Диагностика
```
gitlab/glpi не открываются
ВМ: input/output error, не цепляется SSH
LVM на sdc (LVM раздел под виртуакли) недоступен, но виден в lsblk
sdc: state = offline (# cat /sys/block/sdc/device/state)
P410: Controller Status Not OK
```
