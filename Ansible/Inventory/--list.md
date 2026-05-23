Опция `--list` выводит твой `.ini` [inventory](Inventory) конвертированный в JSON. Помогает видеть как ansible распарсил твой inventory. Пример: 

Имеем следующий inventory-файл: 
```ini
[windows]
bughalter1  ansible_host=192.168.5.2
bughalter2  ansible_host=192.168.5.3
bughalter3  ansible_host=192.168.5.3
glavBughalter ansible_host=192.168.5.5

[1cusers]
glavBughalter ansible_host=192.168.5.5

[windows:vars]
ansible_host=ansible
ansible_password=StrongPasswd233
ansible_connection=winrm
ansible_port=5986
ansible_winrm_scheme=https
ansible_winrm_transport=basic
ansible_winrm_server_cert_validation=ignore

```

Запускаем:
```bash
ansible-inventory -i inventory/winHost.ini --list
```

Вывод: 
```json
{
    "1cusers": {
        "hosts": [
            "glavBughalter"
        ]
    },
    "_meta": {
        "hostvars": {
            "bughalter1": {
                "ansible_connection": "winrm",
                "ansible_host": "192.168.5.2",
                "ansible_password": "StrongPasswd233",
                "ansible_port": 5986,
                "ansible_winrm_scheme": "https",
                "ansible_winrm_server_cert_validation": "ignore",
                "ansible_winrm_transport": "basic"
            },
            "bughalter2": {
                "ansible_connection": "winrm",
                "ansible_host": "192.168.5.3",
                "ansible_password": "StrongPasswd233",
                "ansible_port": 5986,
                "ansible_winrm_scheme": "https",
                "ansible_winrm_server_cert_validation": "ignore",
                "ansible_winrm_transport": "basic"
            },
            "bughalter3": {
                "ansible_connection": "winrm",
                "ansible_host": "192.168.5.3",
                "ansible_password": "StrongPasswd233",
                "ansible_port": 5986,
                "ansible_winrm_scheme": "https",
                "ansible_winrm_server_cert_validation": "ignore",
                "ansible_winrm_transport": "basic"
            },
            "glavBughalter": {
                "ansible_connection": "winrm",
                "ansible_host": "192.168.5.5",
                "ansible_password": "StrongPasswd233",
                "ansible_port": 5986,
                "ansible_winrm_scheme": "https",
                "ansible_winrm_server_cert_validation": "ignore",
                "ansible_winrm_transport": "basic"
            }
        },
        "profile": "inventory_legacy"
    },
    "all": {
        "children": [
            "ungrouped",
            "windows",
            "1cusers"
        ]
    },
    "windows": {
        "hosts": [
            "bughalter1",
            "bughalter2",
            "bughalter3",
            "glavBughalter"
        ]
    }
}

```

Структура вывода всегда такая:

- **`_meta.hostvars`** — все хосты и их переменные, разрешённые до конкретных значений. Тут ты видишь финальную картину: какие именно переменные применятся к каждому хосту.
- **`all`** — корневая группа, в которую входят úвсе хосты всегда. Внутри `children` — дочерние группы.
- **`ungrouped`** — служебная группа для хостов без группы.
- Дальше идут твои группы (`windows`, `1cusers`) со списком хостов.