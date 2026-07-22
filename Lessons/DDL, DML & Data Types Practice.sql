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

Aadhaar Number - CHAR(12) becuase addhar card have fix 12 length numbers
Mobile Number  - CHAR(10) because mobile number in india have 10 digit if we add this in INTEGER it take to much memory
Product Price  - NUMERIC becuase having decimal value
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
WHERE hire_date < '2020-01-01';


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
WHERE end_date < CURRENT_DATE();


-- Q127 Delete departments that have no location assigned.
DELETE FROM department
WHERE location IS NULL;


-- Q128 Add a column: email VARCHAR(150) to the employees table.
ALTER TABLE employees ADD COLUMN email VARCHAR(150);


-- Q129 Rename the column salary to monthly_salary.

ALTER TABLE employees RENAME COLUMN salary TO monthly_salary;

-- Q130 Drop the column is_active.

ALTER TABLE employees DROP COLUMN is_active;


-- Q131. Drop the projects table.
DROP TABLE projects;

/* Q132 Create a table customers with:

customer_id (Primary Key)
first_name (VARCHAR(50), NOT NULL)
last_name (VARCHAR(50))
email (UNIQUE)
phone (UNIQUE)
created_at (TIMESTAMP) */

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50),
email VARCHAR(50) UNIQUE,
phone CHAR(10) UNIQUE,
created_at TIMESTAMP
);   

/* Q133 Create an orders table with:

order_id (Primary Key)
customer_id (Foreign Key referencing customers)
order_date (DATE)
total_amount (NUMERIC(10,2) CHECK > 0) */
CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT REFERENCES customers(customer_id),
order_date DATE,
total_amount NUMERIC(10, 2) CHECK(total_amount > 0)
);  


/* Q134 Create a products table with:

product_id (Primary Key)
product_name (VARCHAR(100), NOT NULL)
price (NUMERIC(8,2), CHECK price > 0)
stock (INTEGER, DEFAULT 0) */

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
price NUMERIC(8, 2) CHECK(price > 0),
stock INTEGER DEFAULT(0)
); 


-- Q135 Why should email usually have a UNIQUE constraint?
-- Because every customer have unquie email id


/* Q136 What is the difference between:

PRIMARY KEY  - Uses for make coloumn NOT NULL and UNIQUE
UNIQUE       - It may be NULL but only storing UNQIUE
NOT NULL     - must need to add data in this column
CHECK        - Add condition in column 
DEFAULT      - Set default in column
FOREIGN KEY  - connect with other table

Give one practical example of each. */


-- Q137 Insert three customers.
INSERT INTO customers VALUES(10001, 'Riya', 'Kushwaha', 'riya@gmail.com', '9876987490', NOW()),
(10002, 'Neha', 'Gour', 'nehagour@gmail.com', '6276457636', NOW()),
(10003, 'Abhi', 'Surya', 'abhi@gmail.com', '9303940996', NOW());


-- Q138 Insert four products.
INSERT INTO products VALUES(30001, 'Titan Watch', 2400, 980),
(70012, 'Gucci Bag', 55000, 145),
(90101, 'Nike Shoes', 12000, 569),
(60809, 'ZARA T-shirt', 1200, 2300);

-- Q139 Insert three orders referencing existing customers.
INSERT INTO orders(order_id, cusotmer_id, order_date, total_amount)VALUES
(501, 10001, CURRENT_DATE, 55000), 
    (502, 10002, current_date, 67000), 
    (503, 10003, CURRENT_DATE, 60000);


-- Q140 Insert one product without specifying stock. What value will it get?
INSERT INTO products(product_id, products_name, price) VALUES
(60013, 'PUMA Shoes', 5600);


-- Q141 Increase the price of every product by 15%.

UPDATE products
SET price = price*1.15;

-- Q142 Reduce stock by 1 for every product priced above 1000.
UPDATE products
SET stock = stock -1
WHERE price > 1000;

-- Q143 Update the email of customer ID 2.

UPDATE customers
SET email = 'nehagour1@gmail.com'
WHERE customer_id = 10002;


-- Q144 Increase the order amount by ₹500 for all orders placed before 2027-01-01.
UPDATE orders
SET total_amount = total_amount+500
WHERE order_date < '2026-01-01';


-- Q145 Delete customers who have never placed an order.

DELETE FROM customers
WHERE NOT EXISTS (
    SELECT 1 
    FROM orders 
    WHERE orders.cusotmer_id = customers.customer_id
);



-- Q146 Delete products with stock equal to 0.
DELETE FROM products
WHERE stock = 0;


-- Q147 Delete orders whose total amount is below ₹100.
DELETE FROM orders
WHERE total_amount < 100;


-- Q148 Add a column: status VARCHAR(20) DEFAULT 'Pending' to the orders table.

ALTER TABLE orders ADD COLUMN status VARCHAR(20) DEFAULT('Pending');


-- Q149 Rename phone to mobile_number in the customers table.

ALTER TABLE customers RENAME COLUMN phone TO mobile_number;


-- Q150 Drop the created_at column from the customers table.

ALTER TABLE customers DROP COLUMN created_at;


/* Q151 Suppose you're designing an Employee Management System.

List at least five tables you would create and explain in one sentence why each table is needed. */
/* employee_details for add details of employee(employee_id, department_id, Name, emaial, phone, joining_date) 
      relation with department table, job role table, location table using employeeid  */
/* department for add details (department_name, department_id) in which department employee working relation with employee_details table*/
-- job roles for job title, salary, (employee_id, department_id, job_title, salary) relation with employee details and department table using employee_id
-- location for full address(street, city, state, country, pin code) - employee_id, name, department, location rrelation with employee details table using employee_id
-- 