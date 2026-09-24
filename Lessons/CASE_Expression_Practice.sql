/* Q141 — Salary Category

Create a salary_category column:

>= 150000 → High
>= 100000 → Medium
< 100000 → Low

Return:

job_title
salary_year_avg
salary_category  */

SELECT
    job_title,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 150000 THEN 'High'
        WHEN salary_year_avg >= 100000 THEN 'Medium'
        WHEN salary_year_Avg < 100000 THEN 'Low'
    END AS salary_category
FROM
    job_postings_fact
WHERE salary_year_avg IS NOT NULL;



/* Q142 — Remote Status

Create:

Remote when job_work_from_home = TRUE
On-site otherwise

Return:

job_title
job_work_from_home
work_type  */

SELECT 
    job_title,
    job_work_from_home,
    CASE
        WHEN job_work_from_home = TRUE THEN 'Remote'
    ELSE
        'On-site' 
    END AS work_type
FROM
    job_postings_fact;


/* Q143 — Degree Requirement

Create:

Degree Not Mentioned
Degree Mentioned

using job_no_degree_mention. */

SELECT 
    job_id, 
    job_title,
    CASE
        WHEN job_no_degree_mention = TRUE THEN 'Degree Not Mentioned'
        WHEN job_no_degree_mention = FALSE THEN 'Degree Mentioned'
        END AS job_no_degree_mention
FROM
    job_postings_fact;


/* Q144 — Salary Availability

Create:

Salary Available when salary_year_avg IS NOT NULL
Salary Not Available otherwise. */

SELECT 
    job_id,
    job_title_short,
    CASE
        WHEN salary_year_Avg IS NOT NULL THEN 'Salary Available'
        ELSE 'Salary Not Available'
    END AS Salary_availability
FROM
    job_postings_fact;



/* Q145 — Data Engineer Salary Level

For Data Engineer jobs:

>= 200000 → Very High
>= 150000 → High
>= 100000 → Medium
< 100000 → Low  */

SELECT
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 200000 THEN 'Very High'
        WHEN salary_year_avg >= 150000 THEN 'High'
        WHEN salary_year_avg >= 100000 THEN 'Meduim'
        WHEN salary_year_avg < 100000 THEN 'Low'
    END AS Data_enginer_salary
FROM
    job_postings_fact
WHERE 
    job_title_short LIKE '%Data Engineer%' AND salary_year_avg IS NOT NULL;


/* Q146 — Remote + Salary Classification

Create:

Remote - High
Remote - Low
On-site - High
On-site - Low

Use:

Remote = job_work_from_home = TRUE
High = salary >= 150000  */

SELECT
    job_id,
    job_title_short,
    CASE 
        WHEN salary_year_avg >= 150000 AND job_work_from_home = TRUE THEN 'Remote High'
        WHEN salary_year_avg < 150000 AND job_work_from_home = TRUE THEN 'Remote Low'
        WHEN salary_year_avg >= 150000 AND job_work_from_home = FALSE THEN 'On-site High'
        ELSE 'On-site Low'
    END AS Remote_salary_classification
FROM
    job_postings_fact
WHERE salary_year_avg IS NOT NULL;