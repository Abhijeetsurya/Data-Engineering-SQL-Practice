
--  .read Lessons/1.17_DDL_DML_2.sql

/* Cleaned and formatted query */
USE jobs_mart;

 
CREATE OR REPLACE TABLE staging.job_postings_flat AS
SELECT
    jpf.job_id,
    jpf.job_title_short,
    jpf.job_title,
    jpf.job_location,
    jpf.job_via,
    jpf.job_schedule_type,
    jpf.job_work_from_home,
    jpf.search_location,
    jpf.job_posted_date,
    jpf.job_no_degree_mention,
    jpf.job_health_insurance,
    jpf.job_country,
    jpf.salary_rate,
    jpf.salary_year_avg,
    jpf.salary_hour_avg,
    jpf.company_id,
    cd.name AS company_name,
    cd.link AS company_link,
    cd.link_google,
    cd.thumbnail
FROM data_jobs.main.job_postings_fact AS jpf
LEFT JOIN data_jobs.main.company_dim AS cd
    ON jpf.company_id = cd.company_id;


SELECT * FROM staging.job_postings_flat
LIMIT 10;

SELECT COUNT(*) FROM staging.job_postings_flat;

SELECT * FROM staging.priority_roles;



----------------------------------------- CREATE VIEW ----------------------------------------------------------


CREATE OR REPLACE VIEW staging.priority_flat_view AS 
SELECT 
    jpf.* 
FROM 
    staging.job_postings_flat AS jpf
JOIN staging.priority_roles AS r 
    ON jpf.job_title_short = r.role_name
WHERE r.priority_lvl = 1;

SELECT * FROM staging.priority_flat_view;



---------------------------------------   CREATE TAMP TABLE  ----------------------------------------------------

SELECT 
    job_title_short, COUNT(*) AS jobs_count 
FROM 
    staging.priority_flat_view
GROUP BY job_title_short
ORDER BY jobs_count DESC;


CREATE TEMPORARY TABLE senior_job__post_flat AS
SELECT 
    * 
FROM 
    staging.priority_flat_view
WHERE job_title_short = 'Senior Data Engineer';


SELECT 
    job_title_short, COUNT(*) AS jobs_count 
FROM 
    senior_job__post_flat
GROUP BY job_title_short
ORDER BY jobs_count DESC;



SELECT COUNT(*) FROM staging.job_postings_flat;
SELECT COUNT(*) FROM staging.priority_flat_view;
SELECT COUNT(*) FROM senior_job__post_flat;


DELETE FROM staging.job_postings_flat
WHERE job_posted_date < '2024-01-01';

SELECT COUNT(*) FROM staging.job_postings_flat;
SELECT COUNT(*) FROM staging.priority_flat_view;
SELECT COUNT(*) FROM senior_job__post_flat;

TRUNCATE TABLE staging.job_postings_flat;

INSERT INTO staging.job_postings_flat
SELECT
    jpf.job_id,
    jpf.job_title_short,
    jpf.job_title,
    jpf.job_location,
    jpf.job_via,
    jpf.job_schedule_type,
    jpf.job_work_from_home,
    jpf.search_location,
    jpf.job_posted_date,
    jpf.job_no_degree_mention,
    jpf.job_health_insurance,
    jpf.job_country,
    jpf.salary_rate,
    jpf.salary_year_avg,
    jpf.salary_hour_avg,
    jpf.company_id,
    cd.name AS company_name,
    cd.link AS company_link,
    cd.link_google,
    cd.thumbnail
FROM data_jobs.main.job_postings_fact AS jpf
LEFT JOIN data_jobs.main.company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE job_posted_date >= '2024-01-01';


SELECT COUNT(*) FROM staging.job_postings_flat;
SELECT COUNT(*) FROM staging.priority_flat_view;
SELECT COUNT(*) FROM senior_job__post_flat;


