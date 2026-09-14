--- Q127. Find all Data Engineer jobs whose annual salary is higher than the overall average annual salary.
USE data_jobs;

SELECT *   
FROM job_postings_fact AS jpf
WHERE jpf.job_title_short = 'Data Engineer' 
AND jpf.salary_year_avg > (SELECT AVG(salary_year_avg) FROM job_postings_fact)
LIMIT 10;



-- Q128. Find companies that have posted at least one job with a salary higher than the overall average salary.

SELECT DISTINCT cd.name AS company_name
FROM job_postings_fact AS jpf
JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE jpf.salary_year_avg > (SELECT AVG(salary_year_avg) FROM job_postings_fact)
GROUP BY cd.name;



--- Q129. Find the jobs with the highest annual salary.

SELECT * FROM job_postings_fact
WHERE salary_year_avg = (SELECT MAX(salary_year_avg) FROM job_postings_fact);




--- Q130 Find all Data Engineer jobs whose salary is higher than the average Data Engineer salary.

SELECT * FROM job_postings_fact AS jpf
WHERE jpf.job_title_short = 'Data Engineer'
AND jpf.salary_year_avg > (SELECT AVG(salary_year_avg) FROM job_postings_fact WHERE job_title_short = 'Data Engineer');



---Q131. Find companies whose average salary is higher than the overall average salary.

SELECT cd.name AS company_name, AVG(jpf.salary_year_avg) AS avg_salary
FROM job_postings_fact AS jpf
JOIN company_dim AS cd ON jpf.company_id = cd.company_id
GROUP BY cd.name
HAVING AVG(jpf.salary_year_avg) > (SELECT AVG(salary_year_avg) FROM job_postings_fact);


--- Q132. Find the countries whose average Data Engineer salary is higher than the average Data Engineer salary across all countries.
SELECT jpf.job_country, AVG(jpf.salary_year_avg) AS avg_salary
FROM job_postings_fact AS jpf
WHERE jpf.job_title_short = 'Data Engineer'
GROUP BY jpf.job_country
HAVING AVG(jpf.salary_year_avg) > (SELECT AVG(salary_year_avg) FROM job_postings_fact WHERE job_title_short = 'Data Engineer');


DESCRIBE job_postings_fact;