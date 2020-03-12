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
[tbl_data_sources](#tbl_data_sources)

#### tbl_cost_centers

| Name      | Type     | Length     | Allow Null | Description
| :---          |    :----:   |  :----:       |  :----:       |     :---         |
| id            |   BIGINT    |             | - [ ] Null - [x] Not Null | Identity
| name      | VARCHAR |     128    | - [ ] Null - [x] Not Null   | Name
| uuid       | CHAR         | 36          | - [ ] Null - [x] Not Null  | UUID
| external_id   | VARCHAR | 36 |   - [x] Null - [ ] Not Null | 外部系统中的ID或标记，如SAP等ERP系统


#### tbl_data_sources

| Name      | Type     | Length     | Not Null | Description
| :---          |    :----:   |  :----:       |  :----:       |     :---         |
| id            |   BIGINT    |              | - [ ] Null - [x] Not Null | Identity
| name      | VARCHAR |     128    | - [ ] Null - [x] Not Null | Name
| uuid       | CHAR         | 36          | - [ ] Null - [x] Not Null | UUID
| protocol   | VARCHAR | 16        | - [ ] Null - [x] Not Null | 通讯协议 ('modbus-tcp', 'modbus-tru', 'bacnet-ip', 's7', 'opc-ua', 'control-logix' )
| connection   | JSON |   |  - [ ] Null - [x] Not Null | 通讯地址 JSON格式
| last_seen_datetime_utc   | DATETIME |   |  - [ ] Null - [x] Not Null | 最后一次上线时间
