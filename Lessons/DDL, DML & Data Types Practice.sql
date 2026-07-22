-- Section A – Data Types (Q112–Q116)
/* Q112 Create a table named employees with the following columns:

employee_id (Primary Key)
first_name (VARCHAR 50)
last_name (VARCHAR 50)
salary (NUMERIC(10,2))
hire_date (DATE)
is_active (BOOLEAN) */

CREATE DATABASE IF NOT EXISTS company;

USE company;

CREATE TABLE IF NOT EXISTS employees(
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  salary NUMERIC(10, 2),
  hire_date DATE,
  is_active BOOLEAN);

  /* Q113 Create a table departments with:

department_id (Primary Key)
department_name (VARCHAR 100, NOT NULL)
location (TEXT) */

CREATE TABLE IF NOT EXISTS department(
  department_id INT PRIMARY KEY,
  department_name VARCHAR(100) NOT NULL,
  location TEXT
)




/* Q114 Create a table projects with:

project_id (Primary Key)
project_name (VARCHAR(100))
budget (NUMERIC(12,2))
start_date (DATE)
end_date (DATE) */

CREATE TABLE IF NOT EXISTS projects(
  project_id INT PRIMARY KEY,
  project_name VARCHAR(100),
  budget NUMERIC(12, 2),
  start_date DATE,
  end_date DATE
);     





/* Q115 Explain the difference between these data types by giving one practical example of each:

INTEGER  - Store Whole Number like 1, 23, 45, 67
NUMERIC(10,2) - Store floating Number with 2 decimal;
VARCHAR(100)  -  Store character with Maximum limit of 100 character
TEXT          -  store character with no limit
BOOLEAN       - store boolena value (TRUE/FALSE)
DATE          - store date 
TIMESTAMP     - store time */


/* Q116 Which data type would you choose for:

Aadhaar Number - INTERGER(14) becuase addhar card have fix 14 length numbers
Mobile Number  - CHAR(10) because mobile number in india have 10 digit if we add this in INTEGER it take to much memory
Product Price  - FLOAT becuase having decimal value
Email Address  - VARCHAR becuase email have combination of text and number and special character @ also every email have different length
Login Time     - TIMESTAMP/DATETIME becuase login time contain time and date 
Percentage     - FLOAT because percentage have decimal value
Customer ID    - INT PRIMARY KEY becuase customer_id must unquie*/




-- Q117 Insert three employees into the employees table.

INSERT INTO employees VALUES
  (10001, 'Jeo', 'Root', 120000.5, '2007-06-24', TRUE),
  (10002, 'Josh', 'Buttlur', 90000.25, ' 2011-11-05', TRUE),
  (10003, 'Ben', 'Ducket', 85000.35, '2019-03-20', TRUE),
  (10008, 'Jeo', 'Martin', 20000, '2010-06-24', TRUE);




-- Q118 Insert two departments.
INSERT INTO department VALUES (8001, 'HR', 'Delhi'),
                              (9001, 'Managment', 'Mumbai');
                

-- Q119 Insert two projects.
INSERT INTO projects VALUES (2027, 'CWC', 200000, '2027-08-05', '2027-10-05'),
                            (20274, 'WTC', 150000, '2025-06-01', '2027-03-10'),
                            (2028, 'WCT20', 120000, '2028-02-07', '2028-03-28'),
                            (2026, 'Data Migration', 80000, '2026-03-24', '2026-12-23');
                        
-- Q120 Insert one employee using only the required columns, allowing others to be NULL.
INSERT INTO employees(employee_id) VALUES(10004);


-- Q121 Increase every employee's salary by 10%.

UPDATE employees
SET salary = salary*1.10;

-- Q122 Deactivate employees hired before 2020-01-01.
UPDATE employees
SET is_active = FALSE 
WHERE hire_date > '2020-01-01';


-- Q123 Change the department location from "Delhi" to "Noida".
UPDATE department
SET location = 'Noida'
WHERE location = 'Delhi';


-- Q124 Rename the project "Data Migration" to "Cloud Migration".
UPDATE projects
SET project_name = 'Cloud Migration'
WHERE project_name = 'Data Migration';



-- Q125 Delete employees whose salary is less than 25,000.
DELETE FROM employees
WHERE salary < 25000;

-- Q126 Delete projects that have already ended.
DELETE FROM projects
WHERE end_date < TODAY();


-- Q127 Delete departments that have no location assigned.
DELETE FROM department
WHERE location = NULL;


-- Q128 Add a column: email VARCHAR(150) to the employees table.
ALTER TABLE employees ADD COLUMN email VARCHAR(150);


-- Q129 Rename the column salary to monthly_salary.

ALTER TABLE employees RENAME COLUMN salary TO monnthly_salary;

-- Q130 Drop the column is_active.

ALTER TABLE employees DROP COLUMN is_active;




