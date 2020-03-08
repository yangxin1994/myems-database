-- MyEMS Space Database

-- ---------------------------------------------------------------------------------------------------------------------
-- Schema myems_space_db
-- ---------------------------------------------------------------------------------------------------------------------
-- MyEMS Space Database
DROP DATABASE IF EXISTS `myems_space_db` ;

-- ---------------------------------------------------------------------------------------------------------------------
-- Database myems_space_db
--
-- MyEMS Space Database
-- ---------------------------------------------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `myems_space_db` ;
USE `myems_space_db` ;


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_cost_centers`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_cost_centers` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_cost_centers` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `external_id` VARCHAR(36), --ID in external syste, such as SAP, ERP
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_cost_centers_index_1` ON  `myems_space_db`.`tbl_cost_centers`   (`name`);


-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_cost_centers`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_cost_centers`
-- (`id`, `name`, `uuid`, `global_id`)
-- VALUES
-- (1, '成本中心1', 'd97b9736-c4f9-4005-a534-6af3487303ad', NULL);
-- (2, '成本中心2', 'aa9b4e27-df2c-4b39-9e87-cba3e1f0ab26', '1010248003');
-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_companies`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_companies` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_companies` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `timezone_id` BIGINT NOT NULL,
  `ems_contact_name` VARCHAR(32) NOT NULL,
  `ems_contact_phone` VARCHAR(32) NOT NULL,
  `ems_contact_email` VARCHAR(64) NOT NULL,
  `cost_center_id` BIGINT,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_companies_index_1` ON  `myems_space_db`.`tbl_companies`   (`name`);


-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_companies`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_space_db`;
INSERT INTO `myems_space_db`.`tbl_companies`
(`id`, `name`, `uuid`, `timezone_id`, `ems_contact_name`, `ems_contact_phone`, `ems_contact_email`, `cost_center_id`)
VALUES
(1, 'Beijing Company', '7f08895f-f6d0-482a-82d9-e32fb3abb1e2', 56, 'Mr. Johnson', '13888888888', 'ems@example.com', NULL);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_spaces`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_spaces` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_spaces` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `company_id` BIGINT NOT NULL,
  `timezone_id` BIGINT NOT NULL,
  `ems_contact_name` VARCHAR(32) NOT NULL,
  `ems_contact_phone` VARCHAR(32) NOT NULL,
  `ems_contact_email` VARCHAR(64) NOT NULL,
  `is_counted` BOOL NOT NULL,
  `is_equipment_status_counted` BOOL NOT NULL,
  `is_output_counted` BOOL NOT NULL,
  `cost_center_id` BIGINT,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_factories_index_1` ON  `myems_space_db`.`tbl_factories`   (`name`);
CREATE INDEX `tbl_factories_index_2` ON  `myems_space_db`.`tbl_factories`   (`company_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_equipments`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_equipments` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_equipments` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `serial_number` VARCHAR(128) NOT NULL,
  `manufacturer` VARCHAR(128) NOT NULL,
  `maintainer` VARCHAR(128) NOT NULL,
  `use_life_start` DATE NOT NULL,
  `use_life_end` DATE NOT NULL,
  `is_main` BOOL NOT NULL,
  `is_counted` BOOL NOT NULL,
  `is_output_counted` BOOL NOT NULL,
  `advanced_type` VARCHAR(128)  NULL COMMENT 'NULL, heat_pump, ground_source_heat_pump, high_temperature_heat_pump, process_heat_pump, steam_boiler, water_boiler, air_compressor, air_handling_unit, cooling_water_pump, chilled_water_pump, cooling_tower, chiller',
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_equipments_index_1` ON  `myems_space_db`.`tbl_equipments`   (`name`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_equipments`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_equipments`
-- (`id`, `name`, `uuid`, `serial_number`, `manufacturer`, `maintainer`, `use_life_start`, `use_life_end`, `is_main`, `is_counted`, `is_output_counted`)
-- VALUES
-- (1, '设备1', 'bfa8b106-89a1-49ca-9b2b-a481ac41a873', 'bfa8b106', 'York', 'Johnson Controls', '2016-01-01', '2025-12-31', true, true, false),
-- (2, '设备2', 'ad5798ec-d827-43d9-bf08-fc7516f9c4c8', 'ad5798ec', 'York', 'Johnson Controls', '2016-01-01', '2025-12-31', false, true, false);

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_spaces_equipments`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_spaces_equipments` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_spaces_equipments` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `space_id` BIGINT NOT NULL,
  `equipment_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_spaces_equipments`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_spaces_equipments`
-- (`id`, `space_id`, `equipment_id`)
-- VALUES
-- (1, 1, 1);

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_energy_categories`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_energy_categories` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_energy_categories` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `unit_of_measure` VARCHAR(32) NOT NULL,
  `kgce` DOUBLE NOT NULL COMMENT 'Kilogram of Coal Equivalent',
  `kgco2e` DOUBLE NOT NULL COMMENT 'Carbon Dioxide Emissions Factor',
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_energy_categories_index_1` ON  `myems_space_db`.`tbl_energy_categories`   (`name`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_energy_categories`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_space_db`;

INSERT INTO `myems_space_db`.`tbl_energy_categories`
(`id`, `name`, `uuid`, `unit_of_measure`, `kgce`, `kgco2e`)
VALUES
(1, '电', '6d0753ed-8b43-4332-b6fd-d2f5813831d3', 'kWh', 0.1229, 0.928),
(2, '自来水', '3dbfa598-fccc-4d60-bf11-14bd55540c66', 'm³', 0.0857, 0.910),
(3, '天然气', '6d0753ed-8b43-4332-b6fd-d2f5813831d3', 'm³', 1.3300, 2.1622),
(4,'4℃冷冻水','d2a3021a-4911-4611-856e-80133000f1d5','m³',1,1),
(5,'7℃冷冻水','c1ad0696-e1ab-4e0c-a342-b194c0bc27e0','m³',1,1),
(6,'蒸汽','ac91a5c4-4ae5-4a73-8e3f-044591f42eef','T',1,1),
(7,'压缩空气','ff238e98-cd35-47c5-88a3-00617587775d','m³',1,1),
(8,'循环水','7e159a34-b2e6-4fd3-ba76-897d134abe06','m³',1,1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_meters`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_meters` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_meters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `energy_category_id` BIGINT NOT NULL,
  `is_counted` BOOL NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_meters_index_1` ON  `myems_space_db`.`tbl_meters`   (`name`);
CREATE INDEX `tbl_meters_index_2` ON  `myems_space_db`.`tbl_meters`   (`energy_category_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_meters`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_meters`
-- (`id`, `name`, `uuid`, `energy_category_id`, `is_counted`)
-- VALUES
-- (1, '示例表1', '5ca47bc5-22c2-47fc-b906-33222191ea40', 1, true),
-- (2, '示例表2', '5ca47bc5-22c2-47fc-b906-33222191ea40', 1, true),
-- (3, '示例表3', '6db58cd6-33d3-58ed-a095-22333202fb51', 1, true);

-- COMMIT;


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_virtual_meters` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_virtual_meters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `energy_category_id` BIGINT NOT NULL,
  `is_counted` BOOL NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_virtual_meters_index_1` ON  `myems_space_db`.`tbl_virtual_meters`   (`name`);
CREATE INDEX `tbl_virtual_meters_index_2` ON  `myems_space_db`.`tbl_virtual_meters`   (`energy_category_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_virtual_meters`
-- (`id`, `name`, `uuid`, `energy_category_id`, `is_counted`)
-- VALUES
-- (1, '示例虚拟表', '3fff2cfb-f755-44c8-a919-6135205a8573', 1, true);

-- COMMIT;


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_offline_meters` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_offline_meters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `energy_category_id` BIGINT NOT NULL,
  `is_counted` BOOL NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_offline_meters_index_1` ON  `myems_space_db`.`tbl_offline_meters`   (`name`);
CREATE INDEX `tbl_offline_meters_index_2` ON  `myems_space_db`.`tbl_offline_meters`   (`energy_category_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_offline_meters`
-- (`id`, `name`, `uuid`, `energy_category_id`, `is_counted`)
-- VALUES
-- (1, '示例离线表', '62f473e0-1a35-41f3-9c30-8110d75d65bb', 1, true);
-- COMMIT;



-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_expressions`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_expressions` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_expressions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `uuid` CHAR(36) NOT NULL,
  `virtual_meter_id` BIGINT NOT NULL,
  `equation` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_expressions_index_1` ON  `myems_space_db`.`tbl_expressions`   (`virtual_meter_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_expressions`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_expressions`
-- (`id`, `uuid`, `virtual_meter_id`, `equation`)
-- VALUES
-- (1, '3fff2cfb-f755-44c8-a919-6135205a8573', 1, 'x+y-z');
-- COMMIT;


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_variables`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_variables` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_variables` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` CHAR(36) NOT NULL,
  `expression_id` BIGINT NOT NULL,
  `meter_type` VARCHAR(32) NOT NULL,
  `meter_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`));
  CREATE INDEX `tbl_variables_index_1` ON  `myems_space_db`.`tbl_variables`   (`expression_id`);
  CREATE INDEX `tbl_variables_index_2` ON  `myems_space_db`.`tbl_variables`   (`meter_id`, `meter_type`, `expression_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_variables`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;
-- -- id 1
-- -- meter_type = {'meter', 'virtual_meter', 'offline_meter'}
-- --
-- INSERT INTO `myems_space_db`.`tbl_variables`
-- (`id`, `name`, `expression_id`, `meter_type`, `meter_id`)
-- VALUES
-- (1, 'x', 1, 'meter', 1),
-- (2, 'y', 1, 'meter', 2),
-- (3, 'z', 1, 'meter', 3);

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_data_sources`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_data_sources` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_data_sources` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `protocol` VARCHAR(16) NOT NULL,
  `connection` JSON NOT NULL,
  `last_seen_datetime_utc` DATETIME NULL  COMMENT 'The last seen date time in UTC via PING or TELNET',
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_data_sources_index_1` ON  `myems_space_db`.`tbl_data_sources`   (`name`);
CREATE INDEX `tbl_data_sources_index_2` ON  `myems_space_db`.`tbl_data_sources`   (`protocol`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_data_sources`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_data_sources`
-- (`id`, `name`, `uuid`, `protocol`,  `connection`)
-- VALUES
-- (1, '示例ModbusTCP数据源', 'b3ace9d4-b63b-419b-818f-0f6d1d0603a4', 'modbus-tcp', '{"host":"10.111.212.191", "port":502}'),
-- (2, '示例ModbusRTU数据源', 'b903f0af-9115-448c-9d46-8caf5f9995f3', 'modbus-tru', '{"host":"10.111.212.44", "port":502}'),
-- (3, '示例Bacnet/IP数据源', 'e2d5b30b-b554-4ebe-8ce7-f377ab380d19', 'bacnet-ip', '{"host":"10.111.212.200", "port":47808}'),
-- (4, '示例S7数据源', '9eb0d705-d02a-43f8-9c62-7e5ef508b255', 's7', '{"host":"10.111.212.202", "port":102, "rack": 0, "slot": 2}'),
-- (5, '示例ControlLogix数据源', 'd1dc9792-7861-4dd3-9b01-07511dae16c1', 'control-logix', '{"host":"10.111.212.203","port":44818,"processorslot":3}');
-- (6, '示例OPU UA数据源', '56e1c642-8032-495b-af2e-18a77ca75e0f', 'opc-ua', '{"url":"opc.tcp://10.111.212.5:49320/OPCUA/SimulationServer/"}');

-- COMMIT;


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_points`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_points` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_points` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(512) NOT NULL,
  `data_source_id` BIGINT NOT NULL,
  `object_type` VARCHAR(32) NOT NULL,
  `units` VARCHAR(32) NOT NULL,
  `hi_limit` DOUBLE NOT NULL,
  `low_limit` DOUBLE NOT NULL,
  `ratio` DOUBLE NULL,
  `is_trend` BOOL NOT NULL,
  `address` JSON NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_points_index_1` ON  `myems_space_db`.`tbl_points`   (`name`);
CREATE INDEX `tbl_points_index_2` ON  `myems_space_db`.`tbl_points`   (`data_source_id`);
CREATE INDEX `tbl_points_index_3` ON  `myems_space_db`.`tbl_points`   (`id`, `object_type`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_points`
-- ---------------------------------------------------------------------------------------------------------------------
-- List of Object Type
-- ENERGY_VALUE
-- ANALOG_VALUE
-- DIGITAL_VALUE

-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_points`
-- (`id`, `name`, `data_source_id`, `object_type`, `units`, `low_limit`, `hi_limit`, `ratio`, `is_trend`, `address`)
-- VALUES
-- (1, 'Active Energy Import Tariff 1', 1, 'ENERGY_VALUE', 'Wh', 0, 99999999999, null, true,
--   '{\"slave_id\":1, \"function_code\":3, \"offset\":801, \"number_of_registers\":4, \"format\":\"=d\"}'),

-- (2, 'Working hours counter', 1, 'ANALOG_VALUE',  'S', 0, 999999999, null, true,
--   '{\"slave_id\":1, \"function_code\":3, \"offset\":209, \"number_of_registers\":2, \"format\":\"=L\"}'),

-- (3, 'Current a', 1, 'ANALOG_VALUE',  'A', 0, 5, null, true,
--   '{\"slave_id\":1, \"function_code\":3, \"offset\":13, \"number_of_registers\":2, \"format\":\"=f\"}'),

-- (4, 'Active Power a', 1, 'ANALOG_VALUE',  'W', 0, 3450, null, true,
--   '{\"slave_id\":1, \"function_code\":3, \"offset\":25, \"number_of_registers\":2, \"format\":\"=f\"}'),

-- (5, 'Power Factor a', 1, 'ANALOG_VALUE',  'W', 0, 1, null, true,
--   '{\"slave_id\":1, \"function_code\":3, \"offset\":37, \"number_of_registers\":2, \"format\":\"=f\"}'),

-- (6, '示例数据点6', 2, 'ENERGY_VALUE',  'Wh', 0, 99999999999, null, true,
--   '{\"slave_id\":1, \"function_code\":3, \"offset\":40001, \"number_of_registers\":2, \"format\":\"=f\"}'),

-- (7, '示例数据点7', 2, 'ANALOG_VALUE',  'V', 0, 690, null, true,
--   '{\"slave_id\":1, \"function_code\":3, \"offset\":40002, \"number_of_registers\":2, \"format\":\"=f\"}'),

-- (8, 'BACnet示例数据点1', 3, 'ANALOG_VALUE',  'V', 0, 690, 1.2, true,
--   '{\"object_type\":\"analogValue\", \"object_id\":3004860, \"property_name\":\"presentValue\", \"property_array_index\":null}'),
-- BACnet Object Type
-- analogValue, analogInput, analogOutput, binaryValue, binaryInput, binaryOutput

-- (9, 'S7示例数据点1', 4, 'ANALOG_VALUE',  'kWh', 0, 99999999999, null, true,
--   '{\"area\":\"DB\", \"db_number\":700, \"start\":8, \"size\":4');

-- # S7 Area
-- 'PE', 'PA', 'MK', 'DB', 'CT', 'TM'

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_meters_points`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_meters_points` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_meters_points` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `meter_id` BIGINT NOT NULL,
  `point_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_meters_points`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_meters_points`
-- (`id`, `meter_id`, `point_id`)
-- VALUES (1, 1, 1);
-- COMMIT;


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_equipments_meters`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_equipments_meters` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_equipments_meters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `meter_id` BIGINT NOT NULL,
  `is_output` BOOL NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_equipments_meters`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_equipments_meters`
-- (`id`, `equipment_id`, `meter_id`, `is_output`)
-- VALUES
-- (1, 1, 1, false);

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_equipments_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_equipments_offline_meters` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_equipments_offline_meters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `offline_meter_id` BIGINT NOT NULL,
  `is_output` BOOL NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_equipments_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_equipments_offline_meters`
-- (`id`, `equipment_id`, `offline_meter_id`, `is_output`)
-- VALUES
-- (1, 1, 1, false);

-- COMMIT;


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_equipments_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_equipments_virtual_meters` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_equipments_virtual_meters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `virtual_meter_id` BIGINT NOT NULL,
  `is_output` BOOL NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_equipments_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_equipments_virtual_meters`
-- (`id`, `equipment_id`, `virtual_meter_id`, `is_output`)
-- VALUES
-- (1, 1, 1, false);

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_spaces_meters`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_spaces_meters` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_spaces_meters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `space_id` BIGINT NOT NULL,
  `meter_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_spaces_meters`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_spaces_meters`
-- (`id`, `space_id`, `meter_id`)
-- VALUES
-- (1, 1, 1);

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_spaces_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_spaces_offline_meters` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_spaces_offline_meters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `space_id` BIGINT NOT NULL,
  `offline_meter_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_spaces_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_spaces_offline_meters`
-- (`id`, `space_id`, `offline_meter_id`)
-- VALUES
-- (1, 1, 1);

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_spaes_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_spaes_virtual_meters` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_spaes_virtual_meters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `space_id` BIGINT NOT NULL,
  `virtual_meter_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_spaes_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_spaes_virtual_meters`
-- (`id`, `space_id`, `virtual_meter_id`)
-- VALUES
-- (1, 1, 1);

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_equipments_parameters`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_equipments_parameters` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_equipments_parameters` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `energy_category_id` BIGINT NOT NULL,
  -- suspended status threshold
  `suspended` DOUBLE NOT NULL,
  -- idling status threshold
  `idling` DOUBLE NOT NULL,
  -- running status threshold
  `running` DOUBLE NOT NULL,
  -- normal energy consumption threshold on non-working day
  `repair` DOUBLE NOT NULL,
  -- warning percentage threshold of energy consumption on non-working day
  -- to energy consumption on avegrage working day
  `warning` DOUBLE NOT NULL,
   -- maintenance energy consumption threshold on non-working day,
   -- this value does not include normal energy consumption
  `maintenance` DOUBLE NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_equipments_parameters_index_1` ON  `myems_space_db`.`tbl_equipments_parameters`   (`equipment_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_chillers`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_chillers` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_chillers` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `nominal_cooling_capacity` DOUBLE  NULL,
  `nominal_cooling_input_power` DOUBLE  NULL,
  `nominal_cooling_cop` DOUBLE  NULL,
  `nominal_cooling_operating_current` DOUBLE  NULL,
  `rated_input_power` DOUBLE  NULL,
  `rated_current` DOUBLE  NULL,
  `nominal_chilled_water_flow_rate` DOUBLE  NULL,
  `nominal_cooling_water_flow_rate` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `inlet_chilled_water_temperature_point_id` BIGINT  NULL,
  `outlet_chilled_water_temperature_point_id` BIGINT  NULL,
  `chilled_water_instantaneous_flow_rate_point_id` BIGINT  NULL,
  `instantaneous_power_point_id` BIGINT  NULL,
  `cumulative_power_meter_uuid` CHAR(36)   NULL,
  `cumulative_cooling_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_chillers_index_1` ON  `myems_space_db`.`tbl_chillers`   (`equipment_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_cooling_towers`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_cooling_towers` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_cooling_towers` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `rated_input_power` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `instantaneous_power_point_id` BIGINT  NULL,
  `cooling_water_inlet_temperature_point_id` BIGINT  NULL,
  `cooling_water_outlet_temperature_point_id` BIGINT  NULL,
  `fan_speed_point_id` BIGINT  NULL,
  `pump_speed_point_id` BIGINT  NULL,
  `dry_bulb_temperature_point_id` BIGINT  NULL,
  `wet_bulb_temperature_point_id` BIGINT  NULL,
  `air_humidity_point_id` BIGINT  NULL,
  `cooling_water_instantaneous_flow_rate_point_id` BIGINT  NULL,
  `cooling_water_pressure_point_id` BIGINT  NULL,
  `cooling_water_conductivity_point_id` BIGINT  NULL,
  `cooling_water_ph_value_point_id` BIGINT  NULL,
  `cooling_water_tribidity_point_id` BIGINT  NULL,
  `cumulative_heat_transfer_meter_uuid` CHAR(36)   NULL,
  `cumulative_power_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_cooling_towers_index_1` ON  `myems_space_db`.`tbl_cooling_towers`   (`equipment_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_chilled_water_pumps`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_chilled_water_pumps` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_chilled_water_pumps` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `rated_input_power` DOUBLE  NULL,
  `rated_head` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `instantaneous_power_point_id` BIGINT  NULL,
  `electric_motor_speed_point_id` BIGINT  NULL,
  `chilled_water_instantaneous_flow_rate_point_id` BIGINT  NULL,
  `cumulative_chilled_water_flow_meter_uuid` CHAR(36)   NULL,
  `cumulative_power_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_chilled_water_pumps_index_1` ON  `myems_space_db`.`tbl_chilled_water_pumps`   (`equipment_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_cooling_water_pumps`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_cooling_water_pumps` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_cooling_water_pumps` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `rated_input_power` DOUBLE  NULL,
  `rated_head` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `instantaneous_power_point_id` BIGINT  NULL,
  `electric_motor_speed_point_id` BIGINT  NULL,
  `cooling_water_instantaneous_flow_rate_point_id` BIGINT  NULL,
  `cumulative_cooling_water_flow_meter_uuid` CHAR(36)   NULL,
  `cumulative_power_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_cooling_water_pumps_index_1` ON  `myems_space_db`.`tbl_cooling_water_pumps`   (`equipment_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_air_handling_units`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_air_handling_units` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_air_handling_units` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `rated_input_power` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `supply_air_tempreture_point_id` BIGINT  NULL,
  `supply_air_humunidity_point_id` BIGINT  NULL,
  `supply_air_flow_rate_point_id` BIGINT  NULL,
  `supply_air_static_pressure_point_id` BIGINT  NULL,
  `supply_air_valve_position_point_id` BIGINT  NULL,
  `supply_air_fan_frenquency_point_id` BIGINT  NULL,
  `outside_air_tempreture_point_id` BIGINT  NULL,
  `outside_air_humunidity_point_id` BIGINT  NULL,
  `outside_air_flow_rate_point_id` BIGINT  NULL,
  `outside_air_valve_position_point_id` BIGINT  NULL,
  `outside_air_fan_frenquency_point_id` BIGINT  NULL,
  `outside_air_primary_effect_filter_status_point_id` BIGINT NULL,
  `outside_air_medium_effect_filter_status_point_id` BIGINT NULL,
  `return_air_tempreture_point_id` BIGINT  NULL,
  `return_air_humunidity_point_id` BIGINT  NULL,
  `return_air_flow_rate_point_id` BIGINT  NULL,
  `return_air_co2_density_point_id` BIGINT  NULL,
  `return_air_valve_position_point_id` BIGINT  NULL,
  `return_air_fan_frenquency_point_id` BIGINT  NULL,
  `return_air_filter_status_point_id` BIGINT NULL,
  `exhaust_air_tempreture_point_id` BIGINT  NULL,
  `exhaust_air_humunidity_point_id` BIGINT  NULL,
  `exhaust_air_flow_rate_point_id` BIGINT  NULL,
  `exhaust_air_co2_density_point_id` BIGINT  NULL,
  `exhaust_air_valve_position_point_id` BIGINT  NULL,
  `exhaust_air_fan_frenquency_point_id` BIGINT  NULL,
  `air_mixer_valve_position_point_id` BIGINT  NULL,
  `bypass_valve_position_point_id` BIGINT  NULL,
  `heat_recovery_status_point_id` BIGINT NULL,
  `heat_recovery_fan_frenquency_point_id` BIGINT NULL,
  `water_coil_pump_status_point_id` BIGINT  NULL,
  `water_coil_valve_position_point_id` BIGINT  NULL,
  `water_coil_supply_tempreture_point_id` BIGINT  NULL,
  `water_coil_return_tempreture_point_id` BIGINT  NULL,
  `hot_water_coil_pump_status_point_id` BIGINT  NULL,
  `hot_water_coil_valve_position_point_id` BIGINT  NULL,
  `hot_water_coil_supply_tempreture_point_id` BIGINT  NULL,
  `hot_water_coil_return_tempreture_point_id` BIGINT  NULL,
  `cold_water_coil_pump_status_point_id` BIGINT  NULL,
  `cold_water_coil_valve_position_point_id` BIGINT  NULL,
  `cold_water_coil_supply_tempreture_point_id` BIGINT  NULL,
  `cold_water_coil_return_tempreture_point_id` BIGINT  NULL,
  `electic_heating_status_point_id` BIGINT NULL,
  `cumulative_power_meter_uuid` CHAR(36)   NULL,
  `cumulative_heating_meter_uuid` CHAR(36)   NULL,
  `cumulative_cooling_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_air_handling_units_index_1` ON  `myems_space_db`.`tbl_air_handling_units`   (`equipment_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_air_compressors`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_air_compressors` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_air_compressors` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `rated_input_power` DOUBLE  NULL,
  `rated_volume_flow` DOUBLE  NULL,
  `rated_outlet_pressure` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `inlet_absolute_pressure_point_id` BIGINT NULL,
  `outlet_absolute_pressure_point_id` BIGINT NULL,
  `inlet_air_temperature_point_id` BIGINT NULL,
  `instantaneous_volume_flow_point_id` BIGINT  NULL,
  `instantaneous_input_power_point_id` BIGINT  NULL,
  `cumulative_power_meter_uuid` CHAR(36)   NULL,
  `cumulative_air_flow_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_air_compressors_index_1` ON  `myems_space_db`.`tbl_air_compressors`   (`equipment_id`);


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_steam_boilers`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_steam_boilers` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_steam_boilers` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `rated_input_power` DOUBLE  NULL,
  `rated_evaporation_rate` DOUBLE  NULL,
  `rated_steam_pressure` DOUBLE  NULL,
  `rated_steam_temperature` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `supply_water_temperature_point_id` BIGINT  NULL,
  `water_level_point_id` BIGINT  NULL,
  `water_flow_rate_point_id` BIGINT  NULL,
  `flue_gas_temperature_point_id` BIGINT  NULL,
  `flue_gas_co_concentration_point_id` BIGINT  NULL,
  `steam_temperature_point_id` BIGINT  NULL,
  `steam_pressure_point_id` BIGINT  NULL,
  `instantaneous_steam_flow_rate_point_id` BIGINT  NULL,
  `cumulative_steam_flow_meter_uuid` CHAR(36)   NULL,
  `instantaneous_natural_gas_flow_rate_point_id` BIGINT  NULL,
  `cumulative_natural_gas_flow_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_steam_boilers_index_1` ON  `myems_space_db`.`tbl_steam_boilers`   (`equipment_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_water_boilers`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_water_boilers` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_water_boilers` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `rated_input_power` DOUBLE  NULL,
  `rated_supply_water_temperature` DOUBLE  NULL,
  `rated_return_water_temperature` DOUBLE  NULL,
  `rated_supply_water_pressure` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `supply_water_temperature_point_id` BIGINT  NULL,
  `return_water_temperature_point_id` BIGINT  NULL,
  `instantaneous_water_flow_rate_point_id` BIGINT  NULL,
  `cumulative_water_flow_meter_uuid` CHAR(36)   NULL,
  `flue_gas_temperature_point_id` BIGINT  NULL,
  `flue_gas_co_concentration_point_id` BIGINT  NULL,
  `instantaneous_natural_gas_flow_rate_point_id` BIGINT  NULL,
  `cumulative_natural_gas_flow_meter_uuid` CHAR(36)   NULL,
  `cumulative_heating_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_water_boilers_index_1` ON  `myems_space_db`.`tbl_water_boilers`   (`equipment_id`);
-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_heat_pumps`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_heat_pumps` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_heat_pumps` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `nominal_cooling_capacity` DOUBLE  NULL,
  `nominal_cooling_input_power` DOUBLE  NULL,
  `nominal_cooling_cop` DOUBLE  NULL,
  `nominal_cooling_operating_current` DOUBLE  NULL,
  `nominal_heating_capacity` DOUBLE  NULL,
  `nominal_heating_input_power` DOUBLE  NULL,
  `nominal_heating_cop` DOUBLE  NULL,
  `nominal_heating_operating_current` DOUBLE  NULL,
  `rated_input_power` DOUBLE  NULL,
  `rated_current` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `setting_temperature_point_id` BIGINT  NULL,
  `inlet_water_temperature_point_id` BIGINT  NULL,
  `outlet_water_temperature_point_id` BIGINT  NULL,
  `instantaneous_power_point_id` BIGINT  NULL,
  `cumulative_power_meter_uuid` CHAR(36)   NULL,
  `cumulative_heating_meter_uuid` CHAR(36)   NULL,
  `cumulative_cooling_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_heat_pumps_index_1` ON  `myems_space_db`.`tbl_heat_pumps`   (`equipment_id`);


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_ground_source_heat_pumps`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_ground_source_heat_pumps` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_ground_source_heat_pumps` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `nominal_cooling_capacity` DOUBLE  NULL,
  `nominal_cooling_input_power` DOUBLE  NULL,
  `nominal_cooling_cop` DOUBLE  NULL,
  `nominal_cooling_operating_current` DOUBLE  NULL,
  `nominal_heating_capacity` DOUBLE  NULL,
  `nominal_heating_input_power` DOUBLE  NULL,
  `nominal_heating_cop` DOUBLE  NULL,
  `nominal_heating_operating_current` DOUBLE  NULL,
  `rated_input_power` DOUBLE  NULL,
  `rated_current` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `heating_cooling_mode_point_id` BIGINT  NULL,
  `ruuning_hours_point_id` BIGINT  NULL,
  `evaporator_water_supply_temperature_point_id` BIGINT  NULL,
  `evaporator_water_return_temperature_point_id` BIGINT  NULL,
  `condensor_water_supply_temperature_point_id` BIGINT  NULL,
  `condensor_water_return_temperature_point_id` BIGINT  NULL,
  `cumulative_power_meter_uuid` CHAR(36)   NULL,
  `cumulative_heating_meter_uuid` CHAR(36)   NULL,
  `cumulative_cooling_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_ground_source_heat_pumps_index_1` ON  `myems_space_db`.`tbl_ground_source_heat_pumps`   (`equipment_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_high_temperature_heat_pumps`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_high_temperature_heat_pumps` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_high_temperature_heat_pumps` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `nominal_heating_capacity` DOUBLE  NULL,
  `nominal_heating_input_power` DOUBLE  NULL,
  `nominal_heating_cop` DOUBLE  NULL,
  `nominal_heating_operating_current` DOUBLE  NULL,
  `rated_input_power` DOUBLE  NULL,
  `rated_current` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `ruuning_hours_point_id` BIGINT  NULL,
  `evaporator_water_supply_temperature_point_id` BIGINT  NULL,
  `evaporator_water_return_temperature_point_id` BIGINT  NULL,
  `condensor_water_supply_temperature_point_id` BIGINT  NULL,
  `condensor_water_return_temperature_point_id` BIGINT  NULL,
  `cumulative_power_meter_uuid` CHAR(36)   NULL,
  `cumulative_heating_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_high_temperature_heat_pumps_index_1` ON  `myems_space_db`.`tbl_high_temperature_heat_pumps`   (`equipment_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_process_heat_pumps`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_process_heat_pumps` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_process_heat_pumps` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `equipment_id` BIGINT NOT NULL,
  `model_number` VARCHAR(128)  NULL,
  `nominal_cooling_capacity` DOUBLE  NULL,
  `nominal_cooling_input_power` DOUBLE  NULL,
  `nominal_cooling_cop` DOUBLE  NULL,
  `nominal_cooling_operating_current` DOUBLE  NULL,
  `rated_input_power` DOUBLE  NULL,
  `rated_current` DOUBLE  NULL,
  `status_point_id` BIGINT  NULL,
  `ruuning_hours_point_id` BIGINT  NULL,
  `chilled_water_supply_temperature_point_id` BIGINT  NULL,
  `chilled_water_return_temperature_point_id` BIGINT  NULL,
  `cooling_water_supply_temperature_point_id` BIGINT  NULL,
  `cooling_water_return_temperature_point_id` BIGINT  NULL,
  `cumulative_power_meter_uuid` CHAR(36)   NULL,
  `cumulative_cooling_meter_uuid` CHAR(36)   NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_process_heat_pumps_index_1` ON  `myems_space_db`.`tbl_process_heat_pumps`   (`equipment_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_factories_weather_points`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_spaces_weather_points` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_spaces_weather_points` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `space_id` BIGINT NOT NULL,
  `point_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_factories_weather_points_index_1` ON  `myems_space_db`.`tbl_spaces_weather_points`   (`space_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_spaces_weather_points`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;

-- INSERT INTO `myems_space_db`.`tbl_spaces_weather_points`
-- (`id`, space_id`, `point_id`)
-- VALUES
-- (1, 3, 2000001),
-- (2, 3, 2000002),
-- (3, 3, 2000003),
-- (4, 3, 2000006);

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_tariffs`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_tariffs` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_tariffs` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NOT NULL,
  `uuid` CHAR(36) NOT NULL,
  `energy_category_id` BIGINT NOT NULL,
  `tariff_type` VARCHAR(45) NOT NULL COMMENT 'Tariff Type: timeofuse - Time of Use Pricing分时费率（单一费率按平设置）\nblock - Block Pricing 分量阶梯费率\n',
  `unit_of_price` VARCHAR(45) NOT NULL,
  `valid_from_datetime_utc` DATETIME NOT NULL,
  `valid_through_datetime_utc` DATETIME NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_tariffs_parameters_index_1` ON  `myems_space_db`.`tbl_tariffs`   (`name`);
CREATE INDEX `tbl_tariffs_parameters_index_2` ON  `myems_space_db`.`tbl_tariffs`   (`energy_category_id`, `valid_from_datetime_utc`,  `valid_through_datetime_utc`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_tariffs`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_space_db`;

INSERT INTO `myems_space_db`.`tbl_tariffs`
(`id`, `name`, `uuid`, `energy_category_id`, `tariff_type`, `unit_of_price`, `valid_from_datetime_utc`, `valid_through_datetime_utc`)
VALUES
(1, '2020分时电价1-6',    '590efb36-8587-42a9-ae6f-c715d21496d6', 1, 'timeofuse', '元/千瓦时', '2019-12-31 16:00:00', '2020-06-30 15:59:59'),
(2, '2020分时电价7-9',    'f5966640-18fc-437a-9efd-cbc0c58b6373', 1, 'timeofuse', '元/千瓦时', '2020-06-30 16:00:00', '2020-09-30 15:59:59'),
(3, '2020分时电价10-12',  '21727a1b-4b27-4186-b72e-db46e6e2d980', 1, 'timeofuse', '元/千瓦时', '2020-09-30 16:00:00', '2020-12-31 15:59:59'),
(4, '2021分时电价1-6',    'fe65e443-0ec2-4a16-823e-2365885e2598', 1, 'timeofuse', '元/千瓦时', '2020-12-31 16:00:00', '2021-06-30 15:59:59'),
(5, '2021分时电价7-9',    'd1285c81-4612-4d7c-9436-ed11b4e7abe4', 1, 'timeofuse', '元/千瓦时', '2021-06-30 16:00:00', '2021-09-30 15:59:59'),
(6, '2021分时电价10-12',  'e6c275b4-47eb-4f5d-bc59-edbe45c2a407', 1, 'timeofuse', '元/千瓦时', '2021-09-30 16:00:00', '2021-12-31 15:59:59'),
(7, '2022分时电价1-6',    'ca359f72-48ad-46a7-82af-cecbe98450e8', 1, 'timeofuse', '元/千瓦时', '2021-12-31 16:00:00', '2022-06-30 15:59:59'),
(8, '2022分时电价7-9',    '9fdda603-0f8f-4452-ad59-c5df54bc35f4', 1, 'timeofuse', '元/千瓦时', '2022-06-30 16:00:00', '2022-09-30 15:59:59'),
(9, '2022分时电价10-12',  'fb0442e7-4d44-4bfd-8b20-cad3f77a2480', 1, 'timeofuse', '元/千瓦时', '2022-09-30 16:00:00', '2022-12-31 15:59:59'),
(10, '2023分时电价1-6',   '3fa6e1f2-7d08-4f5a-bcbf-beb041d569c0', 1, 'timeofuse', '元/千瓦时', '2022-12-31 16:00:00', '2023-06-30 15:59:59'),
(11, '2023分时电价7-9',   '787240fb-1694-403e-a0a7-83d7be1cc0b8', 1, 'timeofuse', '元/千瓦时', '2023-06-30 16:00:00', '2023-09-30 15:59:59'),
(12, '2023分时电价10-12', 'a07fdf76-edcf-4124-96e7-ab733a5a4b70', 1, 'timeofuse', '元/千瓦时', '2023-09-30 16:00:00', '2023-12-31 15:59:59'),
(13, '自来水',  '6fcbc77e-effb-4d43-9b30-77b062435d34', 2, 'timeofuse', '元/m³',    '2019-12-31 16:00:00', '2023-12-31 15:59:59'),
(14, '天然气', '6a4c56ff-b3e1-4555-9b1c-87d05bcfa4d9', 3, 'timeofuse', '元/m³',    '2019-12-31 16:00:00', '2023-12-31 15:59:59'),
(15, '分量阶梯电价', 'd1b81d2f-d387-43d3-affd-d796b7236b60', 1, 'block',     '元/千瓦时', '2019-12-31 16:00:00', '2023-12-31 15:59:59');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_tariffs_timeofuses`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_tariffs_timeofuses` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_tariffs_timeofuses` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tariff_id` BIGINT NOT NULL,
  `start_time_of_day` TIME NOT NULL,
  `end_time_of_day` TIME NOT NULL,
  `peak_type` VARCHAR(8) NOT NULL COMMENT 'Peak Type: \ntoppeak - Top Peak尖\nonpeak - On Peak峰\nmidpeak - Middle Peak平\noffpeak - Off Peak谷',
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_tariffs_timeofuses_index_1` ON  `myems_space_db`.`tbl_tariffs_timeofuses`   (`tariff_id`, `start_time_of_day`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_tariffs_timeofuses`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_space_db`;

INSERT INTO `myems_space_db`.`tbl_tariffs_timeofuses`
(`id`, `tariff_id`, `start_time_of_day`, `end_time_of_day`, `peak_type`, `price`)
VALUES
-- '2020分时电价1-6'
(1,  1, '00:00:00', '05:59:59', 'offpeak', 0.345),
(2,  1, '06:00:00', '07:59:59', 'midpeak', 0.708),
(3,  1, '08:00:00', '10:59:59', 'onpeak', 1.159),
(4,  1, '11:00:00', '17:59:59', 'midpeak', 0.708),
(5,  1, '18:00:00', '20:59:59', 'onpeak', 1.159),
(6,  1, '21:00:00', '21:59:59', 'midpeak', 0.708),
(7,  1, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2020分时电价7-9'
(8,  2, '00:00:00', '05:59:59', 'offpeak', 0.345),
(9,  2, '06:00:00', '07:59:59', 'midpeak', 0.708),
(10, 2, '08:00:00', '10:59:59', 'offpeak', 1.159),
(11, 2, '11:00:00', '12:59:59', 'midpeak', 0.708),
(12, 2, '13:00:00', '14:59:59', 'onpeak', 1.159),
(13, 2, '15:00:00', '17:59:59', 'midpeak', 0.708),
(14, 2, '18:00:00', '20:59:59', 'onpeak', 1.159),
(15, 2, '21:00:00', '21:59:59', 'midpeak', 0.708),
(16, 2, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2020分时电价10-12'
(17, 3, '00:00:00', '05:59:59', 'offpeak', 0.345),
(18, 3, '06:00:00', '07:59:59', 'midpeak', 0.708),
(19, 3, '08:00:00', '10:59:59', 'onpeak', 1.159),
(20, 3, '11:00:00', '17:59:59', 'midpeak', 0.708),
(21, 3, '18:00:00', '20:59:59', 'onpeak', 1.159),
(22, 3, '21:00:00', '21:59:59', 'midpeak', 0.708),
(23, 3, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2021分时电价1-6'
(24, 4, '00:00:00', '05:59:59', 'offpeak', 0.345),
(25, 4, '06:00:00', '07:59:59', 'midpeak', 0.708),
(26, 4, '08:00:00', '10:59:59', 'onpeak', 1.159),
(27, 4, '11:00:00', '17:59:59', 'midpeak', 0.708),
(28, 4, '18:00:00', '20:59:59', 'onpeak', 1.159),
(29, 4, '21:00:00', '21:59:59', 'midpeak', 0.708),
(30, 4, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2021分时电价7-9'
(31, 5, '00:00:00', '05:59:59', 'offpeak', 0.345),
(32, 5, '06:00:00', '07:59:59', 'midpeak', 0.708),
(33, 5, '08:00:00', '10:59:59', 'offpeak', 1.159),
(34, 5, '11:00:00', '12:59:59', 'midpeak', 0.708),
(35, 5, '13:00:00', '14:59:59', 'onpeak', 1.159),
(36, 5, '15:00:00', '17:59:59', 'midpeak', 0.708),
(37, 5, '18:00:00', '20:59:59', 'onpeak', 1.159),
(38, 5, '21:00:00', '21:59:59', 'midpeak', 0.708),
(39, 5, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2021分时电价10-12'
(40, 6, '00:00:00', '05:59:59', 'offpeak', 0.345),
(41, 6, '06:00:00', '07:59:59', 'midpeak', 0.708),
(42, 6, '08:00:00', '10:59:59', 'onpeak', 1.159),
(43, 6, '11:00:00', '17:59:59', 'midpeak', 0.708),
(44, 6, '18:00:00', '20:59:59', 'onpeak', 1.159),
(45, 6, '21:00:00', '21:59:59', 'midpeak', 0.708),
(46, 6, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2022分时电价1-6'
(47, 7, '00:00:00', '05:59:59', 'offpeak', 0.345),
(48, 7, '06:00:00', '07:59:59', 'midpeak', 0.708),
(49, 7, '08:00:00', '10:59:59', 'onpeak', 1.159),
(50, 7, '11:00:00', '17:59:59', 'midpeak', 0.708),
(51, 7, '18:00:00', '20:59:59', 'onpeak', 1.159),
(52, 7, '21:00:00', '21:59:59', 'midpeak', 0.708),
(53, 7, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2022分时电价7-9'
(54, 8, '00:00:00', '05:59:59', 'offpeak', 0.345),
(55, 8, '06:00:00', '07:59:59', 'midpeak', 0.708),
(56, 8, '08:00:00', '10:59:59', 'offpeak', 1.159),
(57, 8, '11:00:00', '12:59:59', 'midpeak', 0.708),
(58, 8, '13:00:00', '14:59:59', 'onpeak', 1.159),
(59, 8, '15:00:00', '17:59:59', 'midpeak', 0.708),
(60, 8, '18:00:00', '20:59:59', 'onpeak', 1.159),
(61, 8, '21:00:00', '21:59:59', 'midpeak', 0.708),
(62, 8, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2022分时电价10-12'
(63, 9, '00:00:00', '05:59:59', 'offpeak', 0.345),
(64, 9, '06:00:00', '07:59:59', 'midpeak', 0.708),
(65, 9, '08:00:00', '10:59:59', 'onpeak', 1.159),
(66, 9, '11:00:00', '17:59:59', 'midpeak', 0.708),
(67, 9, '18:00:00', '20:59:59', 'onpeak', 1.159),
(68, 9, '21:00:00', '21:59:59', 'midpeak', 0.708),
(69, 9, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2023分时电价1-6'
(70, 10, '00:00:00', '05:59:59', 'offpeak', 0.345),
(71, 10, '06:00:00', '07:59:59', 'midpeak', 0.708),
(72, 10, '08:00:00', '10:59:59', 'onpeak', 1.159),
(73, 10, '11:00:00', '17:59:59', 'midpeak', 0.708),
(74, 10, '18:00:00', '20:59:59', 'onpeak', 1.159),
(75, 10, '21:00:00', '21:59:59', 'midpeak', 0.708),
(76, 10, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2023分时电价7-9'
(77, 11, '00:00:00', '05:59:59', 'offpeak', 0.345),
(78, 11, '06:00:00', '07:59:59', 'midpeak', 0.708),
(79, 11, '08:00:00', '10:59:59', 'offpeak', 1.159),
(80, 11, '11:00:00', '12:59:59', 'midpeak', 0.708),
(81, 11, '13:00:00', '14:59:59', 'onpeak', 1.159),
(82, 11, '15:00:00', '17:59:59', 'midpeak', 0.708),
(83, 11, '18:00:00', '20:59:59', 'onpeak', 1.159),
(84, 11, '21:00:00', '21:59:59', 'midpeak', 0.708),
(85, 11, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2023分时电价10-12'
(86, 12, '00:00:00', '05:59:59', 'offpeak', 0.345),
(87, 12, '06:00:00', '07:59:59', 'midpeak', 0.708),
(88, 12, '08:00:00', '10:59:59', 'onpeak', 1.159),
(89, 12, '11:00:00', '17:59:59', 'midpeak', 0.708),
(90, 12, '18:00:00', '20:59:59', 'onpeak', 1.159),
(91, 12, '21:00:00', '21:59:59', 'midpeak', 0.708),
(92, 12, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '自来水'
-- 'Water'
(93, 13, '00:00:00', '23:59:59', 'midpeak', 5.95),
-- '天然气'
-- 'Natual Gas'
(94, 14, '00:00:00', '23:59:59', 'midpeak', 3.50);
COMMIT;


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_tariffs_blocks`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_tariffs_blocks` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_tariffs_blocks` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `tariff_id` BIGINT NOT NULL,
  `start_amount` DOUBLE NOT NULL,
  `end_amount` DOUBLE NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`id`));
CREATE INDEX `tbl_tariffs_blocks_index_1` ON  `myems_space_db`.`tbl_tariffs_blocks`   (`tariff_id`, `start_amount`);

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_tariffs_blocks`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_space_db`;

INSERT INTO `myems_space_db`.`tbl_tariffs_blocks`
(`id`, `tariff_id`, `start_amount`, `end_amount`, `price`)
VALUES
-- '分量阶梯电价'
-- 'Block tariff of electrical'
(1, 15, 0, 10000, 0.345),
(2, 15, 10000, 30000, 0.456),
(3, 15, 30000, 100000, 0.567),
(4, 15, 100000, 1000000000, 0.678);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_cost_centers_tariffs`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_cost_centers_tariffs` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_cost_centers_tariffs` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cost_center_id` BIGINT NOT NULL,
  `tariff_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Example Data for table `myems_space_db`.`tbl_cost_centers_tariffs`
-- ---------------------------------------------------------------------------------------------------------------------
-- START TRANSACTION;
-- USE `myems_space_db`;
-- INSERT INTO `myems_space_db`.`tbl_cost_centers_tariffs`
-- (`id`, `cost_center_id`, `tariff_id`)
-- VALUES
-- (1, 1, 1),
-- (2, 1, 2),
-- (3, 1, 3);

-- COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_help_files`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_help_files` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_help_files` (
`id` BIGINT NOT NULL AUTO_INCREMENT,
`file_name` VARCHAR(255) NOT NULL,
`uuid` CHAR(36) NOT NULL,
`upload_datetime_utc` DATETIME NOT NULL,
`user_uuid` CHAR(36) NOT NULL,
`file_object` LONGBLOB NOT NULL,
PRIMARY KEY (`id`));
CREATE INDEX `tbl_help_files_index_1` ON  `myems_space_db`.`tbl_help_files`   (`file_name`);
CREATE INDEX `tbl_help_files_index_2` ON  `myems_space_db`.`tbl_help_files`   (`upload_datetime_utc`);


-- ---------------------------------------------------------------------------------------------------------------------
-- Table `myems_space_db`.`tbl_timezones`
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS `myems_space_db`.`tbl_timezones` ;

CREATE TABLE IF NOT EXISTS `myems_space_db`.`tbl_timezones` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `description` VARCHAR(64) NOT NULL,
  `utc_offset` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`));

-- ---------------------------------------------------------------------------------------------------------------------
-- Data for table `myems_space_db`.`tbl_timezones`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_space_db`;

INSERT INTO `myems_space_db`.`tbl_timezones`
(`id`, `name`, `description`, `utc_offset`)
VALUES
(1, 'Dateline Standard Time', '(GMT-12:00) International Date Line West', '-12:00'),
(2, 'Samoa Standard Time', '(GMT-11:00) Midway Island, Samoa', '-11:00'),
(3, 'Hawaiian Standard Time', '(GMT-10:00) Hawaii', '-10:00'),
(4, 'Alaskan Standard Time', '(GMT-09:00) Alaska', '-09:00'),
(5, 'Pacific Standard Time', '(GMT-08:00) Pacific Time (US and Canada) Tijuana', '-08:00'),
(6, 'Mountain Standard Time', '(GMT-07:00) Mountain Time (US and Canada)', '-07:00'),
(7, 'Mexico Standard Time 2', '(GMT-07:00) Chihuahua, La Paz, Mazatlan', '-07:00'),
(8, 'U.S. Mountain Standard Time', '(GMT-07:00) Arizona', '-07:00'),
(9, 'Central Standard Time', '(GMT-06:00) Central Time (US and Canada)', '-06:00'),
(10, 'Canada Central Standard Time', '(GMT-06:00) Saskatchewan', '-06:00'),
(11, 'Mexico Standard Time', '(GMT-06:00) Guadalajara, Mexico City, Monterrey', '-06:00'),
(12, 'Central America Standard Time', '(GMT-06:00) Central America', '-06:00'),
(13, 'Eastern Standard Time', '(GMT-05:00) Eastern Time (US and Canada)', '-05:00'),
(14, 'U.S. Eastern Standard Time', '(GMT-05:00) Indiana (East)', '-05:00'),
(15, 'S.A. Pacific Standard Time', '(GMT-05:00) Bogota, Lima, Quito', '-05:00'),
(16, 'Atlantic Standard Time', '(GMT-04:00) Atlantic Time (Canada)', '-04:00'),
(17, 'S.A. Western Standard Time', '(GMT-04:00) Georgetown, La Paz, San Juan', '-04:00'),
(18, 'Pacific S.A. Standard Time', '(GMT-04:00) Santiago', '-04:00'),
(19, 'Newfoundland and Labrador Standard Time', '(GMT-03:30) Newfoundland', '-03:30'),
(20, 'E. South America Standard Time', '(GMT-03:00) Brasilia', '-03:00'),
(21, 'S.A. Eastern Standard Time', '(GMT-03:00) Georgetown', '-03:00'),
(22, 'Greenland Standard Time', '(GMT-03:00) Greenland', '-03:00'),
(23, 'Mid-Atlantic Standard Time', '(GMT-02:00) Mid-Atlantic', '-02:00'),
(24, 'Azores Standard Time', '(GMT-01:00) Azores', '-01:00'),
(25, 'Cape Verde Standard Time', '(GMT-01:00) Cape Verde Islands', '-01:00'),
(26, 'GMT Standard Time', '(GMT) Greenwich Mean Time: Dublin, Edinburgh, Lisbon, London', '+00:00'),
(27, 'Greenwich Standard Time', '(GMT) Monrovia, Reykjavik', '+00:00'),
(28, 'Central Europe Standard Time', '(GMT+01:00) Belgrade, Bratislava, Budapest, Ljubljana, Prague', '+01:00'),
(29, 'Central European Standard Time', '(GMT+01:00) Sarajevo, Skopje, Warsaw, Zagreb', '+01:00'),
(30, 'Romance Standard Time', '(GMT+01:00) Brussels, Copenhagen, Madrid, Paris', '+01:00'),
(31, 'W. Europe Standard Time', '(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna', '+01:00'),
(32, 'W. Central Africa Standard Time', '(GMT+01:00) West Central Africa', '+01:00'),
(33, 'E. Europe Standard Time', '(GMT+02:00) Minsk', '+02:00'),
(34, 'Egypt Standard Time', '(GMT+02:00) Cairo', '+02:00'),
(35, 'FLE Standard Time', '(GMT+02:00) Helsinki, Kiev, Riga, Sofia, Tallinn, Vilnius', '+02:00'),
(36, 'GTB Standard Time', '(GMT+02:00) Athens, Bucharest, Istanbul', '+02:00'),
(37, 'Israel Standard Time', '(GMT+02:00) Jerusalem', '+02:00'),
(38, 'South Africa Standard Time', '(GMT+02:00) Harare, Pretoria', '+02:00'),
(39, 'Russian Standard Time', '(GMT+03:00) Moscow, St. Petersburg, Volgograd', '+03:00'),
(40, 'Arab Standard Time', '(GMT+03:00) Kuwait, Riyadh', '+03:00'),
(41, 'E. Africa Standard Time', '(GMT+03:00) Nairobi', '+03:00'),
(42, 'Arabic Standard Time', '(GMT+03:00) Baghdad', '+03:00'),
(43, 'Iran Standard Time', '(GMT+03:30) Tehran', '+03:30'),
(44, 'Arabian Standard Time', '(GMT+04:00) Abu Dhabi, Muscat', '+04:00'),
(45, 'Caucasus Standard Time', '(GMT+04:00) Baku, Tbilisi, Yerevan', '+04:00'),
(46, 'Transitional Islamic State of Afghanistan Standard Time', '(GMT+04:30) Kabul', '+04:30'),
(47, 'Ekaterinburg Standard Time', '(GMT+05:00) Ekaterinburg', '+05:00'),
(48, 'West Asia Standard Time', '(GMT+05:00) Tashkent', '+05:00'),
(49, 'India Standard Time', '(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi', '+05:30'),
(50, 'Central Asia Standard Time', '(GMT+06:00) Astana, Dhaka', '+06:00'),
(51, 'Sri Lanka Standard Time', '(GMT+06:00) Sri Jayawardenepura', '+06:00'),
(52, 'N. Central Asia Standard Time', '(GMT+06:00) Almaty, Novosibirsk', '+06:00'),
(53, 'Myanmar Standard Time', '(GMT+06:30) Yangon (Rangoon)', '+06:30'),
(54, 'S.E. Asia Standard Time', '(GMT+07:00) Bangkok, Hanoi, Jakarta', '+07:00'),
(55, 'North Asia Standard Time', '(GMT+07:00) Krasnoyarsk', '+07:00'),
(56, 'China Standard Time', '(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi', '+08:00'),
(57, 'Singapore Standard Time', '(GMT+08:00) Kuala Lumpur, Singapore', '+08:00'),
(58, 'Taipei Standard Time', '(GMT+08:00) Taipei', '+08:00'),
(59, 'W. Australia Standard Time', '(GMT+08:00) Perth', '+08:00'),
(60, 'North Asia East Standard Time', '(GMT+08:00) Irkutsk, Ulaanbaatar', '+08:00'),
(61, 'Korea Standard Time', '(GMT+09:00) Seoul', '+09:00'),
(62, 'Tokyo Standard Time', '(GMT+09:00) Osaka, Sapporo, Tokyo', '+09:00'),
(63, 'Yakutsk Standard Time', '(GMT+09:00) Yakutsk', '+09:00'),
(64, 'A.U.S. Central Standard Time', '(GMT+09:30) Darwin', '+09:30'),
(65, 'Cen. Australia Standard Time', '(GMT+09:30) Adelaide', '+09:30'),
(66, 'A.U.S. Eastern Standard Time', '(GMT+10:00) Canberra, Melbourne, Sydney', '+10:00'),
(67, 'E. Australia Standard Time', '(GMT+10:00) Brisbane', '+10:00'),
(68, 'Tasmania Standard Time', '(GMT+10:00) Hobart', '+10:00'),
(69, 'Vladivostok Standard Time', '(GMT+10:00) Vladivostok', '+10:00'),
(70, 'West Pacific Standard Time', '(GMT+10:00) Guam, Port Moresby', '+10:00'),
(71, 'Central Pacific Standard Time', '(GMT+11:00) Magadan, Solomon Islands, New Caledonia', '+11:00'),
(72, 'Fiji Islands Standard Time', '(GMT+12:00) Fiji, Kamchatka, Marshall Is.', '+12:00'),
(73, 'New Zealand Standard Time', '(GMT+12:00) Auckland, Wellington', '+12:00'),
(74, 'Tonga Standard Time', '(GMT+13:00) Nuku\'alofa', '+13:00'),
(75, 'Azerbaijan Standard Time', '(GMT-03:00) Buenos Aires', '-03:00'),
(76, 'Middle East Standard Time', '(GMT+02:00) Beirut', '+02:00'),
(77, 'Jordan Standard Time', '(GMT+02:00) Amman', '+02:00'),
(78, 'Central Standard Time (Mexico)', '(GMT-06:00) Guadalajara, Mexico City, Monterrey - New', '-06:00'),
(79, 'Mountain Standard Time (Mexico)', '(GMT-07:00) Chihuahua, La Paz, Mazatlan - New', '-07:00'),
(80, 'Pacific Standard Time (Mexico)', '(GMT-08:00) Tijuana, Baja California', '-08:00'),
(81, 'Namibia Standard Time', '(GMT+02:00) Windhoek', '+02:00'),
(82, 'Georgian Standard Time', '(GMT+03:00) Tbilisi', '+03:00'),
(83, 'Central Brazilian Standard Time', '(GMT-04:00) Manaus', '-04:00'),
(84, 'Montevideo Standard Time', '(GMT-03:00) Montevideo', '-03:00'),
(85, 'Armenian Standard Time', '(GMT+04:00) Yerevan', '+04:00'),
(86, 'Venezuela Standard Time', '(GMT-04:30) Caracas', '-04:30'),
(87, 'Argentina Standard Time', '(GMT-03:00) Buenos Aires', '-03:00'),
(88, 'Morocco Standard Time', '(GMT) Casablanca', '+00:00'),
(89, 'Pakistan Standard Time', '(GMT+05:00) Islamabad, Karachi', '+05:00'),
(90, 'Mauritius Standard Time', '(GMT+04:00) Port Louis', '+04:00'),
(91, 'UTC', '(GMT) Coordinated Universal Time', '+00:00'),
(92, 'Paraguay Standard Time', '(GMT-04:00) Asuncion', '-04:00'),
(93, 'Kamchatka Standard Time', '(GMT+12:00) Petropavlovsk-Kamchatsky', '+12:00');


COMMIT;
