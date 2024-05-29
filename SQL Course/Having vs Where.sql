use Parks_and_Recreation

select gender, AVG(age)
from employee_demographics
group by gender
having AVG(age) > 40;

select occupation, AVG(salary) 
from employee_salary
where occupation like '%manager%'
group by occupation
having  AVG(salary) > 75000;