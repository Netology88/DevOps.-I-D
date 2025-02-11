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
