-- CTEs
use Parks_and_Recreation;

WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal)AS
(
    SELECT 
       gender, AVG(salary) Avg_salary, MAX(salary) Max_salary, MIN(salary) Min_salary, COUNT(salary) Salary_num
	   from employee_demographics dem
	   join employee_salary sal
	    on dem.employee_id = sal.employee_id
		group by gender
)
SELECT *
FROM CTE_Example;


WITH CTE_Example AS
(
    SELECT 
       employee_id, gender, birth_date
	   from employee_demographics dem
	   where birth_date > '1985-01-01'
),
CTE_Example2 AS 
(
select employee_id, salary from employee_salary
where salary > 50000
)
SELECT *
FROM CTE_Example
join CTE_Example2
 on CTE_Example.employee_id = CTE_Example2.employee_id
;

