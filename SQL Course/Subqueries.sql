use Parks_and_Recreation;

-- Subqueries

select * 
from employee_demographics
where employee_id IN 
	(select employee_id
	  from employee_salary
	  where dept_id = 1
);


select first_name, salary, 
(select
 AVG(salary)  from employee_salary ) as Avg_salary
from employee_salary;

select gender, AVG(age), MAX(age), MIN(age), count(age)
from employee_demographics
group by gender;

SELECT AVG(MAXAge)
FROM 
(
    SELECT 
        gender, 
        AVG(age) AS AvgAge, 
        MAX(age) AS MaxAge, 
        MIN(age) AS MinAge, 
        COUNT(age) AS AgeCount
    FROM employee_demographics
    GROUP BY gender
) AS Agg_table
  ;

