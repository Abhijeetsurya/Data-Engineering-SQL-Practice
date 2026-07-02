/* 
Questions: What are the most in-demand skills for data engineers?
- Identify the top 10 in-demand skills for data engineers
- Focus on remotejob postings
- Why? Rectrieves the  top 10 skills with highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work
*/

SELECT 
   skills_dim.skills, COUNT(job_postings_fact.*) AS demand_count 
FROM
    job_postings_fact
INNER JOIN 
    skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Engineer' AND job_work_from_home = true
GROUP BY 
    skills_dim.skills
ORDER BY 
    demand_count DESC
LIMIT 20;

/*

Key takeaways:
    - SQL and Python remain the foundational skills fro Data Engineers
    - cloud platforms like (AWS, Azure) are critical for modern data engineering
    - Big data tools like Spark continue to be higly values
    - data pipeline tools  (Airflow, Snowflake, Databricks) show growing demand
    - Java  GCP round out the top 10 most requested skills
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
│ kafka      │         6415 │
│ scala      │         6304 │
│ redshift   │         5737 │
│ hadoop     │         5447 │
│ pyspark    │         4898 │
│ git        │         4641 │
│ power bi   │         4600 │
│ nosql      │         4514 │
│ tableau    │         4402 │
│ docker     │         4316 │
└────────────┴──────────────┘

*/

