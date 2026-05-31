***handlers*** - это реакции на изменения на таргете. Это специфичный [task](tasks) который запускается когда другой таск его дёрнет.

Под дёрнет стоит понимать определённое свойство в такске `notify:` - которое просто вызывает ***handler***.

Допустим, есть таска которая тюнит конфиг Nginx. После изменения конфига, если оно произошло необходимо перезапустить службу. Handlers это позволяют:

`tasks/main.yml`
```yaml
- name: Тюнинг Nginx конига
  ansible.builtin.template:
    src: nginx.conf.j2 
    dest: /etc/nginx/nginx.conf
  notify: restart nginx
```

`handlers/main.yml`
```yaml
- name: restart nginx
  ansible.builtin.service:
    name: nginx
    state: restarted
```

Если таргет после запуска таска вернул - `status: changed`, то handlers добавляется в очередь. В конце, все handlers в очереди прогоняются.

!!!

Handler запускается, когда таск в котором он указан отдаёт `changed`. Если отдаёт `ok` handler не дёрнется.

Логика такая:
1. Таск выполнился.
2. Ansible смотрит результат таска: `ok`, `changed` или `failed`?
3. **Только если результат `changed`** → Ansible запоминает в очередь все handlers, перечисленные в `notify:` этого таска.
4. Если результат `ok` (ничего не изменилось благодаря идемпотентности) → handlers НЕ ставятся в очередь.
5. В конце плея Ansible проходит по очереди и выполняет накопленные handlers.