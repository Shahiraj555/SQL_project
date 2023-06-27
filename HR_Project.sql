SELECT * FROM hr_data.hrdata;

-- Employee Count
select sum(employee_count) as Employee_count from hrdata;


-- Attrition Count 
select count(attrition) as Attrition_count from hrdata
where attrition = "Yes";

-- Attrition Rate
select round(((select count(attrition)  from hrdata
where attrition = "Yes") / sum(employee_count))*100,2)
as Attrition_Rate
from hrdata;

-- Active Employee
select sum(employee_count) - (select count(attrition) as Attrition_count from hrdata
where attrition = "Yes") as Active_Employee from hrdata;


-- Average_Age

select Round(avg(age),0) as Avg_age from hrdata;

-- Attrition by Gender

select gender, count(attrition) from hrdata
where attrition ="Yes"
group by gender
order by count(attrition) desc;

-- Department wise attrition

select department,count(attrition),
count(attrition) / (select count(attrition) from hrdata where attrition="Yes")*100 from hrdata
where attrition ="Yes"
group by department
order by count(attrition) desc;

-- No of Employees by age group

select age,count(employee_count) as No_of_Employee from hrdata
group by age
order by count(employee_count) desc;

-- job satisfacation Rating


select job_role, 
(case job_satisfaction when 1 then sum(employee_count) END) as `one`,
(case job_satisfaction when 2 then sum(employee_count) END) as two,
(case job_satisfaction when 3 then sum(employee_count) END) as three,
(case job_satisfaction when 4 then sum(employee_count) END) as four
from hrdata
group by job_role, job_satisfaction
order by job_role, job_satisfaction;


SELECT
    job_role,
    SUM(CASE WHEN job_satisfaction = 1 THEN employee_count ELSE 0 END) AS Rating_1_Count,
    SUM(CASE WHEN job_satisfaction = 2 THEN employee_count ELSE 0 END) AS Rating_2_Count,
    SUM(CASE WHEN job_satisfaction = 3 THEN employee_count ELSE 0 END) AS Rating_3_Count,
    SUM(CASE WHEN job_satisfaction = 4 THEN employee_count ELSE 0 END) AS Rating_4_Count
FROM hrdata
GROUP BY job_role;


-- Attrition Rate by Gender for different Age Group

select age_band,gender,count(attrition),
round((cast(count(attrition) as signed)/(select count(attrition) from hrdata where attrition="Yes"))*100,2) as pct
from hrdata
where attrition='Yes'
group by age_band,gender
order by age_band,gender desc;




-- Education Field by Attrition

select education_field, count(attrition) ,
round(count(attrition) / (select count(attrition) from hrdata where attrition="Yes")*100,2) as Attrition_Rate
from hrdata 
where attrition="Yes" 
group by education_field
order by count(attrition) desc


