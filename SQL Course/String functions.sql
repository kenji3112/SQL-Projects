use Parks_and_Recreation;

-- String functions

select LEN('skyfall');

select first_name, upper(first_name)
from employee_demographics
;

select UPPER('sky');
select lower('sky');


select rtrim('     sky      ');

select first_name, 
LEFT(first_name,3),
right(first_name,3),
SUBSTRING(first_name,3,2),
birth_date,
SUBSTRING(CONVERT(VARCHAR(10), birth_date, 111), 6, 2) as birth_month
from employee_demographics;

select first_name, last_name,
CONCAT(first_name,' ',last_name)
from employee_demographics;

select charindex('x','Alexander');
