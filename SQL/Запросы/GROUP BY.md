# GROUP BY
Для группировки данных используется `GROUP BY`:
```sql
SELECT status, COUNT(*) AS count
FROM loans
GROUP BY status;
```
Тут, данные группируются по столбцу status, после чего считается количество записей каждой группы.
```SQL
SELECT > FROM > WHERE > GROUP BY # Эта цепочк покрывает большинство задач.
```

# HAVING
HAVING - позволяет ==фильтровать== данные **ПОСЛЕ** группировке. Аналог - [WHERE](WHERE.md), где данные фильтруются до группировки.

```sql
SELECT status, SUM(amount) AS sum
FROM loans
GROUP BY status
HAVING SUM(amount) > 10000;
```
