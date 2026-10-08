-- Count Rows - Aggregation Only

SELECT
    COUNT(*)
FROM
    job_postings_fact;

-- Count Rows - Window funtion

SELECT
    job_id,
    COUNT(*) OVER()
FROM
    job_postings_fact;


-- PARTITION BY - Find hourly salary

SELECT 
    job_id,
    job_title_short,
    company_id,
    salary_hour_avg,
    AVG(salary_hour_avg) OVER(
        PARTITION BY job_title_short, company_id
    )
FROM
    job_postings_fact
WHERE salary_hour_avg IS NOT NULL
ORDER BY RANDOM();


SELECT
    job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER(
        ORDER BY salary_hour_Avg DESC
    ) 
FROM
    job_postings_fact
WHERE salary_hour_avg IS NOT NULL
ORDER BY salary_hour_avg DESC;


--- PARTITION BY & ORDER BY - Running Average Hourly Salary

SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    AVG(salary_hour_avg) OVER(
        PARTITION BY job_title_short
        ORDER BY job_posted_date
    )  AS running_avg_hourly_by_title
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL AND
    job_title_short = 'Data Engineer'
ORDER BY 
    job_title_short,
    job_posted_date
LIMIT 10;



--- PARTITION BY & ORDER BY - Ranking by job_title_short

SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER(
        PARTITION BY job_title_short
        ORDER BY salary_hour_avg DESC
    )  AS rank_hourly_salary
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
ORDER BY 
    salary_hour_avg DESC,
    job_title_short
LIMIT 10;



-- Aggregation funtion - SUM
SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    SUM(salary_hour_avg) OVER(
        PARTITION BY job_title_short
        ORDER BY job_posted_date
    )  AS running_avg_hourly_by_title
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL AND
    job_title_short = 'Data Engineer'
ORDER BY 
    job_title_short,
    job_posted_date
LIMIT 10;



-- Aggregation funtion - MIN

SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    MIN(salary_hour_avg) OVER(
        PARTITION BY job_title_short
        ORDER BY job_posted_date
    )  AS running_avg_hourly_by_title
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL AND
    job_title_short = 'Data Engineer'
ORDER BY 
    job_title_short,
    job_posted_date
LIMIT 10;



-- Aggregation funtion - MAX

SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    MAX(salary_hour_avg) OVER(
        PARTITION BY job_title_short
    )  AS running_avg_hourly_by_title
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL AND
    job_title_short = 'Data Engineer'
ORDER BY 
    job_title_short,
    job_posted_date
LIMIT 10;


-- Ranking Functions - RANK() vs DENSE_RANK


SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER(
       ORDER BY salary_hour_avg DESC
    )  AS rank_hourly_salary
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
ORDER BY salary_hour_Avg DESC
LIMIT 140;


-- DENSE_RANK


SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    DENSE_RANK() OVER(
       ORDER BY salary_hour_avg DESC
    )  AS rank_hourly_salary
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
ORDER BY salary_hour_Avg DESC
LIMIT 140;



-- ROW_NUMBER() Providing a new job_id

SELECT 
    *,
    ROW_NUMBER() OVER(
        ORDER BY job_posted_date
    )
FROM
    job_postings_fact
ORDER BY job_posted_Date
LIMIT 20;



--  ROW_NUMBER

SELECT 
    job_id,
    job_title_short,
    salary_hour_avg,
    ROW_NUMBER() OVER(
       ORDER BY salary_hour_avg DESC
    )  AS rank_hourly_salary
FROM
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
ORDER BY rank_hourly_salary
LIMIT 140;