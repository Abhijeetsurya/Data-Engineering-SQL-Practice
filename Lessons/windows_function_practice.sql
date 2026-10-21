/* Q216 — OVER()
Calculate the total number of job postings and display that total alongside every job.*/

SELECT
    job_id,
    job_title,
    COUNT(job_id) OVER(

    )  AS total_jobs
FROM
    job_postings_fact;


/* Q217 — PARTITION BY
Calculate the total number of job postings for each job_title_short. Keep every individual job in the output.*/

SELECT
    job_id,
    job_title_short,
    COUNT(job_title_short) OVER( 
        PARTITION BY job_title_short
    ) AS total_jobs
FROM
    job_postings_fact;

 /* Q218 — AVG() OVER()
Display each job's yearly salary alongside the average yearly salary across all job postings. */

SELECT 
    job_id,
    job_title,
    salary_year_avg,
    AVG(salary_year_avg) OVER(
        PARTITION BY job_id
    ) AS avg_yearly_salary
FROM
    job_postings_fact;


/* Q219 — AVG() OVER(PARTITION BY)
Display each job's yearly salary alongside the average yearly salary for its job-title category.*/

SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    AVG(salary_year_avg) OVER(
        PARTITION BY job_title_short
    ) AS overall_avg_job
FROM
    job_postings_fact;

/* Q220 — Window Function vs. GROUP BY
Calculate the total number of job postings for each company while retaining individual job records in the output.*/

SELECT
    job_id,
    company_id,
    COUNT(job_id)  OVER(
        PARTITION BY company_id
    ) AS company_job_count
FROM
    job_postings_fact;

/* Q221 — ROW_NUMBER()
Assign a unique sequential number to every job, ordered by salary_year_avg from highest to lowest. 
Put jobs with missing salaries last.*/

SELECT 
    job_id,
    job_title,
    salary_year_avg,
    ROW_NUMBER() OVER(
        ORDER BY salary_year_avg DESC
    ) AS row_number
FROM
    job_postings_fact;

/* Q222 — RANK()
Rank jobs by yearly salary from highest to lowest. Jobs with equal salaries should receive the same rank, 
with gaps after ties. */

SELECT
    job_id,
    job_title,
    salary_year_avg,
    RANK() OVER(
        ORDER BY salary_year_avg DESC
    ) AS salary_rank
FROM
    job_postings_fact;

/* Q223 — DENSE_RANK()
Rank jobs by yearly salary from highest to lowest, without gaps between ranks after ties.*/

SELECT
    job_id,
    job_title,
    salary_year_avg,
    DENSE_RANK() OVER(
        ORDER BY salary_year_avg DESC
    ) AS salary_dense_rank
FROM
    job_postings_fact;

/* Q224 — Ranking Within Categories
Assign a salary rank to every job within its own job_title_short category, from highest to lowest yearly salary.*/

SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    RANK() OVER(
        PARTITION BY job_title_short
        ORDER BY salary_year_avg DESC
    ) AS category_salary_rank
FROM
    job_postings_fact
WHERE salary_year_avg IS NOT NULL;


/* Q225 — Top-Paying Jobs 🔥
Find the top three highest-paid jobs within each job_title_short category.*/

SELECT
    job_id,
    job_title,
    job_title_short,
    salary_year_avg,
    RANK() OVER(
        PARTITION BY job_title_short
        ORDER BY salary_year_avg
    ) AS salary_rank
FROM 
    job_postings_fact
WHERE salary_year_avg IS NOT NULL
QUALIFY salary_rank >= 3;


/* Q226 — Running Total
Calculate a running total of job postings ordered by job_posted_date, from oldest to newest.*/

SELECT 
    job_id,
    DATE(job_posted_date) AS job_posted_date,
    COUNT(job_id) OVER(
        PARTITION BY DATE(job_posted_date)
    ) AS running_job_count
FROM
    job_postings_fact;


-- Q227:- Return every job and add the total number of rows in the table using a window function.

SELECT
    job_id,
    job_title,
    COUNT(job_id) OVER() AS total_jobs
FROM
    job_postings_fact;


/* Q228 - Return every job and show how many postings belong to the same job_title_short category. */

SELECT
    job_id, 
    job_title_short,
    COUNT(job_id) OVER(
        PARTITION BY job_title_short
    ) AS total_jobs_by_title
FROM
    job_postings_fact;

/* Q229 - Return every job, its salary_year_avg, and the overall average salary across the table. Keep jobs
      with missing salaries. */

SELECT
    job_id,
    job_title,
    salary_year_avg,
    AVG(salary_year_avg) OVER() AS overall_avg_salary
FROM
    job_postings_fact;  

/* Q230 - Return every job with the total number of postings belonging to its company_id.*/

SELECT
    job_id,
    company_id,
    COUNT(job_id) OVER(
        PARTITION BY company_id
    ) AS total_postings_by_company
FROM
    job_postings_fact;

/* Q231 - Return every job with its salary and the average salary for its job_title_short category.*/

SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    AVG(salary_year_avg) OVER(
        PARTITION BY job_title_short
    ) AS avg_salary_by_title
FROM
    job_postings_fact;


/*Q232

Number all job postings

Return job_id, job_title, salary_year_avg, and a row number for every posting, 
with the highest salaries first. Put missing salaries last.*/

SELECT
    job_id,
    job_title,
    salary_year_avg,
    ROW_NUMBER() OVER( 
        ORDER BY salary_year_avg DESC
    ) AS salary_rank
FROM
    job_postings_fact;

/* Q233
Number postings within each category
Return job_id, job_title_short, salary_year_avg, 
and a row number that restarts for each job_title_short category. Highest salary should be first.*/

SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    ROW_NUMBER() OVER(
        PARTITION BY job_title_short
        ORDER BY salary_year_avg DESC
    ) AS row_number_by_title
FROM
    job_postings_fact;

/* Q234

Find the highest-paid job in each category

Use ROW_NUMBER() to return exactly one posting per job_title_short category. 
Include the job title and salary. Exclude postings with missing annual salaries.*/

SELECT 
    
    job_id,
    job_title_short,
    salary_year_avg,
    ROW_NUMBER() OVER(
        PARTITION BY job_title_short
        ORDER BY salary_year_avg DESC
    ) AS row_number_by_title
FROM
    job_postings_fact
WHERE 
    salary_year_avg IS NOT NULL;


/* Q235:- Find the top three jobs per category

Return up to three postings per job_title_short category, ordered from highest to lowest annual salary. 
Exclude missing annual salaries.*/

SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    RANK() OVER(
        PARTITION BY job_title_short
        ORDER BY salary_year_avg DESC
    ) AS rank_by_title
FROM
    job_postings_fact
WHERE 
    salary_year_avg IS NOT NULL
QUALIFY rank_by_title <= 3;

