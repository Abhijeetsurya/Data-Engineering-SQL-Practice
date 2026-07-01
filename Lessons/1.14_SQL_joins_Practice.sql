-- 51 Find company name for every job.
SELECT job_postings_fact.*, company_dim.name AS company_name FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id =company_dim.company_id;


-- 52 Show every job with: job_title, company_name, job_country
SELECT 
  job_postings_fact.job_title, company_dim.name, job_postings_fact.job_country
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id;


-- Q53. Find all companies that posted Data Engineer jobs.
SELECT 
  company_dim.name AS company_name, job_postings_fact.job_title_short
FROM  
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_postings_fact.job_title_short ='Data Engineer';


-- Q54 Find all jobs posted by Meta.
SELECT job_postings_fact.*, company_dim.name FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE company_dim.name = 'Meta'


-- Q55 Count number of jobs posted by each company.
SELECT 
  company_dim.name, COUNT(job_postings_fact.job_id) AS total_Jobs
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
GROUP BY company_dim.name;


-- Q56 Find the top 10 companies by number of job postings.

SELECT 
  company_dim.name, COUNT(job_postings_fact.job_id) AS total_Jobs
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
GROUP BY company_dim.name
ORDER BY total_jobs DESC
LIMIT 10;



-- Q57 Find companies that posted more than 100 jobs.
SELECT 
  company_dim.name, COUNT(job_postings_fact.job_id) AS total_Jobs
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
GROUP BY company_dim.name
HAVING COUNT(job_postings_fact.job_id) > 100;


-- Q58 Find companies that posted remote jobs.
SELECT 
  company_dim.name AS total_Jobs
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_postings_fact.job_work_from_home =true
GROUP BY company_dim.name



-- Q59 Find companies that offer health insurance.
SELECT 
  company_dim.name AS total_Jobs
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_postings_fact.job_health_insurance =true
GROUP BY company_dim.name


-- Q60 Find the average salary offered by each company.
SELECT 
  company_dim.name, ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_salary
FROM
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
GROUP BY company_dim.name;



