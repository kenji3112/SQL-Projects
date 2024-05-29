use Parks_and_Recreation;

select gender, AVG(age), MAX(age), MIN(age), COUNT(age)
from employee_demographics
group by gender;


-- Order by 

select * 
from employee_demographics
order by gender, age desc;