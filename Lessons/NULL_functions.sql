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


/* Q206 — IS NULL
Find all job postings where salary_year_avg is missing.*/

SELECT
    job_id,
    job_title,
    salary_year_avg
FROM
    job_postings_fact
WHERE salary_year_avg IS NULL;


/* Q207 — IS NOT NULL
Find all Data Engineer jobs where salary_year_avg is available.
Return:
- job_id
- job_title
- salary_year_avg
Sort by salary_year_avg descending. */

SELECT
    job_id,
    job_title_short,
    salary_year_avg
FROM
    job_postings_fact
WHERE job_title_short = 'Data Engineer' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;


/* Q208 — COUNT + NULL
Find:
1. Total number of job postings.
2. Number of jobs with a yearly salary.
3. Number of jobs without a yearly salary.
Return all three values in one row. */

SELECT
    COUNT(job_id) AS total,
    COUNT(CASE WHEN salary_year_avg IS NOT NULL THEN job_id END) AS salary_year_avg_present,
    COUNT(CASE WHEN salary_year_avg IS NULL THEN job_id END) AS salary_year_avg_not_present
FROM
    job_postings_fact;




/* Q209 — COALESCE()
Return every job's yearly salary.
If salary_year_avg is NULL, replace it with 0.
Return:
- job_id
- job_title
- salary_year_avg
- salary_with_default */


SELECT
    job_id,
    job_title,
    salary_year_avg,
    COALESCE(salary_year_avg, 0) AS salary_with_default
FROM
    job_postings_fact;



/*
Q210 — COALESCE() with Text
Return every company's name.
If name is NULL, replace it with:
Unknown Company

Return:
- company_id
- name
- company_name
Use COALESCE().  */

SELECT 
    company_id,
    name,
    COALESCE(name, 'Unkown_company') AS company_name
FROM
    company_dim;



/* Q211 — NULL + Calculation
Calculate an estimated monthly salary from salary_year_avg.
If the yearly salary is NULL, the result should also remain NULL.
Return:
- job_id
- salary_year_avg
- monthly_salary */


SELECT 
    job_id,
    salary_year_avg,
    CASE
        WHEN salary_year_avg IS NOT NULL THEN salary_year_avg/12
        WHEN salary_year_avg IS NULL THEN salary_year_avg
    END AS monthly_salary
FROM
    job_postings_fact;


/* Q212 — COALESCE() + Calculation
Calculate monthly salary again, but this time replace missing yearly salaries with 0 before calculating the monthly salary.
Return:
- job_id
- salary_year_avg
- monthly_salary */

SELECT
    job_id,
    salary_year_avg,
    COALESCE(salary_year_avg, 0)/12 AS monthly_salary
FROM 
    job_postings_fact;



/* Q213 — NULLIF()
Find the number of jobs where salary_year_avg is not zero.
Use NULLIF() somewhere in your solution.
Return:
- job_id
- salary_year_avg  */


SELECT
    job_id,
    salary_year_avg
    
FROM
    job_postings_fact
WHERE salary_year_avg = NULLIF(salary_year_avg, 0);



/* Q214 — NULL + CASE 🔥
Create a salary_status column:
- salary_year_avg IS NULL → Missing
- salary > 150,000 → High
- salary between 75,000 and 150,000 → Medium
- salary below 75,000 → Low */

SELECT
    job_id,
    salary_year_avg,
    CASE
        WHEN salary_year_avg IS NULL THEN 'Missing'
        WHEN salary_year_avg > 150000 THEN 'High'
        WHEN salary_year_avg BETWEEN 75000 AND 150000 THEN 'Meduim'
        WHEN salary_year_avg < 75000 THEN 'Low'
    END AS salary_status
FROM
    job_postings_fact;


/* Q215 — 🔥 NULL Challenge
Calculate the percentage of all job postings that have a yearly salary.
Return:
- total_jobs
- jobs_with_salary
- salary_percentage  */ 

SELECT
    COUNT(*) AS total_jobs,
    COUNT(salary_year_avg) AS jobs_with_salary,
    COUNT(salary_year_avg)*100/COUNT(*) AS salary_percentage
FROM
    job_postings_fact;