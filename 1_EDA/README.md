# 🔍 Exploratory Data Analysis with SQL: Data Engineer Job Market Analytics

![Project Overview](./1_1_Project1_EDA.png)

A SQL project analyzing the **Data Engineer job market** using real-world job posting data. The project focuses on identifying the most in-demand skills, highest-paying technologies, and the optimal skills that provide the best balance between demand and compensation.

> 📚 This project was completed as part of the **SQL for Data Engineering** course by **Luke Barousse**. The analysis, documentation, and project implementation were completed by me to strengthen my SQL and data engineering skills.

---

# 👨‍💻 About Me

**Abhijeet Suryawanshi**

- 🔗 GitHub: https://github.com/Abhijeetsurya
- 🔗 LinkedIn: https://www.linkedin.com/in/abhijeet42/

I enjoy building projects that combine **SQL, analytics, and data engineering concepts** to solve real-world business problems and derive meaningful insights from data.

---

# 🧾 Executive Summary

This project answers three important questions about the Data Engineer job market:

✅ Which skills are most in demand?

✅ Which skills command the highest salaries?

✅ Which skills provide the best balance between demand and compensation?

The analysis was performed using SQL queries on a data warehouse built using a **star schema** design.

---

# 🎯 Business Questions

1. Which skills are most in-demand for Data Engineers?
2. Which skills command the highest salaries?
3. Which skills provide the best trade-off between demand and salary?

---

# 🏗️ Data Warehouse Schema

![Data Warehouse Schema](./1_2_Data_Warehouse.png)

The project uses a **star schema** data warehouse consisting of:

### Fact Table
- `job_postings_fact`
  - Job title
  - Company information
  - Salary
  - Location
  - Posting date
  - Remote work status

### Dimension Tables
- `company_dim`
- `skills_dim`

### Bridge Table
- `skills_job_dim`

The bridge table resolves the many-to-many relationship between job postings and skills.

---

# 🧰 Tech Stack

| Technology | Purpose |
|------------|----------|
| SQL | Data Analysis |
| DuckDB | Analytical Query Engine |
| VS Code | Development Environment |
| Git & GitHub | Version Control |
| Star Schema | Data Modeling |

---

# 📂 Repository Structure

```text
1_EDA/
│
├── 1_1_Project1_EDA.png
├── 1_2_Data_Warehouse.png
├── 01_top_on_demanded_skills.sql
├── 02_top_paying_skills.sql
├── 03_optimal_skills.sql
└── README.md
```

---

# 🏗️ Analysis Overview

## 1️⃣ Top Demanded Skills

**File:** `01_top_on_demanded_skills.sql`

### Objective
Identify the most in-demand skills for remote Data Engineer positions.

### SQL Concepts Used
- INNER JOIN
- GROUP BY
- COUNT()
- ORDER BY
- LIMIT

---

## 2️⃣ Top Paying Skills

**File:** `02_top_paying_skills.sql`

### Objective
Determine which technical skills command the highest salaries.

### SQL Concepts Used
- Aggregations
- MEDIAN()
- ROUND()
- Filtering with `WHERE`
- Sorting and ranking

---

## 3️⃣ Optimal Skills

**File:** `03_optimal_skills.sql`

### Objective
Identify skills that provide the best balance between:

- High demand
- High salary

### SQL Concepts Used
- Mathematical functions (`LN()`)
- Derived metrics
- HAVING clause
- Multi-table joins
- Aggregations

---

# 🔍 Key Insights

### 🧠 Programming Languages
- SQL and Python dominate the Data Engineer job market and appear in the highest number of job postings.

### ☁️ Cloud Technologies
- AWS and Azure are among the most valuable cloud skills for modern data engineering roles.

### 🧱 Infrastructure & DevOps
- Docker, Kubernetes, and Terraform are associated with premium salaries.

### 🔥 Big Data Technologies
- Apache Spark remains one of the most sought-after skills with strong compensation.

---

# 💻 SQL Skills Demonstrated

## Query Design & Optimization
- Multi-table `INNER JOIN` operations
- Querying star schema data models
- Efficient filtering and sorting techniques

## Data Analysis Techniques
- Aggregations using `COUNT()`, `MEDIAN()`, and `ROUND()`
- Statistical analysis of salary and demand data
- Derived metrics and score calculations
- Mathematical transformations using `LN()`

## Data Cleaning
- Handling missing values with `IS NOT NULL`
- Filtering incomplete records

## Analytical Thinking
- Translating business questions into SQL solutions
- Identifying trends in labor market data
- Combining demand and compensation metrics for decision-making

---

# 🚀 How to Run This Project

### Clone the Repository

```bash
git clone https://github.com/Abhijeetsurya/SQL_DATA_ENGINEERING.git
```

### Navigate to the Project Directory

```bash
cd SQL_DATA_ENGINEERING/1_EDA
```

### Open DuckDB

```bash
duckdb
```

### Execute Queries
1. [`01_top_on_demanded_skills.sql`](./01_top_on_demanded_skills.sql) - Demand analysis with multi-table joins

2. [`02_top_paying_skills.sql`](./02_top_paying_skills.sql) - Salary analysis with aggregations

3. [`03_optimal_skills.sql`](./03_optimal_skills.sql) - Combined demand and salary optimization query


---

# 📸 Project Preview

## Project Overview

![Project Overview](./1_1_Project1_EDA.png)

## Data Warehouse Schema

![Data Warehouse Schema](./1_2_Data_Warehouse.png)

---

# 📚 Dataset & Credits

- Dataset provided as part of the **SQL for Data Engineering** course by **Luke Barousse**.
- Project implementation, documentation, and analysis completed by **Abhijeet Suryawanshi**.

---

# 🎓 What I Learned

Through this project, I strengthened my understanding of:

- Writing analytical SQL queries
- Working with star schema data models
- Using aggregations and statistical functions
- Solving business problems using SQL
- Extracting actionable insights from large datasets
- Designing efficient queries for analytical workloads

---

# 🚀 Future Improvements

- Create interactive dashboards using Power BI or Tableau.
- Add visualizations for skill demand and salary trends.
- Perform time-series analysis on job posting trends.
- Build an automated data pipeline for regular updates.

---

# 📬 Connect With Me

- GitHub: https://github.com/Abhijeetsurya
- LinkedIn: https://www.linkedin.com/in/abhijeet42/

If you found this project interesting, feel free to connect with me or provide feedback.

⭐ If you like this project, consider starring the repository!