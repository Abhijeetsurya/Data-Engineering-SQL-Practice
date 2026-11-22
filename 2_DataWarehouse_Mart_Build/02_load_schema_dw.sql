--- Step 2 :- DW - Load data from CSV files into tables

SELECT '=== Loading company_dim table ===' AS info;

INSERT INTO company_dim(company_id, name)
SELECT 
    company_id, name
FROM 
    read_csv('https://storage.googleapis.com/sql_de/company_dim.csv', AUTO_DETECT=True);

SELECT '=== Loading skills_dim table ===' AS info;

INSERT INTO skill_dim(skill_id, type)
SELECT 
    skill_id, type
FROM 
    read_csv('https://storage.googleapis.com/sql_de/skills_dim.csv', AUTO_DETECT=True);

INSERT INTO job_postings_fact(
    job_id, company_id, job_title_short, job_title, job_location,
    job_via, job_schedule_type, job_work_from_home, search_location,
    job_posted_date, job_no_degree_mention, job_health_insurance,
    job_country, salary_rate, salary_year_avg, salary_hour_avg
)
SELECT 
    job_id, company_id, job_title_short, job_title, job_location,
    job_via, job_schedule_type, job_work_from_home, search_location,
    job_posted_date, job_no_degree_mention, job_health_insurance,
    job_country, salary_rate, salary_year_avg, salary_hour_avg
FROM 
    read_csv('https://storage.googleapis.com/sql_de/job_postings_fact.csv', AUTO_DETECT=True);


SELECT '=== Loading skills_job_dim table ===' AS info;

INSERT INTO skills_job_dim(skill_id, job_id)
SELECT skill_id, job_id
FROM read_csv('https://storage.googleapis.com/sql_de/skills_job_dim.csv', AUTO_DETECT=True);


SELECT 'Company dim' AS table_name,COUNT(*) AS record_count FROM company_dim
UNION ALL
SELECT 'Skill dim' AS table_name, COUNT(*) AS record_count FROM skill_dim
UNION ALL
SELECT 'Job postings fact' AS table_name, COUNT(*) AS record_count FROM job_postings_fact
UNION ALL
SELECT 'Skills job dim' AS table_name, COUNT(*) AS record_count FROM skills_job_dim;


SELECT '=== Company Dimension Table Sample ===' AS info;
SELECT * FROM company_dim LIMIT 5;

SELECT '=== Skill Dimension Table Sample ===' AS info;
SELECT * FROM skill_dim LIMIT 5;

SELECT '=== Job Postings Fact Table Sample ===' AS info;
SELECT * FROM job_postings_fact LIMIT 5;    

SELECT '=== Skills Job Dimension Table Sample ===' AS info;
SELECT * FROM skills_job_dim LIMIT 5;