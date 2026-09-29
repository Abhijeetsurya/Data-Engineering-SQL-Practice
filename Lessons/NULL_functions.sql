SELECT NULLIF(5+5, 20);


SELECT 
    salary_year_avg,
    salary_hour_avg,
    COALESCE(salary_year_avg, salary_hour_avg*2080) AS avg_salary_year
FROM
    job_postings_fact
WHERE salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL
LIMIT 10;


-- Simplify with Coalesce

SELECT 
    job_title_short,
    salary_year_avg,
    salary_hour_avg,
    COALESCE(salary_year_avg, salary_hour_avg*2080) AS standardized_salary,
        CASE
            WHEN COALESCE(salary_year_avg, salary_hour_avg*2000) IS NULL THEN 'Missing'
            WHEN COALESCE(salary_year_avg, salary_hour_avg*2000) < 75000 THEN 'Low'
            WHEN COALESCE(salary_year_avg, salary_hour_avg*2000) < 150000 THEN 'Mid'
            ELSE 'High'     
        END AS salary_bucket
FROM job_postings_fact
ORDER BY standardized_salary DESC
LIMIT 10;