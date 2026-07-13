---  .read Lessons/1.16_DDL_DML_1.sql
CREATE DATABASE IF NOT EXISTS jobs_mart;
-- Show available databases
SHOW DATABASES;

-- DROP DATABASE IF EXISTS jobs_mart;

SELECT * FROM information_schema.schemata;

USE jobs_mart;

-- 1. Setup Schema
CREATE SCHEMA IF NOT EXISTS jobs_mart.staging;


SELECT * FROM information_schema.schemata;



-- DROP schema
DROP SCHEMA IF EXISTS jobs_mart.staging;

-- 2. Create the table in the staging schema
CREATE TABLE IF NOT EXISTS jobs_mart.staging.preferred_roles (
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR
);

TRUNCATE TABLE staging.preferred_roles;

-- 3. Insert initial data
INSERT INTO staging.preferred_roles(role_id, role_name)
VALUES(1, 'Data Engineer'),
      (2, 'Senior Data Engineer');

INSERT INTO staging.preferred_roles(role_id, role_name)
VALUES(3, 'Software Engineer');

-- 4. DML: Alter table to add column
ALTER TABLE staging.preferred_roles
ADD COLUMN is_preferred BOOLEAN; -- Changed column name to be more descriptive

-- 5. Update data
UPDATE staging.preferred_roles
SET is_preferred = TRUE
WHERE role_id IN (1, 2);

UPDATE staging.preferred_roles
SET is_preferred = FALSE
WHERE role_id = 3;

-- 6. Rename table
ALTER TABLE staging.preferred_roles
RENAME TO priority_roles;

-- 7. Final Select (using the NEW table name)
SELECT * FROM staging.priority_roles;

# RENAME COLUMN

ALTER TABLE staging.priority_roles 
RENAME COLUMN is_preferred TO priority_lvl;

-- CHANGE DATA TYPE

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INT;


UPDATE staging.priority_roles
SET priority_lvl = 3
WHERE role_id = 3;

SELECT * FROM staging.priority_roles;