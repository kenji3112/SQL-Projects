use Parks_and_Recreation;
select * from employee_demographics;


select first_name, 
last_name, 
birth_date,
age,
(age + 10) * 10 + 10
from employee_demographics;
-- PEMDAS

select distinct first_name, gender from employee_demographics;

