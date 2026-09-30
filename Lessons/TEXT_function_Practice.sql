-- Q181 Return every job's job_title in lowercase.

SELECT
    job_title,
    LOWER(job_title) AS job_title
FROM
    job_postings_fact;


-- Q182 Return every company's name in uppercase.

SELECT 
    name, UPPER(name) AS company_name_upper
FROM
    company_dim;


-- Q183 Return job_title_short after removing leading/trailing spaces.

SELECT 
    job_title_short,
    TRIM(job_title_short) AS clean_title
FROM
    job_postings_fact;


-- Q184 Return job_title_short normalized to lowercase and with leading/trailing spaces removed.

SELECT 
    job_title_short,
    LOWER(TRIM(job_title_short)) AS normalized_title
FROM 
    job_postings_fact;

-- Q185 🔥 Find the number of unique normalized job-title categories using:

SELECT
    COUNT(
        DISTINCT TRIM(LOWER(job_title))
    ) AS unique_normalized_titles
FROM job_postings_fact;