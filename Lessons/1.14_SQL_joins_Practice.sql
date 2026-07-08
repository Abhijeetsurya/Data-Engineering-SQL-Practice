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
WHERE job_title = 'Data Engineer';


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

SELECT DISTINCT
c.name,
j.job_country
FROM job_postings_fact j
JOIN company_dim c
ON j.company_id = c.company_id
WHERE j.job_country = 'India';



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

SELECT 
  company_dim.name AS company_name, ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS avg_salary
FROM 
  job_postings_fact LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
GROUP BY company_dim.company_id, company_dim.name, job_postings_fact.salary_year_avg
HAVING salary_year_avg IS NOT NULL;

-- Q60 Find the top 10 highest-paying companies.

SELECT
c.name,
ROUND(AVG(j.salary_year_avg),2) AS avg_salary
FROM job_postings_fact j
LEFT JOIN company_dim c
ON j.company_id = c.company_id
WHERE salary_year_avg IS NOT NULL
GROUP BY c.name
ORDER BY avg_salary DESC
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
WHERE job_postings_fact.job_title_short ='Data Engineer';


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
WHERE job_work_from_home =true AND job_title_short = 'Data Engineer';


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
   skills_dim.skills, COUNT(skills_dim.skills) AS required_in_jobs
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Engineer' 
GROUP BY skills_dim.skills
ORDER BY required_in_jobs DESC
LIMIT 10;


-- Q71 Find the number of jobs posted in each country. Include only countries with more than 5000 jobs.
SELECT 
  job_postings_fact.job_country, COUNT(job_postings_fact.job_id) AS total_job 
FROM
  job_postings_fact
GROUP BY job_postings_fact.job_country
HAVING COUNT(job_id) > 5000
ORDER BY total_job;


-- Q72 Find the average salary for each job title. Only include titles with at least 100 salary records.
SELECT 
  job_postings_fact.job_title_short, ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary, COUNT(job_title_short) AS total_jobs
FROM 
  job_postings_fact
WHERE job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY job_title_short
HAVING COUNT(salary_year_avg) > 100;

-- Q73 Find the highest average salary among all job titles.
SELECT 
  job_postings_fact.job_title_short, AVG(salary_year_avg) AS avg_salary 
FROM 
  job_postings_fact
GROUP BY job_title_short
ORDER BY avg_salary DESC
LIMIT 1;

-- Q74 Find the country with the highest average Data Engineer salary.
SELECT 
  job_postings_fact.job_country, ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_data_engineer_salary 
FROM
  job_postings_fact
WHERE job_title_short  ='Data Engineer' AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY job_title_short, job_country
ORDER BY avg_data_engineer_salary DESC
LIMIT 1;


-- Q75 Find the number of remote jobs in each country. Order descending.
SELECT 
  job_postings_fact.job_country, COUNT(job_postings_fact.job_title_short) AS total_jobs
FROM 
  job_postings_fact
GROUP BY job_postings_fact.job_country, job_postings_fact.job_work_from_home
HAVING job_postings_fact.job_work_from_home= true
ORDER BY total_jobs DESC; 

-- Q76 Find the average salary of remote and non-remote jobs.
SELECT 
   job_postings_fact.job_work_from_home, ROUND(AVG(job_postings_fact.salary_year_avg),2) AS Avg_salary
FROM 
  job_postings_fact
GROUP BY job_postings_fact.job_work_from_home;



-- Q77 Find companies that have posted jobs in more than 3 countries.
SELECT 
   company_dim.name, COUNT( DISTINCT job_postings_fact.job_country) AS job_posted_country
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
GROUP BY job_postings_fact.company_id, company_dim.name
HAVING job_posted_country > 3
ORDER BY job_posted_country DESC


-- Q78 Find companies with at least 50 remote jobs.
SELECT 
   company_dim.name, COUNT(job_postings_fact.job_id) AS total_remote_jobs 
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
GROUP BY job_postings_fact.job_work_from_home, job_postings_fact.job_country, company_dim.name
HAVING job_postings_fact.job_work_from_home = true AND total_remote_jobs > 50;

-- Q79 Find job titles with more than 1000 postings and average salary above 150000.
SELECT 
  job_postings_fact.job_title_short, COUNT(job_postings_fact.job_id) AS total_jobs, ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary
FROM 
  job_postings_fact
GROUP BY job_postings_fact.job_title_short
HAVING total_jobs > 1000 and avg_salary > 150000;



-- Q80 Find countries where the average salary is greater than the global average salary.
SELECT 
  job_postings_fact.job_country, ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_country_salary
FROM 
  job_postings_fact
WHERE job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY job_postings_fact.job_country
HAVING AVG(job_postings_fact.salary_year_avg) > (SELECT AVG(job_postings_fact.salary_year_avg) FROM job_postings_fact);


-- Q81 Count all rows in job_postings_fact.

SELECT COUNT(*) AS total_rows FROM job_postings_fact;

-- Q82 Count rows where salary is available.
SELECT 
  COUNT(job_postings_fact.salary_year_avg) AS total_salary_available
FROM 
  job_postings_fact
WHERE job_postings_fact.salary_year_avg IS NOT NULL



-- Q83 Count distinct companies.
SELECT 
  COUNT(DISTINCT job_postings_fact.company_id) AS total_company 
FROM 
  job_postings_fact;


-- Q84 Count distinct countries.
SELECT 
  COUNT(DISTINCT job_postings_fact.job_country) AS total_country 
FROM
  job_postings_fact;

-- Q85 Count jobs requiring SQL skill.
SELECT 
   skills_dim.skills, COUNT(skills_job_dim.job_id) AS total_jobs FROM skills_job_dim
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills_dim.skills
HAVING skills_dim.skills = 'sql';



-- Q86 Count distinct skills.
SELECT 
   COUNT(DISTINCT skills_job_dim.skill_id) AS distinct_skills
FROM 
  skills_job_dim
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id ;

-- Q87 Count the number of jobs that require at least one skill.
SELECT 
  COUNT(DISTINCT job_id) AS total_jobs
FROM 
  skills_job_dim;


-- Q88 Count jobs that require more than 5 skills.
SELECT COUNT(*) AS total_jobs
FROM (
    SELECT job_id
    FROM skills_job_dim
    GROUP BY job_id
    HAVING COUNT(skill_id) > 5
) AS jobs_with_many_skills;


-- Q89 Count companies that posted remote jobs.
SELECT 
  COUNT(DISTINCT company_id) AS remote_jobs 
FROM 
  job_postings_fact
WHERE job_work_from_home = true;


-- Q90 Count companies with salary information available.
SELECT 
  COUNT(DISTINCT company_id) AS total_company 
FROM
  job_postings_fact
WHERE salary_year_avg IS NOT NULL

-- Q91 Find the number of jobs posted by each company. Show company name.

SELECT 
  job_postings_fact.company_id, company_dim.name, COUNT(job_postings_fact.job_id) AS total_jobs
FROM 
  job_postings_fact 
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
GROUP BY job_postings_fact.company_id, company_dim.name

-- Q92 Find the average salary for each company. Ignore NULL salaries.
SELECT
c.name,
AVG(j.salary_year_avg)
FROM job_postings_fact j
JOIN company_dim c
ON j.company_id = c.company_id
WHERE j.salary_year_avg IS NOT NULL
GROUP BY c.name;


-- Q93 Find the top 20 companies by average salary.
SELECT 
  job_postings_fact.company_id, company_dim.name, AVG(job_postings_fact.salary_year_avg) AS avg_salary
FROM 
  job_postings_fact 
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY job_postings_fact.company_id, company_dim.name
ORDER BY avg_salary DESC
LIMIT 20;


-- Q94 Find the number of jobs requiring each skill.
SELECT 
  skills_job_dim.skill_id, skills_dim.skills, COUNT(job_id) AS total_jobs 
FROM 
  skills_job_dim
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills_job_dim.skill_id, skills_dim.skills, skills_job_dim.skill_id;


-- Q95 Find the average salary for jobs requiring SQL.
SELECT
  skills_dim.skills, AVG(job_postings_fact.salary_year_avg) AS avg_salary
FROM
  job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE skills_dim.skills = 'sql' AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills;


-- Q96 Find the average salary associated with each skill.
SELECT
  skills_dim.skills, AVG(job_postings_fact.salary_year_avg) AS avg_salary
FROM
  job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills;



-- Q97 Find the top 10 highest-paying skills.
SELECT
  skills_dim.skills, AVG(job_postings_fact.salary_year_avg) AS avg_salary
FROM
  job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.salary_year_Avg IS NOT NULL
GROUP BY skills_dim.skills
ORDER BY avg_salary DESC
LIMIT 10;


-- Q98 Find the top 10 most demanded skills among Data Engineers.
SELECT skills_dim.skills, COUNT(skills_job_dim.skill_id) AS skill_required_in_jobs
FROM skills_job_dim LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE skills_job_dim.job_id IN (SELECT job_id FROM job_postings_fact 
WHERE job_title_short = 'Data Engineer')
GROUP BY skills_job_dim.skill_id, skills_dim.skills
ORDER BY skill_required_in_jobs DESC
LIMIT 10;

-- Q99 Find companies hiring Data Engineers with SQL skills.
SELECT company_dim.name, job_postings_fact.job_title_short, skills_dim.skills FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Engineer' AND skills_dim.skills = 'sql'
GROUP BY company_dim.name, job_postings_fact.job_title_short, skills_dim.skills;


-- Q100 Find companies that posted more than 50 Data Engineer jobs.
SELECT company_dim.name, COUNT(job_postings_fact.job_id) FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id =company_dim.company_id
GROUP BY company_dim.company_id, company_dim.name;



-- Q101 Find the top 5 countries with the highest average salary for Data Engineer jobs.
SELECT 
  job_country, AVG(salary_year_avg) AS avg_salary 
FROM 
  job_postings_fact
WHERE job_title_short ='Data Engineer'
GROUP BY job_country
order by avg_salary DESC
LIMIT 5;



-- Q102 Find companies that have posted jobs in at least 5 different countries.
SELECT 
  company_id, COUNT( DISTINCT job_country) AS total_country
FROM 
  job_postings_fact
GROUP BY company_id
HAVING total_country > 5;


-- Q103 Find the top 10 companies by number of remote Data Engineer jobs.
SELECT 
  job_postings_fact.company_id, company_dim.name, COUNT(job_postings_fact.job_id) AS total_jobs
FROM 
  job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id =company_dim.company_id
WHERE job_postings_fact.job_title_short ='Data Engineer' AND job_work_from_home =true
GROUP BY job_postings_fact.company_id, company_dim.name
ORDER BY total_jobs DESC
LIMIT 10;



-- Q104 Find the average salary for each skill. Only include skills that appear in at least 100 jobs.
SELECT 
    skills_dim.skills, AVG(salary_year_avg) AS avg_salary, COUNT(job_postings_fact.job_id) 
FROM 
    job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY skills_dim.skills
HAVING COUNT(skills_job_dim.skill_id) > 100;


-- Q105 Find the top 20 skills required by Data Engineer jobs that are remote.
SELECT 
    skills_dim.skills, COUNT(job_postings_fact.job_id) AS total_jobs 
FROM 
    job_postings_fact
LEFT JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short ='Data Engineer' AND job_postings_fact.job_work_from_home =true
GROUP BY skills_dim.skills
ORDER BY total_jobs DESC
LIMIT 20;


-- Q106 Find companies whose average salary is greater than the overall average salary.
SELECT 
    company_dim.name, job_postings_fact.company_id, AVG(salary_year_avg) AS avg_salary 
FROM 
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
GROUP BY job_postings_fact.company_id, company_dim.name 
HAVING AVG(salary_year_avg) > (SELECT AVG(salary_year_avg) FROM job_postings_fact);


-- Q107 Find countries where the percentage of remote jobs is above 50%.
SELECT 
    job_country,
    AVG(job_work_from_home::int) * 100 AS remote_percentage
FROM 
    job_postings_fact
GROUP BY 
    job_country
HAVING 
    AVG(job_work_from_home::int) > 0.5;


-- Q108 Find companies that have posted both Data Analyst and Data Engineer jobs.
SELECT 
    c.name
FROM 
    job_postings_fact j
JOIN 
    company_dim c ON j.company_id = c.company_id
WHERE 
    j.job_title_short IN ('Data Analyst', 'Data Engineer')
GROUP BY 
    c.name
HAVING 
    COUNT(DISTINCT j.job_title_short) = 2;


-- Q109 Find the top 10 companies hiring for SQL skills.
SELECT 
    company_dim.name, COUNT(skills_dim.skills) AS total_jobs
FROM 
    job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
GROUP BY company_dim.name, skills_dim.skills
HAVING skills_dim.skills = 'sql'
ORDER BY total_jobs DESC
LIMIT 10;

