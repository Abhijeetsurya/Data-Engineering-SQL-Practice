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
WHERE job_country = 'India'


-- Q7 Display jobs where salary information is available.
SELECT * FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL;


-- Q8 Display jobs that mention health insurance.
SELECT * FROM job_postings_fact
WHERE job_health_insurance IS true



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
WHERE job_country LIKE 'United States'

-- Q14 Find remote Data Engineer jobs.
SELECT * FROM job_postings_fact
WHERE job_work_from_home = true;


-- Q15 Find jobs with salary above 100000.
SELECT * FROM job_postings_fact
WHERE salary_year_avg > 100000;


-- Q16 Find jobs with salary between 100000 and 200000.
SELECT * FROM job_postings_fact
WHERE salary_year_avg BETWEEN 100000 AND 200000;



