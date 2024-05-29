-- Where clause

use Parks_and_Recreation;

select * from employee_salary
where salary <= 50000;


select * from employee_demographics


-- AND OR NOT -- Logical Operators

select * from employee_demographics
where (first_name = 'Leslie' and age = 44) or age > 55;

-- Like statement
-- % and _

select * from employee_demographics
where birth_date like '1989%';
