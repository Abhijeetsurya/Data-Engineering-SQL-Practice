SELECT * FROM job_postings_fact;

SELECT 
      job_id, job_location 
FROM 
      job_postings_fact
LIMIT 3;


SELECT 
      job_title_short,
      job_title 
FROM 
      job_postings_fact;




SELECT DISTINCT job_title_short FROM job_postings_fact;



SELECT 
      job_title_short, 
      job_location,
      salary_year_avg
FROM 
      job_postings_fact
WHERE 
      salary_year_avg IS NOT NULL;




SELECT 
      job_title_short,
      job_location,
      job_via,
      salary_year_avg
FROM
      job_postings_fact
ORDER BY
      salary_year_avg ASC;




SELECT 
      job_title_short,
      job_location,
      job_via,
      salary_year_avg
FROM
      job_postings_fact
WHERE 
      job_title ='Data Engineer'
ORDER BY
      salary_year_avg ASC;




SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg
FROM  
      job_postings_fact
WHERE job_work_from_home = True;






SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg
FROM  
      job_postings_fact
WHERE job_location ='Anywhere';




SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg,
      job_schedule_type
FROM  
      job_postings_fact
WHERE
      job_schedule_type !='Contractor';





SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg,
      job_schedule_type
FROM  
      job_postings_fact
WHERE
       salary_year_avg > 100000;




SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg,
      job_schedule_type
FROM  
      job_postings_fact
WHERE  job_location = 'Anywhere'
       AND job_work_from_home = FALSE;





SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg,
      job_schedule_type
FROM  
      job_postings_fact
WHERE  job_title_short = 'Data Engineer'
       OR job_title_short = 'Senior Data Engineer';








SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg,
      job_schedule_type
FROM  
      job_postings_fact
WHERE NOT 
       (job_location = 'Anywhere'
       AND job_work_from_home = FALSE);






SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg,
      job_schedule_type
FROM  
      job_postings_fact
WHERE --salary_year_avg BETWEEN 100000 AND 200000;
        salary_year_avg > 100000 AND salary_year_avg < 200000;




 SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg,
      job_schedule_type
FROM  
      job_postings_fact
WHERE  job_title_short IN ('DataEngineer', 'Senior Data Engineer');




SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg,
      job_schedule_type
FROM  
      job_postings_fact
WHERE job_title_short ='Data Engineer' AND salary_year_avg BETWEEN 75000 AND 100000;






SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg,
      job_schedule_type
FROM  
      job_postings_fact
WHERE (job_title_short ='Data Engineer' AND salary_year_avg BETWEEN 75000 AND 100000)
      OR job_title_short ='Data Analyst' AND salary_year_avg BETWEEN 100000 AND 125000;







SELECT  
      job_id,
      job_title_short,
      job_location,
      job_via,
      salary_year_avg,
      job_schedule_type
FROM  
      job_postings_fact
WHERE
      (
      (job_title_short ='Data Engineer' AND salary_year_avg BETWEEN 75000 AND 100000)
      OR job_title_short ='Data Analyst' AND salary_year_avg BETWEEN 100000 AND 125000
      ) AND (job_location IN('Bentoville', 'AR', 'San Diego, CA')
      OR (job_work_from_home = TRUE))
      ORDER BY 
          salary_year_avg;








