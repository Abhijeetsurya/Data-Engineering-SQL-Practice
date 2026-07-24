
/* Production SQL Practice (Q112–Q126)

Section A – Data Types
Q112. Create a table named employee_dim with:

employee_id (Primary Key)
first_name (VARCHAR 50)
last_name (VARCHAR 50)
email (Unique)
hire_date (DATE)
salary (DECIMAL(10,2))
is_active (BOOLEAN)  */

CREATE TABLE employee_dim(employee_id INT PRIMARY KEY, first_name VARCHAR(50),
						  last_name VARCHAR(50), email VARCHAR(50) UNIQUE, hire_date DATE,
						  salary DECIMAL(10, 2), is_active BOOLEAN);


/* Q113. Alter the employee_dim table to add:

department VARCHAR(100)  */

ALTER TABLE employee_dim ADD COLUMN department VARCHAR(100);


/* Q114 Change the salary column to:

DECIMAL(12,2) */

ALTER TABLE employee_dim ALTER COLUMN salary TYPE DECIMAL(12, 2);

/* Q115. Insert three employees into employee_dim. */

INSERT INTO employee_dim VALUES 
 (1001, 'Josh', 'Buttler', 'josh@gmail.com', '2008-03-24', 12900.5, TRUE),
 (1002, 'Rohit', 'Sharma', 'rohit@gmail.com', '2007-03-17', 18900.7, TRUE), 
 (1003, 'Virat', 'Kohli', 'virat@gmail.com', '2008-09-09', 89000, TRUE);



/* Q116 Insert only: employee_id, first_name, last_name, email, and let the remaining 
columns use NULL/default values where allowed. */

INSERT INTO employee_dim(employee_id,first_name, last_name, email) 
VALUES(1004, 'Shreys', 'Iyer', 'sheryas@gmail.com');


/* Q117 Increase salary by 10% for employees hired before 2024-01-01.*/

UPDATE employee_dim
SET salary = salary*1.10
WHERE hire_date < '2024-01-01';


 
/* Q118 Mark employees as inactive whose salary is less than 30000. */

UPDATE employee_dim
SET is_active = FALSE
WHERE salary < 30000;

-- Q119 Delete employees who are inactive.

DELETE FROM employee_dim
WHERE is_active = FALSE;

-- Q120 Delete employees whose hire date is before 2015-01-01.

DELETE FROM employee_dim
WHERE hire_date < '2015-01-01';

-- Q121 Rename column department to department_name

ALTER TABLE employee_dim RENAME COLUMN department TO department_name;


-- Q122 Drop the column department_name

ALTER TABLE employee_dim DROP COLUMN department_name;

/* Q123 Create a table named department_dim. Columns:
department_id (Primary Key)
department_name (Unique)
location  */

CREATE TABLE department_dim(department_id INT PRIMARY KEY, 
							department_name VARCHAR(50) UNIQUE,
							location TEXT
);


-- Q124 Add a foreign key to employee_dim so every employee belongs to a department.
ALTER TABLE employee_dim ADD COLUMN department_id INT 
REFERENCES department_dim(department_id);


/* Q125 You accidentally updated every employee's salary to 0.

What SQL statement would you use to undo it if you haven't committed the transaction yet?
*/
ROLLBACK;

/* Q126 Explain the difference between:

DELETE  - Delete record from table
TRUNCATE - Delete all records from table without destroying structure
DROP - Delete  database or table

in your own words, and mention when a Data Engineer would use each one. */

