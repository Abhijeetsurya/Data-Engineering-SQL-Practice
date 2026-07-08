---  .read Lessons/1.16_DDL_DML_1.sql

CREATE DATABASE job_mart;
-- Show available databases
SHOW DATABASES;

SELECT * FROM information_schema.schemata;

-- Create the schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS jobs_mart.staging;

-- Create the table in the default schema (main)
CREATE TABLE IF NOT EXISTS preferred_roles (
    role_id INTEGER, 
    role_name VARCHAR
);

-- Show all tables
SELECT *
FROM information_schema.tables;

-- Create the same table in the staging schema
CREATE TABLE IF NOT EXISTS staging.preferred_roles (
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR
);

-- Drop the table if needed
 DROP TABLE IF EXISTS preferred_roles;



INSERT INTO staging.preferred_roles(role_id, role_name)
VALUES(1, 'Data Engineer'),
      (2, 'Senior Data Engineer');

SELECT * FROM staging.preferred_roles;

INSERT INTO staging.preferred_roles(role_id, role_name)
VALUES(3, 'Software Engineer');



----------------- DML ----------------------------------------


ALTER TABLE staging.preferred_roles
ADD COLUMN preferred_roles BOOLEAN;

SELECT * FROM staging.preferred_roles;

UPDATE staging.preferred_roles
SET preferred_roles =TRUE
WHERE role_id = 1 OR role_id = 2;

UPDATE staging.preferred_roles
SET preferred_roles = FALSE
WHERE role_id = 3;


SELECT * FROM staging.preferred_roles;

ALTER TABLE staging.preferred_roles
RENAME TO priority_roles;