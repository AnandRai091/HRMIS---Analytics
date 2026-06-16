-- Employee Count:
select sum(employee_count) as Employee_Count from hrdata;

-- Attrition Count:
select count(attrition) from hrdata where attrition='Yes';

-- Attrition Rate:
SELECT 
    ROUND(
        (SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(employee_count)) * 100, 
        2
    ) AS Attrition_Rate
FROM hrdata;

-- Active Employee:
SELECT 
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS Active_Employees
FROM hrdata;

-- Average Age:
select round(avg(age),0) from hrdata;

-- Attrition by Gender
select gender, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by gender
order by count(attrition) desc;

-- Department wise Attrition:
SELECT 
    department, 
    COUNT(attrition) AS attrition_count, 
    ROUND(
        (COUNT(attrition) / SUM(COUNT(attrition)) OVER()) * 100, 
        2
    ) AS pct 
FROM hrdata
WHERE attrition = 'Yes'
GROUP BY department 
ORDER BY attrition_count DESC;

-- No of Employee by Age Group
SELECT age,  sum(employee_count) AS employee_count FROM hrdata
GROUP BY age
order by age;

-- Education Field wise Attrition:
select education_field, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by education_field
order by count(attrition) desc;

-- Attrition Rate by Gender for different Age Group
SELECT 
    age_band,
    gender, 
    COUNT(attrition) AS attrition_count, 
    ROUND(
        (COUNT(attrition) / SUM(COUNT(attrition)) OVER()) * 100, 
        2
    ) AS pct
FROM hrdata
WHERE attrition = 'Yes'
GROUP BY age_band, gender
ORDER BY age_band ASC, gender DESC;

-- Job Satisfaction Rating
SELECT 
    job_role,
    SUM(CASE WHEN job_satisfaction = 1 THEN employee_count ELSE 0 END) AS one,
    SUM(CASE WHEN job_satisfaction = 2 THEN employee_count ELSE 0 END) AS two,
    SUM(CASE WHEN job_satisfaction = 3 THEN employee_count ELSE 0 END) AS three,
    SUM(CASE WHEN job_satisfaction = 4 THEN employee_count ELSE 0 END) AS four
FROM hrdata
GROUP BY job_role
ORDER BY job_role;









