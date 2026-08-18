-- Creating tables jobs and jobs_skills

DROP TABLE IF EXISTS job_skills;
DROP TABLE IF EXISTS jobs;

CREATE TABLE jobs (
    job_id BIGINT PRIMARY KEY,
    title TEXT,
    company_name TEXT,
    raw_location TEXT,
    normalized_city VARCHAR(50),
    workforce_category VARCHAR(50),
    experience TEXT,
    minimum_experience NUMERIC,
    maximum_experience NUMERIC,
    estimated_experience NUMERIC,
    experience_level VARCHAR(50),
    raw_salary TEXT,
    salary_disclosed BOOLEAN,
    minimum_salary NUMERIC,
    maximum_salary NUMERIC,
    estimated_salary NUMERIC,
    tags_and_skills TEXT
);

CREATE TABLE job_skills (
    job_id BIGINT NOT NULL,
    skill VARCHAR(100) NOT NULL,

    PRIMARY KEY (job_id, skill),

    CONSTRAINT fk_job_skills_job
        FOREIGN KEY (job_id)
        REFERENCES jobs(job_id)
);

--Import data through csv and check the tables

select *
from jobs;

select *
from jobs;

--Check unique jobs IDs

select count(*) as total_jobs, count(job_id) as unique_jobs
from jobs;

--check duplicate job_IDs

select job_id, count(*) as occurence_count
from jobs
group by job_id
having count(*)>1;

--percentage of total_hiring

select normalized_city, count(*) as total_jobs,
round(100*count(*)/sum(count(*)) over (), 2) as job_share_pct,
from jobs
group by normalized_city
order by total_jobs desc;