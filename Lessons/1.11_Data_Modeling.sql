SELECT 
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM
    job_postings_fact
LIMIT 10;

SELECT 
    *
FROM 
    company_dim
WHERE 
    name IN ('Facebook', 'Meta');



SELECT * FROM information_schema.tables
WHERE table_catalog = 'data_jobs';

SELECT * FROM information_schema.key_column_usage
WHERE table_catalog = 'data_jobs';

PRAGMA SHOW_TABLES;


PRAGMA SHOW_TABLES_EXPANDED;

DESCRIBE job_postings_fact;

