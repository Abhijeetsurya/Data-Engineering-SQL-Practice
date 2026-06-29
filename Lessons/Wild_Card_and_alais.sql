SELECT 
  job_id,
  job_title,
  job_title_short,
  job_location,
  job_via
FROM
  job_postings_fact
WHERE 
  job_location = 'Columbus, OH';



SELECT 
  job_id,
  job_title,
  job_title_short,
  job_location,
  job_via
FROM
  job_postings_fact
WHERE 
  job_location LIKE 'Columbus, __';




SELECT 
  job_id,
  job_title,
  job_title_short,
  job_location,
  job_via
FROM
  job_postings_fact
WHERE 
  job_location LIKE 'Columbus, OH';



SELECT 
  job_id,
  job_title,
  job_title_short,
  job_location,
  job_via
FROM 
  job_postings_fact  AS jpf
WHERE
  job_title LIKE '%Data Analyst%';




SELECT 
  job_id AS id,
  job_title,
  job_title_short,
  job_location AS location,
  job_via AS platform
FROM
  job_postings_fact
WHERE 
  (job_title LIKE '%Data%' OR job_title LIKE '%Software%') 
  AND job_title LIKE '%Engineer%'
  AND NOT (job_title LIKE '%Senior%' OR job_title LIKE '%Sr') 