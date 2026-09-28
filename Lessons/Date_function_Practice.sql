/* Q161 — Extract Year
Find the number of job postings for each year. */

SELECT 
    EXTRACT(YEAR FROM job_posted_date) AS job_posted_year, 
    COUNT(job_id) AS total_jobs
FROM job_postings_fact
GROUP BY job_posted_year;

/* Q162 — Extract Month
Find the number of job postings for each month.*/

SELECT
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month,
    COUNT(job_id) AS total_jobs
FROM
    job_postings_fact
GROUP BY job_posted_month
ORDER BY job_posted_month;

/* Q163 — Jobs by Year and Month
Find the number of job postings for each year and month.*/

SELECT
    EXTRACT(YEAR FROM job_posted_date) AS Year,
    EXTRACT(MONTH FROM job_posted_date) AS Month,
    COUNT(job_id) AS total_jobs
FROM
    job_postings_fact
GROUP BY Year, Month
ORDER BY Year, Month;

/* Q164 — Data Engineer Jobs by Year
Find the number of Data Engineer jobs posted each year.*/

SELECT 
    EXTRACT(YEAR FROM job_posted_date) AS Year,
    COUNT(job_id) AS total_jobs
FROM
    job_postings_fact
WHERE job_title_short = 'Data Engineer'
GROUP BY Year;


/* Q165 — Recent Jobs
Find all jobs posted during 2023.*/

SELECT
    job_id,
    job_title,
    job_posted_date
FROM
    job_postings_fact
WHERE YEAR(job_posted_date) = '2023'; 


/* Q166 — Weekend Postings
Find jobs posted on Saturday or Sunday.*/

SELECT
    job_id,
    job_title,
    dayname(job_posted_date) AS job_posted_day
FROM 
    job_postings_fact;

/* Q167 — Monthly Data Engineer Analysis
Find the number of Data Engineer jobs posted in each month.*/


SELECT
    EXTRACT(MONTH FROM job_posted_date) AS job_post_month,
    COUNT(job_id) AS total_jobs
FROM
    job_postings_fact
GROUP BY job_post_month;


/* Q168 — Yearly Average Salary
Find the average annual salary for each year.*/

SELECT
    EXTRACT(YEAR FROM job_posted_date) AS Year,
    AVG(salary_year_avg) AS avg_year_salary
FROM
    job_postings_fact
WHERE salary_year_avg IS NOT NULL
GROUP BY Year;


/* Q169 — Salary by Year for Data Engineers
Find the average Data Engineer salary for each year.*/

SELECT 
    EXTRACT(YEAR FROM job_posted_date) AS Year,
    AVG(salary_year_avg) AS Avg_salary
FROM
    job_postings_fact
WHERE job_title_short = 'Data Engineer'
GROUP BY Year;


/* Q170 — 🔥 Yearly Salary Comparison
Find the year with the highest average Data Engineer salary.*/

SELECT 
    EXTRACT(YEAR FROM job_posted_date) AS Year,
    AVG(salary_year_avg) AS Avg_salary
FROM
    job_postings_fact
WHERE job_title_short = 'Data Engineer' 
GROUP BY Year
ORDER BY Avg_salary DESC
LIMIT 1;



/* Q171 — Job Locations
Find the unique locations appearing in:
1. job_location
2. search_location */

SELECT 
    job_location
FROM
    job_postings_fact
UNION
SELECT
    search_location
FROM
    job_postings_fact;


/* Q172 — UNION ALL
Combine all job_location and search_location values, including duplicates.*/

SELECT
    job_location
FROM
    job_postings_fact
UNION ALL
SELECT
    search_location
FROM
    job_postings_fact;

/* Q173 — Common Locations
Find locations that appear in both job_location and search_location.*/

SELECT
    job_location
FROM
    job_postings_fact
INTERSECT
SELECT
    search_location
FROM
    job_postings_fact;

/*Q174 — Job Locations Not in Search Locations
Find locations that appear in job_location but not in search_location.*/

SELECT
    job_location
FROM
    job_postings_fact
EXCEPT
SELECT
    search_location
FROM 
    job_postings_fact;

/* Q175 — Countries
Find countries that appear in:
- job_country
- search_location */

SELECT
    job_country
FROM
    job_postings_fact
UNION
SELECT
    search_location
FROM
    job_postings_fact;


/* Q176 — Data Engineer vs Data Analyst Companies
Find companies that have posted:
- Data Engineer jobs
- Data Analyst jobs
Use a set operator. */

SELECT
    company_id
FROM
    job_postings_fact
WHERE job_title_short = 'Data Analyst'
UNION
SELECT
    company_id
FROM
    job_postings_fact
WHERE job_title_short = 'Data Engineer';


/* Q177 — Data Engineer Only Companies
Find companies that have posted Data Engineer jobs but not Data Analyst jobs.*/

SELECT 
    company_id
FROM
    job_postings_fact
WHERE job_title_short = 'Data Engineer'
EXCEPT
SELECT
    company_id
FROM
    job_postings_fact
WHERE job_title_short = 'Data Analyst';



/* Q178 — Skills
Find skills that are associated with:
- Data Engineer jobs
- Data Analyst jobs */

SELECT
    sjd.skill_id, sd.skills
FROM
    job_postings_fact AS jpf
INNER JOIN 
skills_job_dim sjd ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
GROUP BY  sjd.skill_id, sd.skills

INTERSECT

SELECT
    sjd.skill_id, sd.skills
FROM
    job_postings_fact AS jpf
INNER JOIN 
skills_job_dim sjd ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
GROUP BY  sjd.skill_id, sd.skills; 


/* Q179 — Data Engineer-Only Skills
Find skills used by Data Engineer jobs but never used by Data Analyst jobs. */

SELECT
    sjd.skill_id, sd.skills
FROM
    job_postings_fact AS jpf
INNER JOIN 
skills_job_dim sjd ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
GROUP BY  sjd.skill_id, sd.skills

EXCEPT

SELECT
    sjd.skill_id, sd.skills
FROM
    job_postings_fact AS jpf
INNER JOIN 
skills_job_dim sjd ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
GROUP BY  sjd.skill_id, sd.skills; 



/* Q180 — 🔥 Final Challenge
Find companies that have posted both Data Engineer and Data Scientist jobs, but not Data Analyst jobs. */

(
    SELECT company_id
    FROM job_postings_fact
    WHERE job_title_short = 'Data Engineer'

    INTERSECT

    SELECT company_id
    FROM job_postings_fact
    WHERE job_title_short = 'Data Scientist'
)

EXCEPT

SELECT company_id
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst';