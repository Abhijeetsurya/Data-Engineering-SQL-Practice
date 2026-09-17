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


--- Q133. Find all Data Engineer jobs whose salary is equal to the highest Data Engineer salary.

SELECT * FROM job_postings_fact AS jpf
WHERE jpf.job_title_short = 'Data Engineer'
AND jpf.salary_year_avg == (SELECT MAX(salary_year_avg) FROM job_postings_fact WHERE job_title_short = 'Data Engineer');


-- Q134. Find the companies that have posted a Data Engineer job with a salary above the average Data Engineer salary.

SELECT cd.name AS company_name FROM job_postings_fact AS jpf
JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE jpf.job_title_short = 'Data Engineer'
AND jpf.salary_year_avg > (SELECT AVG(salary_year_avg) FROM job_postings_fact WHERE job_title_short = 'Data Engineer');



-- Q135: Salary above own company average

SELECT cd.name AS company_name, jpf.job_title_short, jpf.salary_year_avg
FROM job_postings_fact AS jpf
JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE jpf.salary_year_avg > (SELECT AVG(salary_year_avg) FROM job_postings_fact AS jpf2 WHERE jpf2.company_id = jpf.company_id);


-- Q136: Company with highest average salary

SELECT cd.name AS company_name, AVG(jpf.salary_year_avg) AS avg_salary
FROM job_postings_fact AS jpf
JOIN company_dim AS cd ON jpf.company_id = cd.company_id
GROUP BY cd.name
ORDER BY avg_salary DESC
LIMIT 1;


-- Q137: Second-highest distinct salary

SELECT DISTINCT salary_year_avg
FROM job_postings_fact
ORDER BY salary_year_avg DESC
LIMIT 1 OFFSET 1;

-- Q138: Second-highest Data Engineer salary

SELECT DISTINCT salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Engineer'
ORDER BY salary_year_avg DESC
LIMIT 1 OFFSET 1;


--- Q139: Companies above average job count

SELECT cd.name AS company_name, COUNT(jpf.job_id) AS job_count
FROM job_postings_fact AS jpf
JOIN company_dim AS cd ON jpf.company_id = cd.company_id
GROUP BY cd.name
HAVING COUNT(jpf.job_id) > (SELECT AVG(job_count) FROM (SELECT COUNT(job_id) AS job_count FROM job_postings_fact GROUP BY company_id) AS subquery);



--- Q140: Countries above average Data Engineer job count

SELECT jpf.job_country, COUNT(jpf.job_id) AS job_count
FROM job_postings_fact AS jpf
WHERE jpf.job_title_short = 'Data Engineer'
GROUP BY jpf.job_country
HAVING COUNT(jpf.job_id) > (SELECT AVG(job_count) FROM (SELECT COUNT(job_id) AS job_count FROM job_postings_fact WHERE job_title_short = 'Data Engineer' GROUP BY job_country) AS subquery);
