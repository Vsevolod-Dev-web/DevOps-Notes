[dpkg](Пакетные%20менеджеры) - пакетный менеджер. Есть утилита `dpkg-deb` которая позволяет:
- Упаковать
- Распаковать
- И просматривать содержимое файлов с расширением .deb 
в дистрибутивах Debian

Какие зависимости требует пакет для установки:
```shell
dpkg-deb -f ansible-module-astra-update_*.deb Depends

ansible
```

Смотреть .deb как директорию:
```shell
dpkg-deb -c ansible-module-astra-update_*.deb

drwxr-xr-x root/root         0 2025-12-01 14:30 ./
drwxr-xr-x root/root         0 2025-12-01 14:30 ./usr/
drwxr-xr-x root/root         0 2025-12-01 14:30 ./usr/share/
drwxr-xr-x root/root         0 2025-12-01 14:30 ./usr/share/ansible/
drwxr-xr-x root/root         0 2025-12-01 14:30 ./usr/share/ansible/plugins/
drwxr-xr-x root/root         0 2025-12-01 14:30 ./usr/share/ansible/plugins/module_utils/
-rw-r--r-- root/root      1429 2025-12-01 14:30 ./usr/share/ansible/plugins/module_utils/utils.py
drwxr-xr-x root/root         0 2025-12-01 14:30 ./usr/share/ansible/plugins/modules/
drwxr-xr-x root/root         0 2025-12-01 14:30 ./usr/share/ansible/plugins/modules/astra_update/
drwxr-xr-x root/root         0 2025-12-01 14:30 ./usr/share/ansible/plugins/modules/astra_update/library/
-rw-r--r-- root/root         0 2025-12-01 14:30 ./usr/share/ansible/plugins/modules/astra_update/library/__init__.py
-rw-r--r-- root/root     23271 2025-12-01 14:30 ./usr/share/ansible/plugins/modules/astra_update/library/astra_update.py
drwxr-xr-x root/root         0 2025-12-01 14:30 ./usr/share/doc/
drwxr-xr-x root/root         0 2025-12-01 14:30 ./usr/share/doc/ansible-module-astra-update/
-rw-r--r-- root/root       181 2025-12-01 14:30 ./usr/share/doc/ansible-module-astra-update/changelog.gz
```

"Распаковать" в директорию:
```shell
dpkg-deb -x /ansible-module-astra-update*.deb /file/dir
```

