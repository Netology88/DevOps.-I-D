# Домашнее задание к занятию «Базы данных» - `matvey Khramov`  
sys-37

---

### Задание 1

Опишите не менее семи таблиц, из которых состоит база данных:

    какие данные хранятся в этих таблицах;
    какой тип данных у столбцов в этих таблицах, если данные хранятся в PostgreSQL.

Приведите решение к следующему виду:

Сотрудники (

    идентификатор, первичный ключ, serial,
    фамилия varchar(50),
    ...
    идентификатор структурного подразделения, внешний ключ, integer).



#1. Сотрудники (Employees)
Эта таблица будет хранить информацию о каждом сотруднике, включая его личные данные, оклад, должность, структурное подразделение, а также проект, на который он назначен.
```
....sql
....Copy code
....Сотрудники (
....    идентификатор, первичный ключ, serial,
....    фамилия, varchar(50),
....    имя, varchar(50),
....    отчество, varchar(50),
....    оклад, numeric(10, 2),
....    должность, varchar(100),
....    дата_найма, date,
....    адрес_филиала, varchar(255),
....    идентификатор_структурного_подразделения, внешний ключ, integer,
....    идентификатор_проекта, внешний ключ, integer
....)
```
#2. Структурные подразделения (Departments)
Эта таблица будет содержать информацию о подразделениях компании, например, о различных центрах и группах, к которым могут быть прикреплены сотрудники.

```
....sql
....Copy code
....Структурные_подразделения (
....    идентификатор, первичный ключ, serial,
....    название, varchar(100),
....    тип_подразделения, varchar(50)
....)
```
#3. Проекты (Projects)
Таблица для хранения информации о проектах, на которые могут быть назначены сотрудники.
```
....sql
....Copy code
....Проекты (
....    идентификатор, первичный ключ, serial,
....    название, varchar(255),
....    описание, text
....)
```
#4. Типы подразделений (DepartmentTypes)
Эта таблица будет хранить информацию о типах подразделений (например, "Группа", "Отдел", "Департамент").
```
....sql
....Copy code
....Типы_подразделений (
....    идентификатор, первичный ключ, serial,
....    название, varchar(50)
....)
```
#5. Адреса филиалов (BranchAddresses)
В этой таблице будут храниться адреса филиалов, где работают сотрудники.
```
sql
Copy code
....Адреса_филиалов (
....    идентификатор, первичный ключ, serial,
....    адрес, varchar(255)
....)
```
#6. Должности (Positions)
Эта таблица будет содержать все возможные должности в компании, которые могут быть присвоены сотрудникам.
```
sql
Copy code
....Должности (
....    идентификатор, первичный ключ, serial,
....    название, varchar(100),
....    описание, text
....)
```
#7. История изменений оклада (SalaryHistory)
Таблица для отслеживания изменений оклада сотрудников.
```
sql
Copy code
....История_изменений_оклада (
....   идентификатор, первичный ключ, serial,
....    идентификатор_сотрудника, внешний ключ, integer,
....    дата_изменения, date,
....    новый_оклад, numeric(10, 2)
....)
```