## MyEMS Database

### Introduction

Providing database schema and scripts for MyEMS.


### Prerequisites
 [MySQL 8.0](https://www.mysql.com/)
 or [MariaDB 10.5](https://mariadb.org/)
 or [MemSQL 7.0](https://www.memsql.com/) (highly recommended)


### Installation

Execute  the scripts in a MySQL client tool (MySQL Workbench, Navicat, DBaver, phpMyAdmin, etc.)

#### Change COLLATE for MySQL server before version 8.0
```
sudo nano /etc/mysql/my.cnf
```
```
[client]
default-character-set = utf8mb4
[mysql]
default-character-set = utf8mb4
[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci
```

### Database Definition

#### myems_system_db

##### tbl_cost_centers

##### tbl_data_sources

#### myems_historical_db

#### myems_energy_db

#### myems_billing_db

#### myems_user_db

#### myems_fdd_db

#### myems_reporting_db
