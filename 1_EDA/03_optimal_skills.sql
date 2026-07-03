/*
Question: What are the most optimal skills for data engineers-balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
    -This approach highlights skills that balance market demand and financial reward. It weights core skills approach
*/

SELECT 
   skills_dim.skills, ROUND(MEDIAN(job_postings_fact.salary_year_avg),0) AS Median_salary, 
   COUNT(job_postings_fact.salary_year_avg) AS corrected_demand_count, ROUND(LN(COUNT(job_postings_fact.*)), 1) AS LN_demand_count,
 ROUND( ROUND((MEDIAN(job_postings_fact.salary_year_avg))) * LN(COUNT(job_postings_fact.*))/1_000_000, 1) AS optimal_score
FROM
    job_postings_fact
INNER JOIN 
    skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Engineer' AND job_work_from_home = true AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY 
    skills_dim.skills
HAVING COUNT(job_postings_fact.*) > 100
ORDER BY 
    optimal_score DESC
LIMIT 25;
