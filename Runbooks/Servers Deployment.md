"radius". *srvnode5*.

OS: ubuntu 24.04
Ansible: linux-server-base

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

for more sequrity, should use [AppArmor](SELinux)

can use Nginx to up web.

should use NTP to sinchronyse

1. Изначально был создан тестовый юзер для проверки работы radius без LDAP и UG:
	- changed: `/etc/freeradius/3.0/mods-config/files/authorize` - `testuser Cleartext-Password := "testpass"`


![[Pasted image 20261026164308.png]]

После открытия `freeradius -X` - в режиме отладки, в другой сессии был отправлен запрос, со следующим вызовом:

![[Pasted image 20261026164423.png]]

ETC

Для подключения RADIUS к UserGate, со стороны Radius был создан модуль-клиент для UG с его IP адресом и "секретом"

Секрет - пароль который используют UG и Rad. для аутентификации друг друга