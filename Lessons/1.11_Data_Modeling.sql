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