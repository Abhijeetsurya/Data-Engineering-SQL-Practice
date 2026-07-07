---  .read Lessons/1.16_DDL_DML_1.sql


-- Show available databases
SHOW DATABASES;

-- Create the schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS staging;

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
    role_id INTEGER,
    role_name VARCHAR
);

-- Drop the table if needed
DROP TABLE IF EXISTS preferred_roles;