# Домашнее задание к занятию «Уязвимости и атаки на информационные системы»  
## SYS-37

---

### Задание 1

Скачайте и установите виртуальную машину Metasploitable: https://sourceforge.net/projects/metasploitable/.

Это типовая ОС для экспериментов в области информационной безопасности, с которой следует начать при анализе уязвимостей.

Просканируйте эту виртуальную машину, используя nmap.

Попробуйте найти уязвимости, которым подвержена эта виртуальная машина.

Сами уязвимости можно поискать на сайте https://www.exploit-db.com/.

Для этого нужно в поиске ввести название сетевой службы, обнаруженной на атакуемой машине, и выбрать подходящие по версии уязвимости.

    Какие сетевые службы в ней разрешены?
    Какие уязвимости были вами обнаружены? (список со ссылками: достаточно трёх уязвимостей)


1. ![Screenshot 1](https://github.com/Netology88/DevOps.-I-D/blob/main/screenshots/Screenshot%20from%202025-02-10%2010-53-04.png)


 1. https://www.exploit-db.com/exploits/21895
 2. https://www.exploit-db.com/exploits/38846
 3. https://www.exploit-db.com/exploits/25775

---

### Задание 2

Проведите сканирование Metasploitable в режимах SYN, FIN, Xmas, UDP.

Запишите сеансы сканирования в Wireshark.

Ответьте на следующие вопросы:

    Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?
    Как отвечает сервер?


1. ![Screenshot 2](https://github.com/Netology88/DevOps.-I-D/blob/main/screenshots/Screenshot%20from%202025-02-11%2012-10-20.png)


2. ![Screenshot 3](https://github.com/Netology88/DevOps.-I-D/blob/main/screenshots/Screenshot%20from%202025-02-11%2012-10-35.png)

3. ![Screenshot 3](https://github.com/Netology88/DevOps.-I-D/blob/main/screenshots/Screenshot%20from%202025-02-11%2012-10-49.png)

4. ![Screenshot 3](https://github.com/Netology88/DevOps.-I-D/blob/main/screenshots/Screenshot%20from%202025-02-11%2012-11-03.png)

Ответы на вопросы:
Чем отличаются эти режимы сканирования с точки зрения сетевого трафика?

SYN Scan: Этот метод сканирования вызывает очень минимальный трафик, поскольку он не завершает соединение (только отправляет SYN и ждет ответа). Если сервер откликается с SYN-ACK, то порт открыт, если RST, то закрыт.

FIN Scan: В этом режиме пакеты с флагом FIN отправляются. Сервер, который ожидает завершение соединения, может отправить RST-пакет, если порт закрыт. Если порт открыт, сервер может игнорировать пакет. Этот метод менее заметен, поскольку обычно не вызывает ответных пакетов.

Xmas Scan: При этом сканировании пакеты с флагами FIN, URG и PSH вызывают необычное поведение в большинстве серверов, которые могут их игнорировать, но IDS/IPS могут их зафиксировать.

UDP Scan: Этот метод отличается от TCP тем, что пакеты UDP не устанавливают соединения, и серверы могут не отвечать на эти пакеты, если порт закрыт. Это делает сканирование UDP сложнее для анализа, так как не всегда можно получить ответ.

Как отвечает сервер?

Для SYN Scan сервер отвечает SYN-ACK, если порт открыт, или RST, если закрыт.
Для FIN Scan сервер может отправить RST, если порт закрыт, или проигнорировать пакет, если порт открыт.
Для Xmas Scan сервер может либо игнорировать пакет (если порт открыт), либо отправить RST (если порт закрыт).
Для UDP Scan сервер может не ответить на закрытые порты, и если порт открыт, то он может ответить ICMP Destination Unreachable (если нет службы на порту) или иногда UDP ответ, если служба на порту существует.
