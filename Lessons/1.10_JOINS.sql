
SELECT 
    job_postings_fact.job_id, 
    job_postings_fact.job_title_short,
    job_postings_fact.company_id,
    company_dim.name
FROM 
    job_postings_fact
LEFT JOIN 
    company_dim ON job_postings_fact.company_id = company_dim.company_id
LIMIT 10;



SELECT 
    job_postings_fact.*,
    company_dim.*
FROM 
    job_postings_fact
LEFT JOIN 
    company_dim ON job_postings_fact.company_id = company_dim.company_id
LIMIT 10;




SELECT COUNT(*) FROM job_postings_fact;


