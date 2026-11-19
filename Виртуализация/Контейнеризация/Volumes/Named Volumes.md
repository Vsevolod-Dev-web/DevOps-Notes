Named Volume - это [том](Том%20(Volume)), который создаётся, монтируется на хост и управляется движком докера.

Особенность от его работы в том, что изменение в такой volumes руками не вносятся. Поэтому в эти тома выносят данные которые не подразумевается менять: данные приложения и т.д.

***Синтаксис***
Named volumes обязательно объявляются в блоке `volumes:`
```yml
volumes:
	pg_data:
	vault_data:
```

```yml
services:
  app:
    image: nginx:alpine
    volumes:
      # 1. BIND MOUNT (короткий синтаксис)
      # Путь начинается с точки (.) или слэша (/)
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
      - /etc/letsencrypt:/etc/letsencrypt:ro

      # 2. NAMED VOLUME (короткий синтаксис)
      # Указывается просто имя тома без путей
      - static_data:/usr/share/nginx/html
```