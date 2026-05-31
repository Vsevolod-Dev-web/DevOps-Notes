***Ad-hoc*** - это вызов бинарника Ansible, вида:
```bash
ansible <host_group> -i inventory/inv.ini -m <module.call> -a <"options">
```

Структура:
- `<host_group> `- конкретный хост или группа.
- `-i inventory/inv.ini` - [inventory](Inventory) файл.
- `-m <module.call>` - модуль. С полным названием [FQCN](Модуль)
- `-a <"options">` - параметры. Множество параметров записывается через пробел, следующим образом `name=GREP source=none`

Это просто одноразовый вызов модуля к группе хостов. Самый простой пример, когда такое нужно - просто пингануть таргеты:

```bash
sudo -u ansible ansible sql-srv -i inventory/servers/sql.yml -m ansible.buildin.ping
```
