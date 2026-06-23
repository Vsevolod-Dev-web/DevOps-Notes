Zabbix выдаёт `Linux: high memory utilization`. Смотрим вывод top.

Видим free - очень низкий. [Buffer cache](Buff-cache%20n%20availMem.md) - забит. Available - очень низкий.

Из данных собранных в top видно, что помимо почти полностью заполненной памяти, у нас полный buffer cache который занят чем-то, что освободить не возможно. Вспоминаем, что основная причина подъёма OOM killer'a - нулевое значение available.

Было исправлено добавлением ресурса на ноду.

Причины могут быть разные (гугли):

1. [Dirty pages](Dirty%20pages) 
2. Slab / Kernel Memory with owncloud
3. Процессы PHP-FPM (owncloud), MariaDB/PostgreSQL, Redis, Apache/Nginx наплодили процессов, которые держат buffer cache который невозможно отпустить.