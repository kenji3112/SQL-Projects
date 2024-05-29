use Parks_and_Recreation;

select gender, AVG(age)
from employee_demographics
group by gender;
