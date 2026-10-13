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
    job_postings_fact
WHERE salary_year_avg IS NOT NULL;


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