-- Lower Function
SELECT LOWER('Sql');


-- UPPER Function
SELECT UPPER('sql');


-- LEFT Function
SELECT LEFT('SQL', 2);

-- SUBSTRING Functio
SELECT SUBSTRING('SQL', 2, 1);

-- CONCAT Function
SELECT CONCAT('SQL', '-', 'Function');

SELECT CONCAT('SQL' || '-' || 'Function');


-- TRIM FUNCTION
SELECT TRIM('   SQL ');


-- REPLACE FUNCTION

SELECT REPLACE('SQL', 'Q', '_');

-- REGEXP_REPLACE

SELECT REGEXP_REPLACE('abhisurya1421@gmail.com', '^.*(@)', '\1');


-- Cleanup this using Text Funtions

WITH title_lower AS (
    SELECT
        job_title,
        LOWER(TRIM(job_title)) AS job_title_clean
    FROM
        job_postings_fact
)

SELECT
    job_title,
    CASE
        WHEN job_title_clean LIKE '%data%' 
            AND job_title_clean LIKE '%analyst%' THEN 'Data Analyst'
        WHEN job_title_clean LIKE '%data%'
            AND job_title_clean LIKE '%scientist%' THEN 'Data Scientist'
        WHEN job_title_clean LIKE '%data%'
            AND job_title_clean LIKE '%engineer%' THEN 'Data Engineer'
        ELSE 'Other'
    END AS job_title_category
FROM title_lower
ORDER BY RANDOM()
LIMIT 30;
