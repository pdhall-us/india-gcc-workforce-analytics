select * from jobs;

-- 1. Total jobs by city

select normalized_city, count(*) as total_jobs
from jobs
group by normalized_city
order by total_jobs desc;

-- 2. Average salary by city

select normalized_city, round(avg(estimated_salary), 2) as average_salary
from jobs
where estimated_salary is not null
group by normalized_city
order by average_salary desc;

-- 3. Salary records by city

select normalized_city, count(estimated_salary) as salary_records
from jobs
group by normalized_city
order by salary_records desc;

-- 4. Jobs by experience level

select experience_level,
count(*) as total_jobs
from jobs
group by experience_level
order by total_jobs desc;

-- 5. Experience distribution by city

select normalized_city,
experience_level,
count(*) as total_jobs
from jobs
group by normalized_city, experience_level
order by normalized_city, total_jobs desc;

-- 6. Technology workforce demand by city

select normalized_city,
workforce_category,
count(*) as total_jobs
from jobs
where workforce_category <> 'Other'
group by normalized_city, workforce_category
order by normalized_city, total_jobs desc;

-- 7. Overall workforce demand

select workforce_category, count(*) as total_jobs
from jobs
where workforce_category <> 'Other'
group by workforce_category
order by total_jobs desc;

-- 8. Salary by workforce category

select workforce_category, round(avg(estimated_salary), 2) as avg_salary
from jobs
where workforce_category <> 'Other' and estimated_salary is not null
group by workforce_category
order by avg_salary desc;

-- 9. Skills with highest demand

select skill, count(*) as total_mentions
from job_skills
group by skill
order by total_mentions desc;

-- 10. Skills by city

select j.normalized_city, js.skill, count(*) as total_mentions
from jobs as j
join job_skills as js
	on j.job_id = js.job_id
group by j.normalized_city, js.skill
order by j.normalized_city, total_mentions desc;

-- 11. Number of Senior Level jobs per city

select normalized_city, count(*) as total_jobs,
sum(
case
when experience_level = 'Senior Level' then 1
else 0
end
) as senior_jobs
from jobs
group by normalized_city
order by normalized_city, senior_jobs;

-- 12. Percentage of jobs per city

SELECT normalized_city, COUNT(*) AS total_jobs,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS job_share_pct
FROM jobs
GROUP BY normalized_city
ORDER BY total_jobs DESC;