-- Q51 Display every job posting along with the company name.

SELECT 
  job_postings_fact.job_id, job_postings_fact.job_title_short, company_dim.name AS company_name
FROM
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id;


-- Q52 Display all Data Engineer jobs along with the company name.
SELECT 
  job_postings_fact.job_id, job_postings_fact.job_title, company_dim.name AS company_name
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title = 'Data Engineer' OR job_title_short ='Data Engineer';


-- Q53 Display all jobs and their company website link.
SELECT 
  job_postings_fact.job_id, job_postings_fact.job_title_short, company_dim.name, company_dim.link
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id;


-- Q54 Find all companies that posted jobs in India(Where only mention India).

SELECT 
  job_postings_fact.*, company_dim.name 
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_postings_fact.job_location = 'India';


-- Q54 Find all companies that posted jobs in India(Where city and state also mention).

SELECT  
  company_dim.name, job_postings_fact.job_country 
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_postings_fact.job_location LIKE '%India%';




-- Q55 Display all companies that have posted remote jobs.

SELECT 
  company_dim.name, COUNT(job_postings_fact.job_work_from_home) AS total_job
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_work_from_home = true
GROUP BY company_dim.name;


-- Q56 Find the number of jobs posted by each company.
SELECT 
  company_dim.name, COUNT(DISTINCT job_id) AS total_jobs
FROM
  job_postings_fact
RIGHT JOIN company_dim ON job_postings_fact.company_id =company_dim.company_id 
GROUP BY company_dim.name;


-- Q57 Find the top 10 companies by number of job postings.
SELECT 
  company_dim.name, COUNT(DISTINCT job_id) AS total_jobs
FROM
  job_postings_fact
RIGHT JOIN company_dim ON job_postings_fact.company_id =company_dim.company_id 
GROUP BY company_dim.name
ORDER BY total_jobs DESC 
LIMIT 10;



-- Q58 Find companies that posted more than 100 jobs.SELECT 
SELECT 
  company_dim.name, COUNT(DISTINCT job_id) AS total_jobs
FROM
  job_postings_fact
RIGHT JOIN company_dim ON job_postings_fact.company_id =company_dim.company_id 
GROUP BY company_dim.name
HAVING COUNT(DISTINCT job_id) > 100;


-- Q59 Find the average salary offered by each company.

SELECT company_dim.name AS company_name, ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS avg_salary
FROM job_postings_fact LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
GROUP BY company_dim.company_id, company_dim.name;


-- Q60 Find the top 10 highest-paying companies.

SELECT company_dim.name AS company_name, job_postings_fact.salary_year_avg 
FROM job_postings_fact LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
ORDER BY job_postings_fact.salary_year_avg DESC
LIMIT 10;


-- Q61 Display every skill along with its type.

SELECT * FROM skills_dim;


-- Q62 Display all skills required for every job.
SELECT
  job_postings_fact.job_id, job_postings_fact.job_title, skills_dim.skills 
FROM 
  job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id;



-- Q63 Display all skills required for Data Engineer jobs.

SELECT
   job_postings_fact.job_id, job_postings_fact.job_title, skills_dim.skills 
FROM 
  job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_postings_fact.job_title ='Data Engineer';


-- Q64 Find the number of jobs requiring each skill.
SELECT
   skills_dim.skills, COUNT(skills_dim.skills) AS total_jobs_for_skill
FROM 
  job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY skills_dim.skills
ORDER BY total_jobs_for_skill DESC;


-- Q65 Find the top 20 most demanded skills.
SELECT
   skills_dim.skills, COUNT(skills_dim.skills) AS total_jobs_for_skill
FROM 
  job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY skills_dim.skills
ORDER BY total_jobs_for_skill DESC
LIMIT 20;


-- Q66 Find all skills required for remote Data Engineer jobs.
SELECT  
   job_postings_fact.job_id, job_postings_fact.job_title_short, skills_dim.skills, job_postings_fact.job_work_from_home
FROM
  job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id =skills_dim.skill_id 
WHERE job_work_from_home =true;



-- Q67 Find the number of distinct skills required by each job.
SELECT  
   job_postings_fact.job_id, COUNT(DISTINCT skills_dim.skills) AS no_skills_required
FROM
  job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id =skills_dim.skill_id 
GROUP BY job_postings_fact.job_id;




-- Q68 Find jobs that require more than 10 skills.
SELECT  
   job_postings_fact.job_id, COUNT(DISTINCT skills_dim.skills) AS no_skills_required
FROM
  job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id =skills_dim.skill_id 
GROUP BY job_postings_fact.job_id
HAVING no_skills_required > 10;


-- Q69 Find companies hiring for jobs that require SQL.
SELECT 
    company_dim.name, COUNT(job_postings_fact.job_id) AS total_sql_jobs
FROM
    job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE skills_dim.skills ='sql'
GROUP BY job_postings_fact.company_id, company_dim.name;


-- Q70 Find the top 10 most demanded skills for Data Engineer jobs.
SELECT 
    company_dim.name, COUNT(job_postings_fact.job_id) AS total_sql_jobs
FROM
    job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE skills_dim.skills ='sql'
GROUP BY job_postings_fact.company_id, company_dim.name;