---  CRETAE DATABASE

CREATE DATABASE job_mart;


--- SHOW DATABASE
SHOW DATABASES;


-- DROP DATABASE IF EXISTS
DROP DATABASE IF EXISTS job_mart;

SELECT * FROM information_schema.schemata;


-- CREATE SCHEMA

SELECT * FROM information_schema.schemata;


CREATE SCHEMA job_mart.staging;

USE job_mart;


CREATE SCHEMA IF NOT EXISTS staging;

DROP SCHEMA staging;



CREATE TABLE preferred_roles(
    role_id INTEGER,
    role_name VARCHAR
);


SELECT * FROM information_schema.tables
WHERE table_catalog ='job_mart';

CREATE TABLE staging.preferred_roles(
    role_id INTEGER,
    role_name VARCHAR
);


DROP TABLE preferred_roles;


