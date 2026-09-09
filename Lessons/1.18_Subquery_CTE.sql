-- Subquery

SELECT * FROM (
        SELECT * FROM job_postings_fact
        WHERE salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL
)
LIMIT 10;

WITH valid_salaries AS (
    SELECT * FROM job_postings_fact
    WHERE salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL
)
SELECT * FROM valid_salaries
LIMIT 10;

--- Scenerio 1 - Subquery in 'SELECT'
-- Show each job's salary next to the overall market median:

SELECT job_title_short,
        salary_year_avg,
        (
                SELECT MEDIAN(salary_year_avg)
                FROM job_postings_fact
        ) AS market_median_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
LIMIT 10;


--- Scenerio 2 - Subquery in 'FROM'
-- Stage only jobs that are remote before aggregating to determine the remote median salary per job

SELECT job_title_short,
        MEDIAN(salary_year_avg) AS remote_median_salary,
        (
            SELECT MEDIAN(salary_year_avg)
            FROM job_postings_fact
            WHERE job_work_from_home = TRUE
        ) AS market_remote_median_salary
FROM (
    SELECT job_title_short, salary_year_avg
    FROM job_postings_fact
    WHERE job_work_from_home = TRUE
) AS clean_jobs
GROUP BY job_title_short
LIMIT 10;


-- Scenerio 3 - Subquery in 'HAVING'
-- keep only job title whose median salary is above the overall market median salary

SELECT job_title_short,
        MEDIAN(salary_year_avg) AS remote_median_salary,
        (
            SELECT MEDIAN(salary_year_avg)
            FROM job_postings_fact
            WHERE job_work_from_home = TRUE
        ) AS market_remote_median_salary
FROM (
    SELECT job_title_short, salary_year_avg
    FROM job_postings_fact
    WHERE job_work_from_home = TRUE
) AS clean_jobs
GROUP BY job_title_short
HAVING MEDIAN(salary_year_avg) > (
    SELECT MEDIAN(salary_year_avg)
    FROM job_postings_fact
    WHERE job_work_from_home = TRUE
)
LIMIT 10;



-- CTE Example
-- Compare how much more (or less) remot roles pay compared to the onsite roles for each job title.
-- Use a CTE to calculate the median salary by title and work arrangement, then compare those medians.
    WITH title_medians AS (
        SELECT 
            job_title_short,
            job_work_from_home,
            MEDIAN(salary_year_avg):: INT AS median_salary
        FROM job_postings_fact
        WHERE job_country = 'India'
        GROUP BY job_title_short, job_work_from_home
    )
    SELECT 
        r.job_title_short,
        r.median_salary AS remote_median_salary,
        o.median_salary AS onsite_median_salary
    FROM title_medians AS r
    INNER JOIN title_medians AS o
        r.job_title_short = o.job_title_short
    WHERE r.job_work_from_home = TRUE;

