<<<<<<< HEAD
# Домашнее задание к занятию "`Базы данных, их типы`" - `Matvey Khramov`  
#sys-37

---

###Задание 1. СУБД

1.1. Бюджетирование проектов с дальнейшим формированием финансовых аналитических отчётов и прогнозирования рисков. СУБД должна гарантировать целостность и чёткую структуру данных.

#Для задач бюджетирования и формирования аналитических отчетов, где важна целостность и структурированность данных, наилучшим выбором будет реляционная СУБД (например, PostgreSQL, MySQL или Oracle DB). Эти СУБД обеспечивают высокую степень гарантии целостности данных (ACID), что критично для финансовых операций. Реляционные базы хорошо подходят для сложных запросов и агрегаций, часто используемых в отчетности.

1.1. Хеширование стало занимать длительное время, какое API можно использовать для ускорения работы?*

#Для ускорения хеширования можно использовать специализированные библиотеки или API, такие как:

#    Crypto++ (C++ библиотека для криптографических операций, включая хеширование)
#    BLAKE2 (альтернатива SHA-256, более быстрая)
#    hashlib (Python API для различных алгоритмов хеширования, включая BLAKE2, SHA256)

Если хеширование — это не критическая часть производительности на уровне самой СУБД, можно также рассмотреть улучшение производительности с помощью индексов и партиционирования данных, что поможет ускорить выполнение запросов.

#1.2. Под каждый девелоперский проект создаётся отдельный лендинг, и все данные по лидам стекаются в CRM к маркетологам и менеджерам по продажам. Какой тип СУБД лучше использовать для лендингов и для CRM? СУБД должны быть гибкими и быстрыми.

#Для лендингов и CRM-систем подходит NoSQL СУБД, такие как MongoDB или Cassandra. Эти базы данных обладают высокой гибкостью в хранении данных, где структура может быть динамичной (например, информация о лидах), и обеспечивают хорошую производительность при большом объеме данных. Для лендингов важно, чтобы СУБД могла быстро работать с часто изменяющимися данными.

1.2. Можно ли эту задачу закрыть одной СУБД? И если да, то какой именно СУБД и какой реализацией?*

#Если задача требует единой системы для всех данных, можно использовать NewSQL базы данных, такие как Google Spanner или CockroachDB. Эти системы сочетают в себе преимущества реляционных баз данных (гарантии ACID) с масштабируемостью, характерной для NoSQL систем. Они могут быть полезны для организации работы как с CRM-системой, так и с лендингами.

1.3. Отдел контроля качества решил создать базу по корпоративным нормам и правилам, обучающему материалу и так далее, сформированную согласно структуре компании. СУБД должна иметь простую и понятную структуру.

#Для этой задачи хорошо подойдёт реляционная СУБД с чёткой схемой данных, как PostgreSQL или MySQL. Это обеспечит строгую структуру данных с возможностью легко описать связи между различными объектами (нормы, правила, обучающие материалы). Также можно использовать GraphDB или другие графовые базы данных, если задача требует моделирования сложных связей между материалами и правилами.

1.3. Можно ли под эту задачу использовать уже существующую СУБД из задач выше и если да, то как лучше это реализовать?*

#Да, можно использовать ту же реляционную СУБД (например, PostgreSQL), что и для бюджетирования. Структура данных в таком случае будет простой и понятной. Для этой задачи можно создать таблицы с определенными отношениями (например, таблица "Правила", таблица "Материалы", таблица "Категории"), что обеспечит легкость в управлении и доступе к данным.

1.4. Департамент логистики нуждается в решении задач по быстрому формированию маршрутов доставки материалов по объектам и распределению курьеров по маршрутам с доставкой документов. СУБД должна уметь быстро работать со связями.

#Для этого подойдёт графовая СУБД (например, Neo4j или ArangoDB). Графовые базы данных хорошо подходят для решения задач с маршрутами и логистическими связями, поскольку они оптимизированы для работы с сетями и связями между объектами (курьерами, объектами, маршрутами).

1.4. Можно ли к этой СУБД подключить отдел закупок или для них лучше сформировать свою СУБД в связке с СУБД логистов?*

#Можно интегрировать отдел закупок с логистической системой, используя одну СУБД, если предполагается, что данные закупок и логистики будут взаимосвязаны. Например, если закупки связаны с доставкой материалов, то можно расширить графовую модель, добавив соответствующие связи между заказами, поставками и логистикой.

1.5. Можно ли все перечисленные выше задачи решить, используя одну СУБД? Если да, то какую именно?*

#Если требуется объединить все задачи в одну систему, наиболее универсальным выбором будет NewSQL решение, например, CockroachDB или Google Spanner. Эти базы данных предлагают хорошую масштабируемость, гибкость и поддержку транзакций. Для конкретных задач, например, логистики или бюджетирования, возможно потребуется создание дополнительных слоёв абстракции или использование интеграционных решений, но сама СУБД сможет эффективно обработать все виды данных.

###Задание 2. Транзакции

2.1. Пользователь пополняет баланс счёта телефона, распишите пошагово, какие действия должны произойти для того, чтобы транзакция завершилась успешно.

#    Авторизация пользователя: Проверка данных пользователя, например, через PIN-код или биометрию.
#   Инициализация транзакции: Пользователь выбирает сумму пополнения и инициирует транзакцию.
#    Проверка доступности средств: Система проверяет, достаточно ли средств на банковском счете или другом источнике для проведения операции.
#    Блокировка средств: На счете пользователя временно блокируется необходимая сумма.
#    Пополнение баланса: После успешной проверки и блокировки средств баланс телефона пополняется на указанную сумму.
#    Подтверждение транзакции: Система отправляет уведомление пользователю о завершении транзакции и обновляет данные.

2.1. Какие действия должны произойти, если пополнение счёта телефона происходило бы через автоплатёж?*

#    Запуск автоплатежа: Пользователь настраивает автоплатеж с привязкой к банковской карте.
#    Периодическая проверка условий: Система автоматически проверяет баланс пользователя перед каждой запланированной датой пополнения.
#    Авторизация транзакции: Если необходимо, система использует двухфакторную аутентификацию для подтверждения.
#    Инициализация платежа: Система инициирует пополнение на основании установленных параметров.
#    Проверка доступности средств: Проверяется, достаточно ли средств на привязанной карте или счете.
#    Автоматическое пополнение: Если средства есть, система автоматически переводит деньги на счет телефона и уведомляет пользователя.

###Задание 3. SQL vs NoSQL

3.1. Напишите пять преимуществ SQL-систем по отношению к NoSQL.

#    Строгая схема данных: SQL-системы требуют заранее определенной структуры данных, что гарантирует целостность и точность данных.
#    Поддержка транзакций (ACID): SQL-системы обеспечивают полную поддержку транзакций с гарантиями атомарности, консистентности, изолированности и долговечности.
#    Продвинутая поддержка запросов: SQL предоставляет мощные средства для выполнения сложных запросов, включая JOIN, агрегации и подзапросы.
#    Долгосрочная стабильность и зрелость: SQL-системы существуют уже несколько десятилетий и обладают стабильностью и надежностью.
#    Широкая экосистема инструментов: SQL базы данных поддерживаются множеством аналитических, отчетных и интеграционных инструментов.

3.1. Какие, на ваш взгляд, преимущества у NewSQL систем перед SQL и NoSQL?*

#    Масштабируемость и производительность: NewSQL-системы поддерживают горизонтальное масштабирование, как NoSQL, но при этом сохраняют строгие гарантии транзакционной целостности, как SQL.
#    Поддержка распределенных транзакций: NewSQL предлагает высокую производительность в распределенных средах при сохранении поддержки ACID.
#    Снижение сложности управления: Эти системы предоставляют механизмы для автоматического распределения нагрузки и данных по нескольким узлам.

=======

