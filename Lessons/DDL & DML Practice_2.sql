/* Q112 Create a table named employee_dim with:

employee_id (Primary Key)
first_name (VARCHAR 50)
last_name (VARCHAR 50)
email (Unique)
hire_date (DATE)
salary (DECIMAL(10,2))
is_active (BOOLEAN) */

CREATE TABLE employee_dim(
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50) UNIQUE,
  hire_date DATE,
  salary DECIMAL(10, 2),
  is_active BOOLEAN
);


-- Q113 Alter the employee_dim table to add: department VARCHAR(100)

ALTER TABLE employee_dim ADD COLUMN department VARCHAR(100);


-- Q114 Change the salary column to: DECIMAL(12,2)

ALTER TABLE employee_dim ALTER COLUMN salary TYPE DECIMAL(12, 2);



-- Q115 Insert three employees into employee_dim.
INSERT INTO employee_dim VALUES(1001, 'Joe', 'Root', 'rootjoe@gmail.com', '2008-07-12', 120000.4, TRUE, 'IT'),
(1002, 'Josh', 'Buttler', 'josh@gmail.com', '2011-09-09', 10000.6, TRUE, 'Managment'),
(1003, 'Glen', 'Maxwell', 'maxwell@gmail.com', '2010-12-17', 9000.2, TRUE, 'Sales');


/* Q116 Insert only:

employee_id - it is required becuase we created this as primary key and primary never be a null
first_name
last_name
email

and let the remaining columns use NULL/default values where allowed. */

INSERT INTO employee_dim(employee_id, first_name, last_name, email) VALUES (1004, 'Ben', 'Ducket', 'ben@gmail.com');


-- Q117 Increase salary by 10% for employees hired before 2024-01-01.
UPDATE employee_dim
SET salary = salary*1.10
WHERE hire_date < '2024-01-01';


-- Q118 Mark employees as inactive whose salary is less than 30000.

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
location */

CREATE TABLE  department_dim
(department_id INT PRIMARY KEY, 
  department_name VARCHAR(50) UNIQUE,
  location VARCHAR(50));

  -- Q124 Add a foreign key to employee_dim so every employee belongs to a department.
ALTER TABLE employee_dim 
ADD CONSTRAINT department_id 
FOREIGN KEY (department_id) 
REFERENCES deparmtent_dim(department_id);

/* Q125 You accidentally updated every employee's salary to 0.

What SQL statement would you use to undo it if you haven't committed the transaction yet? */
ROLLBACK;


/* Q126  Explain the difference between:

DELETE - DELETE specific data from table
TRUNCATE - DELETE all data from table without deleting actual structure of table
DROP - DELETE table or database 

in your own words, and mention when a Data Engineer would use each one. */