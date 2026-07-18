/*  Task 1 Write the complete CREATE TABLE statement.
Employee Table Requirements
Create a table named employees with these columns:
| Column      | Requirement                                |
| ----------- | ------------------------------------------ |
| employee_id | Integer, Primary Key                       |
| first_name  | Maximum 50 characters, cannot be NULL      |
| last_name   | Maximum 50 characters, cannot be NULL      |
| email       | Must be unique, maximum 100 characters     |
| salary      | Two decimal places, must be greater than 0 |
| department  | Maximum 30 characters                      |
| hire_date   | Date                                       |
| is_remote   | Boolean, default FALSE                     |
*/


CREATE TABLE employee(employee_id INTEGER PRIMARY KEY, first_name VARCHAR(50) NOT NULL, last_name VARCHAR(50) NOT NULL,
                email VARCHAR(100) UNIQUE, salary NUMERIC(10, 2) CHECK(salary>0), department VARCHAR(30), hire_date DATE,
                is_remote BOOL DEFAULT(FALSE));

/*  Module 2: ALTER TABLE
After creating the table, your manager asks you to make these changes:
Task 2
Add a column:
phone_number VARCHAR(15)   */
ALTER TABLE employee ADD COLUMN phone_number VARCHAR(15);


/* Task 3
Rename the column:
department
to
department_name */

ALTER TABLE employee RENAME COLUMN department TO department_name;


/* Task 4
Change phone_number from
VARCHAR(15)
to
VARCHAR(20) */
ALTER TABLE employee RENAME COLUMN phone_number TO phone_number TYPE VARCHAR(20);

-- Task 5. Drop the phone_number column.
ALTER TABLE employee DROP COLUMN phone_number;


/* Task 6.
Insert two employees.
Example:
employee_id	first_name	last_name	email	salary	department	hire_date	is_remote
1	Abhijeet	Suryawanshi	abc@gmail.com	65000.50	IT	2026-01-01	TRUE
2	Rahul	Sharma	rahul@gmail.com	55000	HR	2026-02-15	FALSE  */

INSERT INTO employee VALUES
  (1, 'Abhijeet', 'Suryawanshi', 'abc@gmail.com', 65000.50, 'IT', '2026-01-01', TRUE),
  (2, 'Rahul', 'Sharma', 'rahul@gmail.com', 55000, 'HR', '2026-02-15', FALSE);



  -- Task 7. Increase the salary of all employees in the IT department by 10%.
UPDATE employee
SET salary = salary*1.10
WHERE department_name = 'IT';


-- Task 8. Change Rahul's department to Finance.
UPDATE employee
SET Department_name = 'Finance'
WHERE employee_id = 2;

-- Task 9. Mark every employee hired before 2026-02-01 as remote.
UPDATE employee
SET is_remote = TRUE
WHERE hire_date < '2026-02-01';
-- Task 10. Delete the employee whose employee_id = 2.
DELETE FROM employee
WHERE employee_id = 2;


-- Task 11. Delete all employees from the HR department.
DELETE FROM employee
WHERE department_name ='HR';

-- Task 12. Delete employees earning less than ₹40,000.
DELETE FROM employee
WHERE salary < 40000;

