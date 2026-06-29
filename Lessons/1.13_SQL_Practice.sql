-- Q1 Display all columns from job_postings_fact.

SELECT * FROM job_postings_fact;


-- Q2 Display only: job_id, job_title, job_location
SELECT job_id, job_title, job_location FROM
job_postings_fact;


-- Q3 Display the first 20 rows.
SELECT * FROM job_postings_fact;
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
WHERE job_work_from_home = true;


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
WHERE salary_year_avg IS NULL;


