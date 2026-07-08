В директорию ***/role/vars*** кладутся переменные используемые в роли. То же самое, что [defaults](defaults), но [приоритет](ansible%20vars) у vars выше чем у defaults (ansible применит скорее vars, чем defaults).

Стоит понимать, что ansible при компиляции роли читает только `/role/vars/main.yml`. Если был создан отдельный `.yml` файл с переменными их необходимо "подключить" в `main.yml`:
```yaml
- name: Load vars
  ansible.builtin.include_vars: http-tools.yml
```

Тогда ansible запарсит этот файл и "увидит" переменные.

Переменную можно вызвать следующим образом:
Синтаксис: `module: "{{ var }}"`

Например, в строку:
```yml
- name: Upload tool's names based on OS Family
	ansible.builtin.include_vars: "{{ ansible_os_family }}.yml"
```

