
# SQL for Data Engineering | Learning & Projects

![SQL](https://img.shields.io/badge/SQL-Database-blue?logo=postgresql)
![DuckDB](https://img.shields.io/badge/DuckDB-Analytics-yellow?logo=duckdb)
![GitHub](https://img.shields.io/badge/GitHub-Version_Control-black?logo=github)
![Status](https://img.shields.io/badge/Learning-In_Progress-orange)

A hands-on SQL learning and project repository documenting my journey toward becoming a **Data Engineer**.

This repository contains structured SQL practice, concept-wise exercises, problem-solving, and practical projects focused on analytical SQL, data modeling, data warehousing, and ETL pipelines.

> **My Learning Approach:** Learn the concept → Practice SQL → Solve real-world problems → Build projects.

---

## 📌 About This Repository

I created this repository to strengthen my SQL fundamentals and develop practical SQL skills required in Data Engineering.

Instead of only learning SQL syntax, I focus on understanding how SQL is used in real-world data workflows, including:

- Querying and transforming structured data.
- Working with relational databases.
- Designing and understanding data models.
- Building analytical queries.
- Working with Fact and Dimension tables.
- Understanding ETL and data warehouse concepts.
- Solving business problems using SQL.

This repository is continuously updated as I learn and implement new concepts.

---

## 🚀 Repository Highlights

- Concept-wise SQL learning and practice.
- Beginner to advanced SQL queries.
- Hands-on exercises and problem-solving.
- SQL Joins, Subqueries, and CTEs.
- Window Functions and Nested Functions.
- Analytical SQL and Aggregations.
- Exploratory Data Analysis project.
- Data Warehouse and Data Mart project.
- Practical implementation using DuckDB.

---

# 📚 SQL Learning & Practice

I follow a topic-wise learning approach, completing exercises and practicing queries before moving to more advanced concepts.

| # | SQL Topics | Learning Focus |
|---|---|---|
| 01 | SQL Fundamentals | Database concepts and SQL syntax |
| 02 | Data Types | Understanding SQL data types |
| 03 | Operators | Arithmetic, comparison and logical operators |
| 04 | DDL | CREATE, ALTER, DROP, TRUNCATE |
| 05 | DML | INSERT, UPDATE, DELETE |
| 06 | SELECT & Filtering | SELECT, WHERE, DISTINCT |
| 07 | Sorting | ORDER BY, LIMIT |
| 08 | Aggregate Functions | COUNT, SUM, AVG, MIN, MAX |
| 09 | GROUP BY & HAVING | Grouping and filtering aggregated data |
| 10 | SQL Joins | INNER, LEFT, RIGHT and FULL JOIN |
| 11 | Subqueries | Nested and correlated subqueries |
| 12 | CTEs | Common Table Expressions |
| 13 | CASE Expressions | Conditional logic |
| 14 | Date Functions | Date manipulation and extraction |
| 15 | Text Functions | String manipulation |
| 16 | NULL Functions | Handling missing values |
| 17 | Window Functions | Ranking and analytical calculations |
| 18 | Nested Functions | Combining multiple SQL functions |

**Note:** This represents my learning coverage. I continue to revisit and practice these concepts to strengthen my understanding.

---

# 💻 Projects

I have completed two practical SQL projects to apply my learning to real-world data engineering and analytical scenarios.

## 📊 Project 1: Exploratory Data Analysis with SQL

**Data Engineer Job Market Analytics**

[![View Project](https://img.shields.io/badge/View_Project-1_EDA-blue?style=for-the-badge)](./1_EDA/README.md)

### Overview

An exploratory data analysis project focused on understanding the Data Engineer job market using real-world job posting data.

The objective is to identify in-demand technical skills, analyze salary trends, and discover skills that offer a good balance between market demand and compensation.

### Business Questions

1. What are the most in-demand skills for Data Engineers?
2. Which technical skills offer the highest salaries?
3. Which skills provide the best balance between demand and salary?

### Key Analysis

- Top in-demand Data Engineering skills.
- Highest-paying technical skills.
- Optimal skills based on demand and salary.
- Remote Data Engineer job market analysis.

### SQL Concepts Used

- Multi-table JOINs.
- GROUP BY and ORDER BY.
- Aggregate functions.
- MEDIAN and ROUND.
- Mathematical functions.
- Data filtering and NULL handling.
- Analytical query development.

### Technology Stack

`SQL` `DuckDB` `VS Code` `Git` `GitHub`

### Project Architecture

The analysis uses a star-schema-based data warehouse with a fact table, dimension tables, and a bridge table to represent the relationship between job postings and skills.

![EDA Project](./1_EDA/1_1_Project1_EDA.png)

![Data Warehouse Schema](./1_EDA/1_2_Data_Warehouse.png)

---

## 🏗️ Project 2: Data Warehouse & Data Mart Build

**Production ETL Pipeline**

[![View Project](https://img.shields.io/badge/View_Project-2_Data_Warehouse-orange?style=for-the-badge)](./2_DataWarehouse_Mart_Build/readme.md)

### Overview

A hands-on Data Engineering project focused on building a data warehouse and analytical data marts using SQL.

The project demonstrates how raw CSV files can be ingested from cloud storage, loaded into database tables, transformed through SQL, and organized into structured analytical datasets.

### Project Workflow

1. **Data Source:** CSV files stored in Google Cloud Storage.
2. **Data Ingestion:** Accessing and retrieving source CSV files.
3. **Data Loading:** Creating database tables and loading source data.
4. **Data Modeling:** Organizing data into structured warehouse tables.
5. **Data Transformation:** Joining and transforming data using SQL.
6. **Data Mart:** Preparing flattened, analysis-ready datasets.

### Key Concepts

- ETL pipeline fundamentals.
- CSV data ingestion.
- Database table creation.
- Data loading.
- Relational data modeling.
- Primary and Foreign Keys.
- Fact and Dimension tables.
- Star Schema.
- SQL JOINs and transformations.
- Data Warehouse and Data Mart concepts.

### Technology Stack

`SQL` `DuckDB` `Google Cloud Storage` `VS Code` `Git` `GitHub`

### Project Objective

To understand how data moves from raw files into a structured data warehouse and how SQL transformations make that data useful for downstream analytics.

---

# 🛠️ Technologies & Tools

| Technology | Purpose |
|---|---|
| SQL | Data querying and transformation |
| DuckDB | Analytical database |
| Google Cloud Storage | Cloud-based CSV storage |
| VS Code | Development environment |
| Git | Version control |
| GitHub | Code management and documentation |

---

# 🎯 SQL Skills I'm Developing

### SQL Development

- Writing complex SQL queries.
- Multi-table joins.
- Subqueries and CTEs.
- Window functions.
- Data transformation.
- Query debugging.

### Database Concepts

- Relational database design.
- Primary and Foreign Keys.
- Database constraints.
- Fact and Dimension tables.
- Star Schema.

### Data Engineering

- ETL pipeline fundamentals.
- Data ingestion.
- Data loading.
- Data transformation.
- Data Warehousing.
- Data Mart development.

---

# 📈 My Learning Approach

I believe strong fundamentals are essential for becoming a good Data Engineer.

My learning process follows these steps:

1. Understand the concept in depth.
2. Write SQL queries independently.
3. Practice multiple questions on each topic.
4. Understand different approaches to solving problems.
5. Apply concepts to practical projects.
6. Document the learning and implementation in GitHub.

---

# 🔮 Future Learning Goals

I am continuously expanding my Data Engineering knowledge.

My upcoming learning goals include:

- Advanced SQL and PostgreSQL.
- Query execution and optimization.
- Database indexing and performance.
- Advanced data modeling.
- Advanced ETL/ELT pipelines.
- Python for Data Engineering.
- Apache Spark and PySpark.
- Data pipeline orchestration with Apache Airflow.
- Cloud Data Engineering.

---

# 📖 Learning Resources

- [SQL for Data Engineering – Luke Barousse](https://www.youtube.com/@LukeBarousse)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [DuckDB Documentation](https://duckdb.org/docs/)
- [DataLemur](https://datalemur.com/)
- [LeetCode SQL](https://leetcode.com/problemset/database/)

---

# 👨‍💻 About Me

**Abhijeet Suryawanshi**

Aspiring Data Engineer | SQL | Python | Data Warehousing | ETL

I am passionate about learning Data Engineering and building practical projects that help me understand how data is stored, processed, transformed, and delivered for analytics.

### Connect With Me

- **GitHub:** [@Abhijeetsurya](https://github.com/Abhijeetsurya)
- **LinkedIn:** [Abhijeet Suryawanshi](https://www.linkedin.com/in/abhijeet42/)

---

⭐ If you find this repository useful, feel free to explore the projects and share your feedback.

**This is an ongoing learning journey. More SQL practice, projects, and Data Engineering implementations will be added as I progress.**
