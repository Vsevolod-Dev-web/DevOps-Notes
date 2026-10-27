"radius". *srvnode5*.

OS: ubuntu 24.04
Ansible: linux-server-base
`radiusd: FreeRADIUS Version 3.2.5, for host x86_64-pc-linux-gnu, built on Mar 28 2025 at 17:03:23`

root: login closed
vsevolod: admin user

installed packages:
`freeradius`
`freeradius-utils`
`freeradius-ldap`

added ufw rules:
```shell
ufw enable allow 22
ufw default deny incoming
ufw default allow outgoing
```

AppArmor настроен небыл.

can use Nginx to up web.

should use NTP to sinchronyse

1. Изначально был создан тестовый юзер для проверки работы radius без LDAP и UG:
	- changed: `/etc/freeradius/3.0/mods-config/files/authorize` - `testuser Cleartext-Password := "testpass"`


После открытия `freeradius -X` - в режиме отладки, в другой сессии был отправлен запрос, со следующим вызовом:


ETC

Для подключения RADIUS к UserGate, со стороны Radius был создан модуль-клиент для UG с его IP адресом и "секретом"

Секрет - пароль который используют UG и Rad. для аутентификации друг друга


# NGINX amd PHP backend
`nginx version: nginx/1.24.0 (Ubuntu)`

installed PHP packages: `php-fpm php-mysql php-mbstring php-xml php-curl php-zip php-pear php-db php-mail php-mail-mime`

Пакет `php` не был установлен. Это мета-пакет который в Ubuntu потянет зависимый пакет из которого поставится Apache и займёт 80 порт.
# MariaDB
`mariadb -v: 10.11.14-MariaDB-0ubuntu0.24.04.1 Ubuntu 24.04`

Создана БД: 'radius'
Схема БД была взята из директории radius `mysql -u root radius < /etc/freeradius/3.0/mods-config/sql/main/mysql/schema.sql `
создан user: 'radius' с разрешением только с localhost

Было добавлено поле `'testuser', 'Cleartext-Password', ':=', 'testpass'`

TLS проверка от radius до базы - отключена и не настроена. В принципе я думаю это не страшно, т.к. работа происходит на localhost.

