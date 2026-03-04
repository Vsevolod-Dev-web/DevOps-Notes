
# WHERE WITH NUMS
Иногда требуется выбрать определенную часть данных. В огромных базах на миллионы записей это может быть невозможным сделать в ручную.

Для более тонкого доступа к данным используются условия. 

`WHERE` - помогает сортировать данные, использую логические операнды и числовые условия перед возвращением.

```sql
SELECT column, another_column, ...
FROM mytable
WHERE condition
	AND/OR another_condition
	AND/OR ...;
```

Для более сложной сортировки, условия могут строиться с численными логическими операторами. Ниже в таблице приведены некоторые полезные операнды для работы с численными значениями.

|                     |                                                      |                               |
| ------------------- | ---------------------------------------------------- | ----------------------------- |
| Operator            | Condition                                            | SQL Example                   |
| =, !=, <, <=, >, >= | Standard numerical operators                         | col_name != 4                 |
| BETWEEN … AND …     | Number is within range of two values (inclusive)     | col_name BETWEEN 1.5 AND 10.5 |
| NOT BETWEEN … AND … | Number is not within range of two values (inclusive) | col_name NOT BETWEEN 1 AND 10 |
| IN (…)              | Number exists in a list                              | col_name IN (2, 4, 6)         |
| NOT IN (…)          | Number does not exist in a list                      | col_name NOT IN (1, 3, 5)     |

# WHERE WITH STRINGs
При написании запросов **WHERE** со столбцами, содержащими текстовые данные, SQL поддерживает ряд полезных операторов для выполнения таких действий, как сравнение строк без учета регистра и сопоставление шаблонов с подстановочными знаками. 

|            |                                                                                                       |                                                                         |
| ---------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| Operator   | Condition                                                                                             | Example                                                                 |
| =          | Case sensitive exact string comparison (_notice the single equals_)                                   | col_name = "abc"                                                        |
| != or <>   | Case sensitive exact string inequality comparison                                                     | col_name != "abcd"                                                      |
| LIKE       | Case insensitive exact string comparison                                                              | col_name LIKE "ABC"                                                     |
| NOT LIKE   | Case insensitive exact string inequality comparison                                                   | col_name NOT LIKE "ABCD"                                                |
| %          | Used anywhere in a string to match a sequence of zero or more characters (only with LIKE or NOT LIKE) | col_name LIKE "%AT%"  <br>(matches "AT", "ATTIC", "CAT" or even "BATS") |
| _          | Used anywhere in a string to match a single character (only with LIKE or NOT LIKE)                    | col_name LIKE "AN_"  <br>(matches "AND", but not "AN")                  |
| IN (…)     | String exists in a list                                                                               | col_name IN ("A", "B", "C")                                             |
| NOT IN (…) | String does not exist in a list                                                                       | col_name NOT IN ("D", "E", "F")                                         |