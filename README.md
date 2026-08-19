# India GCC Location & Workforce Expansion Analytics

## Project Overview

This project analyzes Indian job-market data to support a hypothetical Global Capability Center (GCC) expansion decision.

The analysis focuses on two business questions:

1. Which Indian city provides a strong workforce environment for GCC expansion?
2. Which technology workforce capabilities should a GCC prioritize in each location?

The project follows an end-to-end analytics workflow using **Excel, Python, PostgreSQL, SQL, and Power BI**.

---

## Business Problem

A hypothetical GCC is evaluating expansion across major Indian technology markets:

- Bengaluru
- Hyderabad
- Pune
- Chennai
- Delhi NCR
- Mumbai

The objective is to compare these locations using workforce-demand indicators such as:

- Hiring demand
- Salary levels
- Experience mix
- Technology workforce demand
- Skill demand

The analysis is intended to support workforce-location strategy rather than identify a universally "best" city.

---

## Analytics Workflow

```text
Raw Job Market Data
        |
        v
Excel
Initial exploration and PivotTables
        |
        v
Python / Pandas
Cleaning, validation and feature engineering
        |
        v
PostgreSQL
Relational data model
        |
        v
SQL
Business analysis and validation
        |
        v
Power BI
Interactive executive dashboard
```

---

## Tools & Technologies

| Tool | Usage |
|---|---|
| Excel | Initial data exploration, PivotTables and validation |
| Python | Data cleaning, EDA and feature engineering |
| Pandas | Data transformation and aggregation |
| PostgreSQL | Relational storage and analytical database |
| SQL | Data validation and business analysis |
| Power BI | Data modeling, DAX and executive dashboard |
| Git & GitHub | Version control and project documentation |

---

## Data Preparation

The raw job-posting data required several transformations before analysis.

Python was used to:

- investigate and remove duplicate job records
- normalize major Indian city names
- handle undisclosed salary information
- calculate estimated salary
- investigate salary outliers using the IQR method
- create experience bands
- classify job titles into technology workforce categories
- validate the rule-based workforce classification
- extract selected technology skills
- normalize multi-valued skills into job-skill relationships

The processed data was then loaded into PostgreSQL.

---

## Workforce Categories

Technology job postings were classified into six GCC-relevant capability groups:

- AI / ML
- Data Engineering
- Data Analytics
- Software Engineering
- Cloud / DevOps
- Cybersecurity

Ambiguous titles were retained as `Other` to reduce false-positive classification.

---

## Database Design

The PostgreSQL analytical model contains two primary tables:

### `jobs`

One row represents one job posting.

`job_id` is the primary key.

### `job_skills`

One row represents one job-skill relationship.

The table uses a composite key consisting of:

`job_id + skill`

`job_id` references the `jobs` table, creating a one-to-many relationship between jobs and job-skill records.

---

## Key Insights

### 1. Bengaluru leads in hiring scale

Bengaluru showed the largest overall hiring demand among the analyzed target markets, reinforcing its position as a broad technology hiring market.

### 2. Hyderabad shows strong senior workforce demand

Approximately **62.9%** of Hyderabad postings were classified as Senior Level or Leadership / Expert, the highest concentration among the analyzed cities.

Bengaluru followed at approximately **59.9%**, while Pune was approximately **56.3%**.

### 3. Salary distributions are right-skewed

Hyderabad and Bengaluru showed substantial differences between mean and median salary.

For example:

- Hyderabad: mean ≈ ₹9.97L, median ≈ ₹5.50L
- Bengaluru: mean ≈ ₹9.40L, median ≈ ₹5.00L

Because high-value observations pulled the mean upward, **median salary was selected as the primary compensation KPI**.

### 4. Workforce specialization differs by city

The classified technology postings indicated different workforce-demand patterns across markets.

Examples included relatively strong:

- Data Engineering representation in Hyderabad
- AI / ML representation in Bengaluru and Pune
- Cloud / DevOps representation in Delhi NCR
- Data Analytics and Cybersecurity representation in Mumbai

These patterns support capability-specific location decisions rather than treating every GCC expansion requirement identically.

### 5. Technology skills show strong demand signals

Skill analysis identified recurring demand for technologies including:

- Java
- SQL
- Python
- JavaScript
- AWS
- Azure
- Excel
- Kubernetes
- Power BI
- Machine Learning

Skills were normalized into a separate job-skill dataset to support relational SQL analysis and interactive Power BI filtering.

---

## Executive Recommendation

Based on the workforce-demand indicators analyzed, **Hyderabad emerges as a strong GCC expansion candidate for Data Engineering and senior technology capabilities**, combining substantial hiring demand with the highest Senior / Leadership workforce concentration among the analyzed markets.

**Bengaluru remains the preferred option when technology hiring scale and workforce breadth are the primary priorities.**

The analysis therefore supports a capability-driven location strategy rather than identifying one city as universally optimal for every GCC function.

---

## Power BI Dashboard

The executive dashboard provides:

- Total Job Demand
- Median Salary
- Senior Workforce %
- Technology Job Demand
- Salary Disclosure %
- Hiring Demand by City
- Technology Workforce Demand by City
- Top Skills in Demand
- GCC Location Comparison
- Interactive City, Workforce and Experience filters

---

## SQL Analysis

The SQL layer includes queries covering:

- hiring demand by city
- salary comparison
- salary availability
- experience distribution
- workforce demand
- skill demand
- city-level skill analysis
- joins
- conditional aggregation
- window functions

SQL scripts are available in the `sql/` directory.

---

## Repository Structure


## Limitations

This project should be interpreted within several limitations:

- Job postings measure **hiring demand**, not actual talent supply.
- Salary analysis is limited to postings containing usable salary information.
- Workforce categories were created using rule-based job-title classification.
- Skill analysis uses a controlled dictionary of selected technologies rather than every possible skill.
- The GCC recommendation does not include real-estate costs, state incentives, infrastructure, attrition, taxation or quality-of-life indicators.

These factors would be valuable additions to a broader GCC location strategy.

---

## Key Learning Outcomes

This project demonstrates practical experience with:

- translating a business problem into analytical questions
- data cleaning and validation
- exploratory data analysis
- feature engineering
- handling skewed distributions and outliers
- relational data modeling
- SQL analysis
- Power BI data modeling
- DAX measures
- dashboard design
- converting analytical findings into business recommendations
