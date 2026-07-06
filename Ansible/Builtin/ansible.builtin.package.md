Модуль builtin колекции. Позволяет установить пакет без привязки к пакетному менеджеру (имеется ввиду пакетные менеджеры разных os_family).

```yml
- name: Install base tools
  ansible.builtin.package:
    name: "{{ tools_packages }}"
    state: present
```

Стоит понимать, что в разных дистрибутивах названия у пакетов в репозиториях отличаются.

[Подробнее...](https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/package_module.html)

