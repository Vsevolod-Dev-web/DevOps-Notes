## INNER JOIN
`INNER JOIN` - только те записи, которые есть в обеих таблицах:
```sql
/*
Буквально: Выбрать имя из сущности клиенты, сумму из сущности loans. Из сущности клиенты как "с" присоединить "только если есть в обеих таблицах", из сущности loans как "l" по полям id из clients и client_id из loans
*/

SELECT c.name, l.amount
FROM clients c
INNER JOIN loans l ON c.id = l.client_id;
```

Результат:

|name|amount|
|---|---|
|Иван|5000|
|Иван|3000|
|Мария|8000|

Петра нет — у него нет строки в `loans`.