-- MyEMS Fault Detection and Diagnosis Database

-- ---------------------------------------------------------------------------------------------------------------------
-- Schema myems_fdd_db
-- ---------------------------------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS `myems_fdd_db` ;
CREATE DATABASE IF NOT EXISTS `myems_fdd_db` ;
USE `myems_fdd_db` ;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_email_messages`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_email_messages` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_email_messages` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `recipient_name` VARCHAR(128) NOT NULL,
  `recipient_email` VARCHAR(128) NOT NULL,
  `subject` VARCHAR(128) NOT NULL,
  `message` LONGTEXT NOT NULL,
  `attachment_file_name` VARCHAR(128) NULL,
  `attachment_file_object` LONGBLOB NULL,
  `created_datetime_utc` DATETIME NOT NULL,
  `scheduled_datetime_utc` DATETIME NOT NULL,
  `status` VARCHAR(32) NOT NULL COMMENT 'new, sent, timeout',
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_email_messages_index_1` ON  `myems_fdd_db`.`tbl_email_messages`  (`status`,   `scheduled_datetime_utc`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_fdd_db`.`tbl_email_recipients`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_fdd_db`;

-- INSERT INTO `myems_fdd_db`.`tbl_email_recipients`
-- (`id`, `name`, `uuid`, `email`)
-- VALUES
-- (1, '江工', '590efb36-8587-42a9-ae6f-c715d21496d6', 'ems@example.com');

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_gsm_modems`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_gsm_modems` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_gsm_modems` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `serial_port` VARCHAR(64) NOT NULL,
  `baud_rate` INT NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Data for table `myems_fdd_db`.`tbl_gsm_modems`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_fdd_db`;

INSERT INTO `myems_fdd_db`.`tbl_gsm_modems`
(`id`, `serial_port`, `baud_rate`)
VALUES
(1, '/dev/ttyS0', 115200);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_rules`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_rules` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_rules` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `fdd_code` VARCHAR(128) NOT NULL COMMENT 'SYSTEM01, SYSTEM02, ... SPACE01, SPACE02, ... METER01, METER02, ...',
  `category` VARCHAR(128) NOT NULL COMMENT 'SYSTEM, SPACE, METER, TENANT, STORE, SHOPFLOOR, EQUIPMENT, COMBINEDEQUIPMENT',
  `priority` VARCHAR(128) NOT NULL COMMENT 'CRITICAL, HIGH, MEDIUM, LOW',
  `channel` VARCHAR(128) NOT NULL COMMENT 'WEB, EMAIL, SMS, WECHAT, CALL',
  `expression` JSON NOT NULL COMMENT 'JSON string of diagnosed objects, points, values, and recipients',
  `message_template` TEXT NOT NULL COMMENT 'Plain text template that supports $-substitutions',
  `is_enabled` BOOL NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_rules_index_1` ON  `myems_fdd_db`.`tbl_rules`  (`name`);


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_sms_recipients`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_sms_recipients` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_sms_recipients` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `mobile_number` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_sms_recipients_index_1` ON  `myems_fdd_db`.`tbl_sms_recipients`  (`name`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_fdd_db`.`tbl_sms_recipients`
-- ----------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_fdd_db`;

-- INSERT INTO `myems_fdd_db`.`tbl_sms_recipients`
-- (`id`, `name`, `uuid`, `mobile_number`)
-- VALUES
-- (1, '王工', 'cb9f9009-4f13-4844-9ef0-3f8a537420d7', '008613888888888');

-- COMMIT;

-- ----------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_email_servers`
-- ----------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_email_servers` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_email_servers` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `host` VARCHAR(255) NOT NULL,
  `port` INT NOT NULL,
  `requires_authentication` BOOL NOT NULL,
  `user_name` VARCHAR(255),
  `password` VARCHAR(255),
  `from_addr` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));

-- ----------------------------------------------------------------------------------
-- Data for table `myems_fdd_db`.`tbl_email_servers`
-- ----------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_fdd_db`;

INSERT INTO `myems_fdd_db`.`tbl_email_servers`
(`id`, `host`, `port`, `requires_authentication`, `user_name`, `password`, `from_addr`)
VALUES
(1, 'smtp.163.com', 25, true, 'myems', 'bXllbXM=', 'myems@163.com');

COMMIT;

-- ----------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_text_messages_outbox`
-- ----------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_text_messages_outbox` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_text_messages_outbox` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `recipient_name` VARCHAR(32) NOT NULL,
  `recipient_mobile` VARCHAR(32) NOT NULL,
  `message` LONGTEXT NOT NULL,
  `created_datetime_utc` DATETIME NOT NULL,
  `scheduled_datetime_utc` DATETIME NOT NULL,
  `acknowledge_code` VARCHAR(32) NULL,
  `status` VARCHAR(32) NOT NULL COMMENT 'new, sent, acknowledged, timeout',
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_text_messages_outbox_index_1` ON  `myems_fdd_db`.`tbl_text_messages_outbox`  (`status`,   `scheduled_datetime_utc`);

-- ----------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_text_messages_inbox`
-- ----------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_text_messages_inbox` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_text_messages_inbox` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `sender_mobile` VARCHAR(32) NOT NULL,
  `message` LONGTEXT NOT NULL,
  `received_datetime_utc` DATETIME NOT NULL,
  `status` VARCHAR(32) NOT NULL COMMENT 'new, done',
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_text_messages_inbox_index_1` ON  `myems_fdd_db`.`tbl_text_messages_inbox`  (`status`);


-- ----------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_web_messages`
-- ----------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_web_messages` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_web_messages` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL COMMENT 'foreign key to feed_user_db.tbl_users',
  `subject` VARCHAR(128) NOT NULL,
  `category` VARCHAR(128) NOT NULL COMMENT 'SYSTEM, SPACE, METER, TENANT, STORE, SHOPFLOOR, EQUIPMENT, COMBINEDEQUIPMENT',
  `priority` VARCHAR(128) NOT NULL COMMENT 'CRITICAL, HIGH, MEDIUM, LOW',
  `message` LONGTEXT NOT NULL,
  `created_datetime_utc` DATETIME NOT NULL,
  `status` VARCHAR(32) NOT NULL COMMENT 'new, acknowledged, timeout',
  `reply` LONGTEXT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_web_messages_index_1` ON  `myems_fdd_db`.`tbl_web_messages`  (`user_id`, `status`, `created_datetime_utc`);

-- ----------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_wechat_configs`
-- refer to https://mp.weixin.qq.com/
-- ----------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_wechat_configs` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_wechat_configs` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `api_server` VARCHAR(255) NOT NULL, -- WeChat Official Account Platform's API Server
  `app_id` VARCHAR(255) NOT NULL, -- Encoded APPID
  `app_secret` VARCHAR(255), -- Encoded APPSECRET
  `access_token` VARCHAR(512), -- Encoded ACCESS_TOKEN
  `expires_datetime_utc` DATETIME NOT NULL, -- ACCESS_TOKEN will expire at this datetime in UTC
  PRIMARY KEY (`id`));

-- ----------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_wechat_messages_outbox`
-- ----------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_wechat_messages_outbox` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_wechat_messages_outbox` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `recipient_name` VARCHAR(32) NOT NULL,
  `recipient_openid` VARCHAR(32) NOT NULL,
  `message_template_id` VARCHAR(64) NOT NULL,
  `message_data` JSON NOT NULL,
  `created_datetime_utc` DATETIME NOT NULL,
  `scheduled_datetime_utc` DATETIME NOT NULL,
  `acknowledge_code` VARCHAR(32) NULL,
  `status` VARCHAR(32) NOT NULL COMMENT 'new, sent, acknowledged, timeout',
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_wechat_messages_outbox_index_1` ON  `myems_fdd_db`.`tbl_wechat_messages_outbox`  (`status`, `scheduled_datetime_utc`);

-- ----------------------------------------------------------------------------------
-- Table `myems_fdd_db`.`tbl_wechat_messages_inbox`
-- ----------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_fdd_db`.`tbl_wechat_messages_inbox` ;

CREATE TABLE IF NOT EXISTS `myems_fdd_db`.`tbl_wechat_messages_inbox` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `sender_openid` VARCHAR(32) NOT NULL,
  `message` LONGTEXT NOT NULL,
  `received_datetime_utc` DATETIME NOT NULL,
  `status` VARCHAR(32) NOT NULL COMMENT 'new, done',
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_wechat_messages_inbox_index_1` ON  `myems_fdd_db`.`tbl_wechat_messages_inbox`  (`status`);


COMMIT;
