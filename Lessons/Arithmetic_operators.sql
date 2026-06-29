SELECT 
  job_id,
  job_title,
  job_title_short,
  job_location,
  job_via
FROM
  job_postings_fact
WHERE salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL;




SELECT 
  job_id,
  job_title,
  salary_hour_avg - 5 AS salary_hour_min,
  salary_hour_avg + 5 AS salary_hour_max,
  job_location ,
  job_via
FROM
  job_postings_fact
WHERE salary_hour_avg IS NOT NULL;





SELECT 
  job_id,
  job_title,
  salary_hour_avg * .80 AS salary_hour_min,
  salary_hour_avg * 1.2 AS salary_hour_max,
  job_location ,
  job_via
FROM
  job_postings_fact
WHERE salary_hour_avg IS NOT NULL;