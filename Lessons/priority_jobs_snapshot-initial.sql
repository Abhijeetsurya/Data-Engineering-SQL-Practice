CREATE SCHEMA IF NOT EXISTS data_jobs;
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS main;

CREATE OR REPLACE TABLE data_jobs.company_dim (
    company_id INTEGER PRIMARY KEY,
    name VARCHAR
);

CREATE OR REPLACE TABLE data_jobs.job_postings_fact (
    job_id INTEGER PRIMARY KEY,
    job_title_short VARCHAR,
    company_id INTEGER,
    job_posted_date TIMESTAMP,
    salary_year_avg DOUBLE
);

CREATE OR REPLACE TABLE staging.priority_roles (
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR(255),
    priority_level INTEGER
);

INSERT INTO data_jobs.company_dim (company_id, name)
VALUES
    (1, 'Meta'),
    (2, 'Google'),
    (3, 'Amazon');

INSERT INTO data_jobs.job_postings_fact (job_id, job_title_short, company_id, job_posted_date, salary_year_avg)
VALUES
    (101, 'Data Engineer', 1, '2024-01-10 00:00:00', 180000),
    (102, 'Senior Data Engineer', 2, '2024-02-12 00:00:00', 210000),
    (103, 'Software Engineer', 3, '2024-03-15 00:00:00', 175000),
    (104, 'Data Engineer', 3, '2024-04-20 00:00:00', 185000);

INSERT INTO staging.priority_roles (role_id, role_name, priority_level)
VALUES
    (1, 'Data Engineer', 1),
    (2, 'Senior Data Engineer', 1),
    (3, 'Software Engineer', 3)
ON CONFLICT (role_id) DO UPDATE SET
    role_name = EXCLUDED.role_name,
    priority_level = EXCLUDED.priority_level;

CREATE OR REPLACE TABLE main.priority_jobs_snapshot (
    job_id INTEGER PRIMARY KEY,
    job_title_short VARCHAR,
    company_name VARCHAR,
    job_posted_date TIMESTAMP,
    salary_year_avg DOUBLE,
    priority_lvl INTEGER,
    updated_at TIMESTAMP
);

INSERT INTO main.priority_jobs_snapshot(
    job_id,
    job_title_short,
    company_name,
    job_posted_date,
    salary_year_avg,
    priority_lvl,
    updated_at
)
SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.name AS company_name,
    jpf.job_posted_date,
    jpf.salary_year_avg,
    r.priority_level,
    CURRENT_TIMESTAMP AS updated_at
FROM data_jobs.job_postings_fact jpf
LEFT JOIN data_jobs.company_dim cd ON jpf.company_id = cd.company_id
INNER JOIN staging.priority_roles AS r
    ON jpf.job_title_short = r.role_name;

SELECT 
    job_title_short,
    COUNT(*) AS job_count,
    MIN(priority_lvl) AS priority_lvl,
    MIN(updated_at) AS updated_at
FROM main.priority_jobs_snapshot
GROUP BY job_title_short
ORDER BY job_count DESC;