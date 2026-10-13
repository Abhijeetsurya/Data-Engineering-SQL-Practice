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
    ) AS 