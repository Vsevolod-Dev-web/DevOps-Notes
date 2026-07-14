Ansible Роль.

Главная задача - раскатка всего самого необходимого на сервере.

Таргеты: Linux (Debian/RedHat?) сервера, полностью голые.

Что необходимо сделать:

1. Facts gathering 

#### Tools
1. htop
	1. iotp - диагностика активности ввода\вывода
	2. lsof
2. ca-certificates and my cert-delivery role
3. curl
4. wget
5. fail2ban
6. ufw
7. dig -- nslookup
8. tmux???

#### RHEL and Debian dichotomy
Ветвление логики по семейству дистро через игру с названием файлов. Разбиение логики для каждого симейства на отдельные варсы\таски. Инклуд тасок > название файла - <<os_family>>.yml

##### Hardening and Security
1. SSH conf
	1. ssh conf. Auth, key, password lines
	2. handler чтобы соединение не упало после изменения конфига

2. Net security (ufw)
	1. rhel n debian dichotomy
	2. минимально, какие правила должны ставиться на base-слой сервера?

##### Users and prevaliges
1. Таска на итеративное создание admin-юзеров из переменных роли.


## 
1. ssh (под паролем не отключаем у нас в инфре)
2. users
	1. groups
3. utilitys
4. net secryrity
5. sudoers conf