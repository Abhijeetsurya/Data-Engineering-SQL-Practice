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



/* Q196 — POSITION()
Find the position of the word Data inside each job_title.*/

SELECT 
    job_title, POSITION('data' IN LOWER(job_title)) AS data_position
FROM 
    job_postings_fact;


/* Q197 — STRPOS()
Find the position of the character '-' inside job_title. */

SELECT 
    job_title, STRPOS(job_title, '-') AS dash_position 
FROM 
    job_postings_fact;


/* Q198 — POSITION() + Filtering
Find all jobs where the word Engineer appears somewhere inside job_title.*/

SELECT 
    job_id,
    job_title
FROM
    job_postings_fact
WHERE POSITION('Engineer' IN job_title) > 0;



/* Q199 — SPLIT_PART()
The job_location column may contain values such as:
New York, NY, USA
Chicago, IL, USA
Remote

Extract the first part of job_location before the first comma.
Return:
- job_location
- location_city */

SELECT 
    job_location,
    SPLIT_PART(job_location, ',', 1) AS location_city
FROM
    job_postings_fact;



/* Q200 — SPLIT_PART()
Extract the second part of job_location. 
 - we are not using second part because state is last part of job_location */
SELECT 
    job_location,
    SPLIT_PART(job_location, ',', -1) AS location_state
FROM
    job_postings_fact;


/* Q201 — SPLIT_PART() + TRIM()
Extract the second part of job_location and remove any unnecessary whitespace around it.
- we are not using second part because state is last part of job_location */

SELECT
    job_location,
    TRIM(SPLIT_PART(job_location, ',', -1)) AS clean_location_state
FROM
    job_postings_fact;



/* Q202 — CONCAT_WS()
Create a formatted location string by combining:
- job_title_short
- job_location
- job_schedule_type */

SELECT
    CONCAT_WS(' | ', job_title, job_location, job_schedule_type) AS job_summary
FROM
    job_postings_fact;



/* Q203 — 🔥 Text Parsing
Create a new column called job_title_prefix containing the text before the first space in job_title. */

SELECT
    job_title,
    SPLIT_PART(job_title, ' ', 1) AS job_title_prefix
FROM
    job_postings_fact;


/* Q204 — 🔥 Combined Text Challenge
Create a normalized company name from company_dim.name.*/


SELECT
    name,
    REPLACE(REPLACE(LOWE(RTRIM(name)), 'inc.', 'inc'), 'llc.', 'llc') AS normalized_company_name
FROM
    company_dim;


/* Q205 — 🚀 Final Text Functions Challenge
Using job_title, create a column called title_category based on the text contained anywhere in the title:
- Contains Data Engineer → Data Engineering
- Contains Data Analyst → Data Analytics
- Contains Data Scientist → Data Science
- Contains Machine Learning → Machine Learning
- Anything else → Other   */

SELECT
    job_id,
    job_title,
    CASE
        WHEN job_title LIKE '%Data Engineer%' THEN 'Data Engineering'
        WHEN job_title LIKE '%Data Analyst%' THEN 'Data Analytics'
        WHEN job_title LIKE '%Data Scientist%' THEN 'Data Science'
        WHEN job_title LIKE '%Machine Learning%' THEN 'Machine Learning'
    ELSE 'other' 
    END AS title_category
FROM
    job_postings_fact;