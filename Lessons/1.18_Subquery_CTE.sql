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

