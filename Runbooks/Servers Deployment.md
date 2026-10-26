"radius". *srvnode5*.

OS: ubuntu 24.04
Ansible: linux-server-base

root: login closed
vsevolod: admin user

added ufw rules:
```shell
ufw enable allow 22
ufw default deny incoming
ufw default allow outgoing
```

for more sequrity, should use [AppArmor](SELinux)

can use Nginx to up web.

should use NTP to sinchronyse