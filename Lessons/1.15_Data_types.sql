SELECT  
    table_name,
    column_name,
    data_type
FROM
    information_schema.columns
WHERE table_name = 'job_postings_fact';


DESCRIBE job_postings_fact;

DESCRIBE
SELECT 
    job_title_short,
    salary_year_avg
FROM 
    job_postings_fact;



----------------------------------------------------------------------------------------------------------------


## Casting


SELECT CAST(123 AS VARCHAR);

SELECT CAST('123' AS INT);



SELECT 
    job_id,   --"more" unique identifier
    company_id,
    CAST(job_work_from_home AS INT) AS job_work_from_home,  --from boolean to numeric value
    CAST(job_posted_date AS DATE) AS job_posted_date, --from timestamp to date only
    CAST(salary_year_avg AS DECIMAL(10, 0))   -- from doublw to no decimal places
FROM   
    job_postings_fact
WHERE salary_year_avg IS NOT NULL;


------------------------------------------------------------------------------------------------------

# CONCATINATION



SELECT 
    CAST(job_id AS VARCHAR) || '-' ||  CAST(company_id AS VARCHAR),   --"more" unique identifier 
    CAST(job_work_from_home AS INT) AS job_work_from_home,  --from boolean to numeric value
    CAST(job_posted_date AS DATE) AS job_posted_date, --from timestamp to date only
    CAST(salary_year_avg AS DECIMAL(10, 0))   -- from doublw to no decimal places
FROM   
    job_postings_fact
WHERE salary_year_avg IS NOT NULL;



-------------------------------------------------------------------------------------------------------


-- CASTING

SELECT 
    job_id::VARCHAR || '-' ||  company_id::VARCHAR,   --"more" unique identifier 
    job_work_from_home::INT job_work_from_home,  --from boolean to numeric value
    job_posted_date::DATE job_posted_date, --from timestamp to date only
    salary_year_avg::DECIMAL(10, 0)   -- from doublw to no decimal places
FROM   
    job_postings_fact
WHERE salary_year_avg IS NOT NULL;



