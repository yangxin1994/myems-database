## MyEMS Database

### Introduction

Providing database schema and scripts for MyEMS.


### Prerequisites

MySQL 8.0
MemSQL 7.0 (highly recommended)


### Installation

Execute  the scripts in a MySQL client tool (MySQL Workbench, Navicate, DBaver)

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
[tbl_cost_centers](#tbl_cost_centers)

#### tbl_cost_centers

| Name      | Type     | Length     | Not Null | Description
| :---          |    :----:   |  :----:       |  :----:       |              ---: |
| id            |   BIGINT    |               | - [x]      | Identity
| name      | VARCHAR |     128    |  - [x]     | Name
| uuid       | CHAR         | 36          | - [x]      | UUID
| external_id   | VARCHAR | 36 |   - [x]      | 外部系统中的ID或标记，如SAP等ERP系统
