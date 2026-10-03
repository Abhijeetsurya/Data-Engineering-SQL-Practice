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



/* Q186 — LENGTH()
Find the length of every job_title.
Return:
- job_title
- title_length */


SELECT
    job_title,
    LEN(job_title)
FROM
    job_postings_fact;


/* Q187 — LENGTH() + Filtering
Find all jobs where job_title contains more than 30 characters.
Return:
- job_id
- job_title
- title_length
Sort by title_length descending. */

SELECT 
    job_id,
    job_title,
    LENGTH(job_title) AS title_length
FROM
    job_postings_fact
WHERE title_length > 30
ORDER BY title_length;


/* Q188 — LEFT()
Return the first 10 characters of every job_title.
Return:
- job_title
- first_10_characters */

SELECT
    job_title,
    LEFT(job_title, 10) AS first_10_characters
FROM
    job_postings_fact;


/* Q189 — RIGHT()
Return the last 10 characters of every job_title.
Return:
- job_title
- last_10_characters */

SELECT
    job_title,
    RIGHT(job_title, 10) AS last_10_characters
FROM
    job_postings_fact;

/* Q190 — SUBSTRING()
Extract the first 15 characters from every job_title.
Return:
- job_title
- short_title */

SELECT 
    job_title,
    SUBSTRING(job_title, 1, 15) AS short_title
FROM
    job_postings_fact;



/* Q191 — SUBSTRING() + Filtering
Find jobs where the first 4 characters of job_title are Data.
Return:
- job_id
- job_title */

SELECT
    job_id,
    job_title
FROM
    job_postings_fact
WHERE SUBSTRING(job_title, 1, 4) = 'Data';


/* 192 — REPLACE()
Replace every occurrence of the word:
Data

with:
DATA

inside job_title. */

SELECT
    job_title,
    REPLACE(job_title, 'Data', 'DATA') AS modifies_title
FROM
    job_postings_fact;


/* Q193 — REPLACE() + LOWER()
Create a normalized version of job_title where:
1. Leading/trailing spaces are removed.
2. The entire title is converted to lowercase.
3. data is replaced with information. */

SELECT
    job_title,
    REPLACE(LOWER(TRIM(job_title)), 'data', 'information') AS normalized_title
FROM
    job_postings_fact;


/* Q194 — CONCAT()
Create a new column combining:
- job_title_short
- job_location
with a separator such as -.*/

SELECT
    job_title_short,
    job_location,
    CONCAT(job_title_short, ' - ', job_location) AS job_summary
FROM
    job_postings_fact;


/* Q195 — 🔥 Combined Text Challenge
Create a normalized job-title column using:
- TRIM()
- LOWER()
- REPLACE()  */

SELECT
    TRIM(LOWER(REPLACE(job_title, 'Data', 'information'))) AS normalized_title,
    count(TRIM(LOWER(REPLACE(job_title, 'Data', 'information')))) as total_jobs
FROM
    job_postings_fact
GROUP BY normalized_title
ORDER BY total_jobs DESC
LIMIT 10;