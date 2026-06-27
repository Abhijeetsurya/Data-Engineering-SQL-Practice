
# -------------------------------------LEFT JOIN----------------------------------------------------------

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


#--------------------------------------------RIGHT JOIN---------------------------------------------------

SELECT COUNT(*) FROM job_postings_fact;


SELECT 
    job_postings_fact.job_id, 
    job_postings_fact.job_title_short,
    job_postings_fact.company_id,
    company_dim.name
FROM 
    job_postings_fact
RIGHT JOIN 
    company_dim ON job_postings_fact.company_id = company_dim.company_id
LIMIT 10;


#-------------------------------------------INNER JOIN------------------------------------------------


SELECT 
    job_postings_fact.job_id, 
    job_postings_fact.job_title_short,
    job_postings_fact.company_id,
    company_dim.name
FROM 
    job_postings_fact
INNER JOIN 
    company_dim ON job_postings_fact.company_id = company_dim.company_id
LIMIT 10;


# ---------------------------------------FULL OUTER JOIN-----------------------------------------------------



SELECT 
    job_postings_fact.job_id, 
    job_postings_fact.job_title_short,
    job_postings_fact.company_id,
    company_dim.name
FROM 
    job_postings_fact
FULL OUTER JOIN 
    company_dim ON job_postings_fact.company_id = company_dim.company_id
LIMIT 10;





SELECT *
FROM skills_job_dim
LIMIT 10;

SELECT *
FROM skills_dim 
LIMIT 10;



SELECT * FROM job_postings_fact
LIMIT 10;

