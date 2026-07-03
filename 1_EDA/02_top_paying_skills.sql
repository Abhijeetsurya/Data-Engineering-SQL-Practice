/*
Questions: What are the highest-paying skills for data engineering
- Calculate the median salary for each skill required for Data Engineer positions
- Focus on remmote positions with specified salaries
- Include skill frequesny to identify both salary and demand
- Why? Helps Identify which skills command the highest compensation while also showing
    how common those skills are, providing a more complete picture for skill development priopities
*/


SELECT 
   skills_dim.skills, ROUND(MEDIAN(job_postings_fact.salary_year_avg),0) AS Median_salary, COUNT(job_postings_fact.*) AS demand_count
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
HAVING COUNT(job_postings_fact.*) > 100
ORDER BY 
    Median_salary DESC
LIMIT 25;

/*
Key Insights:

    - Rust is the highest-paying skill, with a median salary of $210,000, but demand is relatively low (232 job postings). This indicates that niche, specialized skills command premium salaries.

    - Terraform and Golang offer an excellent balance of salary and demand.

    - Terraform: $184,000 median salary, 3,248 postings
    
    - Golang: $184,000 median salary, 912 postings
    
    -Airflow has the highest demand among all skills, appearing in 9,996 job postings, while still maintaining a strong median salary of $150,000.
    
    - Cloud and DevOps technologies dominate the market, with skills such as Terraform, Kubernetes, Ansible, and Airflow showing both high salaries and strong demand.
    
    - Demand and salary are not strongly correlated. For example:
    
    - Rust has the highest salary but low demand.
    
    - Airflow has the highest demand but a comparatively lower salary.
    
    - Specialized technologies such as Neo4j, GraphQL, and FastAPI offer high salaries despite having fewer job postings, suggesting a scarcity of skilled professionals.
    
    - General web development skills like CSS, Node.js, and TypeScript remain in demand but offer comparatively lower median salaries than specialized infrastructure and backend technologies.

    ┌────────────┬───────────────┬──────────────┐
│   skills   │ Median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ bitbucket  │      155000.0 │          478 │
│ django     │      155000.0 │          265 │
│ crystal    │      154224.0 │          129 │
│ c          │      151500.0 │          444 │
│ atlassian  │      151500.0 │          249 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ ruby       │      150000.0 │          736 │
│ node       │      150000.0 │          179 │
│ airflow    │      150000.0 │         9996 │
│ css        │      150000.0 │          262 │
│ redis      │      149000.0 │          605 │
│ vmware     │      148798.0 │          136 │
│ ansible    │      148798.0 │          475 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘ 
 */