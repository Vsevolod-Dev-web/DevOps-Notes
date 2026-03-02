# 1. SELECT, FROM, WHERE
1. 80% запросов в SQL имеют следующую структуру:
```sql
SELECT [что]
FROM [откуда]
WHERE [условие]
```

# 2. GROUP BY
2. Для группировки данных используется `GROUP BY`:
```sql
SELECT status, COUNT(*) AS count
FROM loans
GROUP BY status;
```
Тут, данные группируются по столбцу status, после чего считается количество записей каждой группы.

```SQL
SELECT > FROM > WHERE > GROUP BY # Эта цепочк покрывает большинство задач.
```

# 3. JOIN
JOIN применяется когда необходимо объединять две таблицы и взять из них данные.
