SELECT 
  COUNT(job_title_short)
FROM
  job_postings_fact
WHERE job_title_short = 'Data Engineer';
  


SELECT COUNT(*) FROM job_postings_fact;



SELECT 
  COUNT( DISTINCT  job_title_short) 
FROM 
  job_postings_fact;



SELECT 
  DISTINCT job_title_short 
FROM 
  job_postings_fact;



SELECT 
  SUM(salary_year_avg)/COUNT(salary_year_avg),
  AVG(salary_year_avg)
FROM
  job_postings_fact;


SELECT 
  job_country,
  job_title_short,
  AVG(salary_year_avg)
FROM
  job_postings_fact
GROUP BY
  job_country,
  job_title_short
ORDER BY 
  AVG(salary_year_avg);



SELECT 
  job_country,
  job_title_short,
  AVG(salary_year_avg) AS avg_salary,
  MAX(salary_year_avg),
  MIN(salary_year_avg)
FROM
  job_postings_fact
GROUP BY
  job_country,
  job_title_short
ORDER BY 
  avg_salary;



SELECT 
  job_title_short,
  AVG(salary_year_avg) AS avg_salary,
  MEDIAN(salary_year_avg) AS median_salary
FROM 
  job_postings_fact
GROUP BY 
  job_title_short
ORDER BY 
  avg_salary DESC;
  



SELECT 
  job_title_short,
  AVG(salary_year_avg) AS avg_salary,
  MEDIAN(salary_year_avg) AS median_salary
FROM 
  job_postings_fact
GROUP BY 
  job_title_short
HAVING
  MEDIAN(salary_year_avg) > 100_000
ORDER BY 
  avg_salary DESC;



SHOW TABLES;

SELECT * FROM job_postings_fact


SELECT * FROM skills_dim
LIMIT 5;



SELECT * FROM skills_job_dim
LIMIT 5;



SELECT *
FROM information_schema.table_constraints
WHERE table_catalog = 'data_jobs';