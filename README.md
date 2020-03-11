## MyEMS Database

### Introduction
Providing database schema and scripts for MyEMS.


### Prerequisites
MySQL 8.0 or MemSQL 7.0


### Installation
Execute  the scripts in a MySQL client tool (MySQL Workbench, Navicate, DBaver)

### Change COLLATE for MySQL server before version 8.0
sudo nano /etc/mysql/my.cnf

[client]
default-character-set = utf8mb4
[mysql]
default-character-set = utf8mb4
[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci
