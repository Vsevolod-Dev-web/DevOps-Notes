### Определение

**Unit-файл** - это файл конфигурации, откуда systemd берёт что ему загружать при запуске системы в user-space. 

**Systemd** очень модульный. Вот основные типы unit-файлов:
- `.service` - запуск сервисов (nginx, postgresql, личный софт);
- `.mount` - монтирование дисков при запуске;
- `.timer` - запуск по времени (по расписанию);
- `.socket` - управление сетевыми сокетами;
- `.target` - группировка unit'ов (что-то вроде поэтапной загрузки);

## Структура и написание Unit Файла

Unit-file имеет следующую структуру:

```bash
[Unit]
# Описание и зависимости
Description= #Описание сервиса
After=       # Цепочка зависимостей. Что необходимо запустить перед сервисом.
Wants=       # Что необходимо

[Service]
User=... # Указать под каким пользователем запустить сервис
# Тут указывается путь к файлу сервиса, тип сервиса
ExecStartPre=... nginx -t             # Выполнить перед запуском (проверки,                                              подготовка)
ExecStart=/usr/local/bin/hello.sh     # Запустить сам сервис
ExecReload=...                        # Что сделать при перезагрузки конфига                                             (systemctl reload)
WorkingDirectory=... # Рабочая директория сервиса

Type=simple # по умолчанию, долгоживущий процесс 
Type=forking # процесс уходит в фон (как nginx) 
Type=oneshot # выполнился и завершился (как наш скрипт)

[Install]
# Указывается куда создавать симлинк ели включить автозапуск
WantedBy=multi-user.target # Возможность enable\disable(см. systemctl) автозапуск
```

*Стоит понимать, что такое WantedBy. Фактически, это директива которая говорит "запускать этот сервис вместе группой unit-файлов mulit-user.target"* 
### Пример простого Unit-файла

```bash
[Unit]
Description=My first unit file

[Service]
ExecStart=/usr/local/bin/hello.sh
Type=oneshot

[Install]
WantedBy=multi-user.target
```

Для следующего скрипта (hello.sh):
```bash
echo "Service is Up" >> hello.log
```

*** Мощный пробел тут по systemctl