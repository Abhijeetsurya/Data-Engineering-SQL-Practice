-- Q1 Display all columns from job_postings_fact.

SELECT * FROM job_postings_fact;


-- Q2 Display only: job_id, job_title, job_location
SELECT job_id, job_title, job_location FROM
job_postings_fact;


-- Q3 Display the first 20 rows.
SELECT * FROM job_postings_fact
LIMIT 20;

-- Q4 Find all distinct job titles (job_title_short).
SELECT DISTINCT(job_title_short) FROM job_postings_fact;

-- Q5 Find all distinct countries.

SELECT DISTINCT job_country FROM job_postings_fact;


-- Q6 Display jobs posted in India.

SELECT * FROM job_postings_fact
WHERE job_country = 'India';


-- Q7 Display jobs where salary information is available.
SELECT * FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL;


-- Q8 Display jobs that mention health insurance.
SELECT * FROM job_postings_fact
WHERE job_health_insurance IS true;



-- Q9 Display jobs that are work from home.
SELECT * FROM job_postings_fact
WHERE job_work_from_home = true;



-- Q10 Display jobs posted by a specific company.
SELECT job_postings_fact.*, company_dim.* FROM job_postings_fact
INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE company_dim.name IN ('Meta', 'Facebook');


-- Q11 Find all Data Engineer jobs.

SELECT * FROM job_postings_fact
WHERE job_title_short LIKE '%Data Engineer%' OR job_title LIKE '%Data Engineer%';


-- Q12 Find all Data Analyst jobs.
SELECT * FROM job_postings_fact
WHERE job_title_short LIKE '%Data Analyst%' OR job_title LIKE 'Data Analyst';


-- Q13 Find jobs posted in the United States.
SELECT * FROM job_postings_fact
WHERE job_country LIKE 'United States';

-- Q14 Find remote Data Engineer jobs.
SELECT * FROM job_postings_fact
WHERE job_work_from_home = true AND job_title_short = 'Data Engineer';

-- Q15 Find jobs with salary above 100000.
SELECT * FROM job_postings_fact
WHERE salary_year_avg > 100000;


-- Q16 Find jobs with salary between 100000 and 200000.
SELECT * FROM job_postings_fact
WHERE salary_year_avg BETWEEN 100000 AND 200000;


-- Q17 Find jobs that do not require a degree.

SELECT * FROM job_postings_fact
WHERE job_no_degree_mention = true;


-- Q18 Find jobs with health insurance.
SELECT * FROM job_postings_fact
WHERE job_health_insurance =true;


-- Q19 Find jobs posted after January 1, 2023.
SELECT * FROM job_postings_fact
WHERE job_posted_date > '2023-01-01';

-- Q20 Find jobs posted in India or Singapore.
SELECT * FROM job_postings_fact
WHERE job_country IN ('India', 'Singapore');


-- Q21 Find jobs that are remote and pay above 150000.
SELECT * FROM job_postings_fact
WHERE job_work_from_home IS true AND salary_year_avg>150000;


-- Q22 Find jobs whose title contains "Engineer".  
SELECT * FROM job_postings_fact
WHERE job_title_short LIKE '%Engineer%' OR job_title LIKE '%Engineer%'

-- Q23 Find jobs whose title starts with "Senior".

SELECT * FROM job_postings_fact
WHERE job_title_short LIKE 'Senior%' OR job_title LIKE 'Senior%';


-- Q24 Find jobs posted through LinkedIn.-
SELECT * FROM job_postings_fact
WHERE job_via = 'via LinkedIn'


-- Q25 Find jobs with NULL salary.
SELECT * FROM job_postings_fact
WHERE salary_year_avg IS NULL AND salary_hour_avg IS NULL;


-- Q26 Count total jobs.
SELECT COUNT(job_id) FROM job_postings_fact;


--- Q27 Count total companies.

SELECT COUNT(DISTINCT company_id) AS total_companies FROM job_postings_fact;


-- Q28 Count remote jobs.
SELECT COUNT(*) FROM job_postings_fact
WHERE job_work_from_home IS true;


-- Q29 Find average salary of Data Engineers.
SELECT ROUND(AVG(salary_year_avg), 2) AS avg_salary_data_engineer FROM job_postings_fact
WHERE job_title_short = 'Data Engineer'


-- Q30 Find maximum salary.
SELECT MAX(salary_year_avg) AS Max_salary FROM job_postings_fact;


-- Q31 Find minimum salary.
SELECT MIN(salary_year_avg) AS Min_salary FROM job_postings_fact;


-- Q32 Count jobs by country.
SELECT 
  job_country, count(job_id) 
FROM 
  job_postings_fact
GROUP BY 
  job_country;


  -- Q33 Count jobs by schedule type.
SELECT 
  job_schedule_type, COUNT(*) 
FROM 
  job_postings_fact
GROUP BY 
  job_schedule_type;


-- Q34 Find average salary by country.
SELECT 
  job_country, AVG(salary_year_avg) AS avg_salary_by_country
FROM 
  job_postings_fact
GROUP BY 
  job_country;



-- Q35 Find average salary by job title.
SELECT 
  job_title_short, AVG(salary_year_avg) AS avg_salary 
FROM 
  job_postings_fact
GROUP BY 
  job_title_short;



-- 36 Find highest-paying country.
SELECT job_country, salary_year_avg FROM job_postings_fact
GROUP BY job_country, salary_year_avg
ORDER BY salary_year_avg DESC
LIMIT 1;


-- Q37 Find top 10 countries by number of jobs.
SELECT job_country, COUNT(job_id) AS total_jobs FROM job_postings_fact
GROUP BY job_country
ORDER BY total_jobs DESC
LIMIT 10;



-- Q38 Find total jobs with no degree requirement.
SELECT COUNT(*) AS total_jobs FROM job_postings_fact
WHERE job_no_degree_mention =true;


-- Q39 Find percentage of remote jobs.
SELECT 
 ROUND((COUNT(*) / (SELECT COUNT(*) FROM job_postings_fact)*100),2) AS percentage_of_wfm_jobs
FROM 
  job_postings_fact
WHERE 
  job_work_from_home =true;

  -- Q40 Find average salary of remote jobs. 
SELECT AVG(salary_year_avg) FROM job_postings_fact
WHERE job_work_from_home = true;

-- Q40 Find average salary of remote jobs.
SELECT 
  job_work_from_home, AVG(salary_year_avg) AS avg_salary_of_remote_jobs 
FROM 
  job_postings_fact
GROUP BY 
 job_work_from_home
HAVING 
  job_work_from_home =true;


-- Q41 Find countries having more than 1000 job postings.

SELECT job_country, COUNT(*) AS total_jobs FROM job_postings_fact
GROUP BY job_country
HAVING COUNT(*) > 1000;



-- Q42 Find companies having more than 50 job postings.
SELECT company_id, COUNT(company_id) from job_postings_fact
GROUP BY company_id
HAVING COUNT(company_id) > 50;




-- Q43 Find job titles with average salary above 150000.
SELECT 
  job_title_short, AVG(salary_year_avg) AS avg_salary 
FROM 
 job_postings_fact
GROUP BY job_title_short
HAVING AVG(salary_year_avg) > 150000;




-- Q44 Find countries with average salary above 120000.
SELECT 
  job_country, AVG(salary_year_avg) AS avg_salary 
FROM 
  job_postings_fact
GROUP BY job_country
HAVING AVG(salary_year_avg) > 120000;




-- Q45 Find schedule types having more than 500 postings.
SELECT 
  job_schedule_type, COUNT(job_schedule_type) AS job_type 
FROM 
  job_postings_fact
GROUP BY 
  job_schedule_type
HAVING COUNT(job_schedule_type) > 500;



-- Q46 Find companies with remote jobs.
SELECT company_id, COUNT(job_work_from_home) AS remote_jobs FROM job_postings_fact
GROUP BY ALL
HAVING job_work_from_home = true;




-- Q47 Find countries with more than 100 remote jobs.
SELECT 
  job_country, COUNT(*) AS remote_jobs 
FROM
  job_postings_fact
WHERE job_work_from_home=TRUE
GROUP BY job_country, job_work_from_home
HAVING COUNT(job_work_from_home = true) > 100



-- Q48 Find companies paying average salary above 200000.
SELECT 
 company_id, AVG(salary_year_avg) AS avg_salary 
FROM
  job_postings_fact
GROUP BY company_id
HAVING AVG(salary_year_avg) >= 200000;



-- Q49 Find job titles with at least 500 postings.
SELECT 
 job_title_short, COUNT(job_title_short) AS total_jobs 
FROM 
  job_postings_fact
GROUP BY job_title_short
HAVING COUNT(job_title_short) > 500;




-- Q50 Find companies that posted more than 100 jobs.
SELECT 
  company_id, COUNT(job_id) AS posted_job 
FROM 
  job_postings_fact
GROUP BY company_id
HAVING COUNT(job_id) > 100;




