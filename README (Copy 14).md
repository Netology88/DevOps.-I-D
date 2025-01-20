# Домашнее задание к занятию «Индексы» - `matvey Khramov`  
sys-37

---
# Задание 1: Процентное отношение общего размера всех индексов к общему размеру всех таблиц

Для того чтобы посчитать процентное отношение общего размера всех индексов к общему размеру всех таблиц, можно использовать системные представления в PostgreSQL, такие как `pg_stat_user_tables` и `pg_stat_user_indexes`, чтобы получить информацию о размере таблиц и индексов.

Запрос, который выполняет необходимую задачу:

```sql
SELECT 
    (SUM(pg_table_size(i.relname))::float / SUM(pg_table_size(t.relname))::float) * 100 AS index_to_table_size_percentage
FROM 
    pg_stat_user_tables t
JOIN 
    pg_stat_user_indexes i ON t.relid = i.relid;
```
---
# Задание 2: Оптимизация запроса с использованием EXPLAIN ANALYZE
Для выполнения EXPLAIN ANALYZE запроса в PostgreSQL, необходимо сначала выполнить сам запрос с добавлением оператора EXPLAIN ANALYZE, чтобы проанализировать его выполнение:
---
```
EXPLAIN ANALYZE 
SELECT DISTINCT 
    CONCAT(c.last_name, ' ', c.first_name), 
    SUM(p.amount) OVER (PARTITION BY c.customer_id, f.title)
FROM 
    payment p
JOIN 
    rental r ON p.payment_date = r.rental_date
JOIN 
    customer c ON r.customer_id = c.customer_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
WHERE 
    DATE(p.payment_date) = '2005-07-30';
```
---

Перечень узких мест:
Использование DISTINCT: Этот оператор может значительно замедлить выполнение запроса, поскольку требует сортировки данных для исключения дублирующихся строк. В данном случае он применяется в сочетании с агрегатной функцией SUM() OVER(), что может привести к дополнительной нагрузке на выполнение запроса.

Использование SUM() OVER (PARTITION BY ...): Операция оконной функции может быть дорогой, особенно если количество строк в таблице payment велико, поскольку она требует расчета суммы по разделам для каждой строки в результирующем наборе.

Нет явных индексов: Если на столбцы, используемые для соединений (например, customer_id, payment_date, rental_date и т.д.), нет индексов, это может значительно замедлить выполнение запроса.

Применение функции DATE(p.payment_date): Использование функции DATE() на столбце payment_date может привести к потере возможности использовать индексы на этом столбце, если они есть.

---

Оптимизация запроса:
1. Удаление DISTINCT: Вместо использования DISTINCT попробуйте добиться того же результата с помощью агрегации. Если дублирование строк возникает из-за SUM() OVER (PARTITION BY ...), возможно, вам стоит пересмотреть логику агрегации, чтобы избежать этого.

2. Добавление индексов:

Индексы на столбцы, участвующие в соединениях, могут значительно ускорить выполнение запроса. Например:

```
CREATE INDEX idx_payment_payment_date ON payment(payment_date);
CREATE INDEX idx_rental_customer_id ON rental(customer_id);
CREATE INDEX idx_rental_inventory_id ON rental(inventory_id);
CREATE INDEX idx_customer_customer_id ON customer(customer_id);
CREATE INDEX idx_inventory_inventory_id ON inventory(inventory_id);
CREATE INDEX idx_film_film_id ON film(film_id);
```

3. Оптимизация фильтрации по дате: Вместо применения функции DATE() на столбце payment_date, попробуйте преобразовать дату на уровне запроса:
```
WHERE p.payment_date >= '2005-07-30' AND p.payment_date < '2005-07-31'
```

4. Использование INNER JOIN вместо перечисления таблиц в FROM: Это улучшит читаемость и позволит оптимизатору запросов эффективно выбирать планы выполнения:
---
```
FROM 
    payment p
JOIN 
    rental r ON p.payment_date = r.rental_date
JOIN 
    customer c ON r.customer_id = c.customer_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
```
---
