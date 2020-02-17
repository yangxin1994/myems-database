-- MyEMS User Database

-- ---------------------------------------------------------------------------------------------------------------------
-- Schema myems_user_db
-- ---------------------------------------------------------------------------------------------------------------------
-- MyEMS User Database
DROP DATABASE IF EXISTS `myems_user_db` ;

-- ---------------------------------------------------------------------------------------------------------------------
-- Database myems_user_db
--
-- MyEMS User Database
-- ---------------------------------------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `myems_user_db` ;
USE `myems_user_db` ;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_user_db`.`tbl_users`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_user_db`.`tbl_users` ;

CREATE TABLE IF NOT EXISTS `myems_user_db`.`tbl_users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `display_name` VARCHAR(128) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `salt` VARCHAR(128) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `is_admin` BOOL NOT NULL ,
  `privilege_id` BIGINT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Data for table `myems_user_db`.`tbl_users`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_user_db`;
INSERT INTO `myems_user_db`.`tbl_users`
(`id`, `name`, `uuid`, `display_name`, `email`, `salt`, `password`, `is_admin`)
VALUES
(1, 'administrator', '69ddf5d4-22ae-4ff6-a26a-5a5e578da687', '系统管理员',
  'admin@myems.io', 'e0366ed2da694addad490e016c7daf88',
  '9c0cc1cbc5c698e1aad715ff6b677be584f95267e6d5bcec45cf9c516b586fb7454eb55ba852ff4bc4bcbb5d6375f2a886d74f7220b1ff3dee12f3c1e9df1531', true);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_user_db`.`tbl_privileges`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_user_db`.`tbl_privileges` ;

CREATE TABLE IF NOT EXISTS `myems_user_db`.`tbl_privileges` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `data` JSON NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_user_db`.`tbl_privileges`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_user_db`;

-- INSERT INTO `myems_user_db`.`tbl_privileges`
-- (`id`, `name`, `uuid`, `data`)
-- VALUES
-- (1, 'LGE', '91d998e6-3ae8-48d5-8d87-becd1999929b', '{"companies":[1], "factories":[1,2], "shops":[1,2], "accessorial_systems":[1,2], "auxiliary_systems":[1,2], "auxiliary_subsystems":[1,2], "lines":[1,2], "supplemental_systems":[1,2]}');

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_user_db`.`tbl_sessions`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_user_db`.`tbl_sessions` ;

CREATE TABLE IF NOT EXISTS `myems_user_db`.`tbl_sessions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_uuid` CHAR(36) NOT NULL,
  `token` VARCHAR(128) NOT NULL,
  `utc_expires` DATETIME NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_user_db`.`tbl_logs`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_user_db`.`tbl_logs` ;

CREATE TABLE IF NOT EXISTS `myems_user_db`.`tbl_logs` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL,
  `utc_date_time` DATETIME NOT NULL,
  `activity` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`));

COMMIT;
