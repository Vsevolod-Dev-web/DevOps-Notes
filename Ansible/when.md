В [Ansible](Ansible) можно задавать определенные условия для выполнения [тасков](tasks.md). Делается это с использованием ключа `when:` в таске.

```yaml
tasks:
  - name: Поставить IIS если таргет виндовый
    ansible.windows.win_feature:
      name: Web-Server
      state: present
    when: ansible_facts['os_family'] == "Windows" # можно писать просто: os_family
```

Так же, важно подметить, что [переменные в условие передаются](YAML) не стандартным синтаксисом:
```yaml
when: "{{ my_var }}" == "Windows" # Это неверно, не запарситься
when: my_var == "Windows" # Верно, запарсится.
```

Операторы сравнения как в Python, стандартные:
```yaml
when: var == "value"           # равно
when: var != "value"           # не равно
when: var > 5                  # больше
when: var in some_list         # в списке
when: "Server" in var_string   # подстрока в строке
when: var is defined           # переменная вообще задана
when: var is not defined       # не задана
```

### and / or
 Можно в одном условии задать несколько сравнений через логический AND:
```yaml
when: ansible_facts['os_family'] == "Windows" and ansible_facts['distribution_major_version'] == "10"
```

Если задать списком, будет читаться как AND:
```yaml
when:
  - ansible_facts['os_family'] == "Windows"
  - service_should_be_started == true
```

***Логический OR работает интуитивно.***

---

Так же, стоит понимать, что условия работают с ***[циклом (loop)](loop)*** в паре без явного указания. То есть, задав условие после цикла в таске, условие будет проверятся на каждой итерации нашей таски и те итерации, в которых условие вернуло false - выполнены не будут на таргете.

```yaml
- name: Создать пользователей, у кого пароль не пустой
  ansible.windows.win_user:
    name: "{{ item.name }}"
    password: "{{ item.password }}"
    state: present
  loop:
    - { name: oleg, password: Pass1! }
    - { name: vasya, password: "" }     ← пропустится
    - { name: ivan, password: Pass3! }
  when: item.password != ""
```

