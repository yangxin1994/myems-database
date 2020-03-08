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
-- Table `myems_user_db`.`tbl_privileges`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_user_db`.`tbl_privileges` ;

CREATE TABLE IF NOT EXISTS `myems_user_db`.`tbl_privileges` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `data` JSON NOT NULL,
  PRIMARY KEY (`id`));

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
