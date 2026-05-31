В Ansible есть ***циклы***. Цикл позволяет выполнить *одно и тоже с разными значениями*. В ansible циклы - это скорее ***switch-case структура*** если проводить аналогию с языками программирования.

То есть, скажем, нам нужно выполнить таску на группе таргетов. Предположим, на каждом хосте нужно создать по 3 юзера. Тогда play будет следующим:

```yaml
- name: base-user-init
  hosts: windows
  
  tasks:
    - name: Users-add
      ansible.windows.win_user:
	    name: "{{ item.name }}"
	    password: "{{ item.password }}"
        state: present
      loop:
	    - { name: vsevolod, password: 123 }
	    - { name: oleg, password: 122 }
	    - { name: ivan, password: MegaStrongPassrod123! }
```

