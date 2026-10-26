### wget
wget - это утилита для скачивания файла по url. 

`wget https://example.com/file.tar.gz` - установит файл в текущую директорию.

Утилита имеет следующие опции:
- `-O`. Задать имя файла. `wget -O my-file-name.tar.gz <url>`
- `-c`. Докачать если остановилось. `wget -c <url>`
- `-q`. Как во многих других утилитах - это тихий режим. 
- `-P`. Скачать в конкретную директорию.  `wget -P /opt/downloads <url>`

# curl
curl - утилита для отправки HTTP-запросов и получения ответов.

```bash
curl https://api.example.com/users
```

Выведет ответ сервера в терминал.

В итоге посмотрел с утилитой hpssacli (ssacli) - вывеле следующее
```shell
administrator@srnode03:~$ sudo hpssacli ctrl all show detail

Smart Array P410 in Slot 0 (Embedded)
   Bus Interface: PCI
   Slot: 0
   Controller Status: Not OK
   Hardware Revision: Unknown
   Total Cache Size: 0 MB
   SATA NCQ Supported: False
   Number of Ports: 0
   Driver Name: hpsa
   Driver Version: 3.4.20
   Driver Supports HPE SSD Smart Path: True
   PCI Address (Domain:Bus:Device.Function): 0000:86:00.0
   Sanitize Erase Supported: False

```
Видим: контроллер не видит всё что за ним. Что это значит - "рейда нету". Соответсвенно:
- Умерли все диски разом. - Подошёл физически - линк на дисках есть
- Хуёво контроллеру: завис, забился кеш, умер.

