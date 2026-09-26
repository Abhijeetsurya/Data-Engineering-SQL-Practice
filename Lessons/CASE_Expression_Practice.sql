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
        WHEN salary_year_avg >= 100000 THEN 'Medium'
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




/* Q147
Classify job_schedule_type:
- Full Time
- Part Time
- Contract
- Other  */

SELECT 
    job_schedule_type,
    CASE
        WHEN job_schedule_type = 'Full-Time' THEN 'Full Time'
        WHEN job_schedule_type = 'Part-Time' THEN 'Part Time'
        WHEN job_schedule_type = 'Contract' THEN 'contract'
        ELSE 'Other'
    END AS job_schedule_category
FROM job_postings_fact;


/* Q148
Create salary ranges:
- 0-50K
- 50K-100K
- 100K-150K
- 150K+ */

SELECT
    salary_year_avg,
    CASE 
        WHEN salary_year_avg < 50000 THEN '0-50K'
        WHEN salary_year_avg < 100000 THEN '50K-100K'
        WHEN salary_year_avg < 150000 THEN '100K-150K'
        ELSE '150K+'
    END AS Salary_range
FROM
    job_postings_fact
WHERE salary_year_avg IS NOT NULL;


/* Q149
Create a salary data-quality status:
- Valid → salary > 0
- Invalid → salary <= 0
- Missing → salary IS NULL */

SELECT 
    salary_year_avg,
    CASE
        WHEN salary_year_avg > 0 THEN 'Valid'
        WHEN salary_year_avg <= 0 THEN 'Invalid'
        WHEN salary_year_avg IS NULL THEN 'Missing'
    END AS salary_data_quality_status
FROM
    job_postings_fact;


/* Q150
Classify:
- Data Engineer → Engineering
- Data Scientist → Data Science
- Data Analyst → Analytics
- Machine Learning Engineer → ML Engineering
- Everything else → Other */

SELECT
    job_title_short,
    CASE
        WHEN job_title_short = 'Data Engineer' THEN 'Engineering'
        WHEN job_title_short = 'Data Scientist' THEN 'Data Science'
        WHEN job_title_short = 'Data Analyst' THEN 'Analytics'
        WHEN job_title_short = 'Machine Learning Engineer' THEN 'ML Engineer'
        ELSE 'other'
    END AS job_type
FROM
    job_postings_fact;


