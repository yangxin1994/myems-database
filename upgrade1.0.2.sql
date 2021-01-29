-- 
-- WARNING: BACUP YOUR DATABASE BEFORE UPGRADE
-- 

ALTER TABLE myems_system_db.tbl_meters CHANGE parent_meter_id master_meter_id bigint NULL;


-- UPDATE VERSION NUMBER
UPDATE myems_system_db.tbl_versions SET version='1.0.2', release_date='2021-01-29' WHERE id=1;
