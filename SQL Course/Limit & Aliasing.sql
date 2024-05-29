-- Limit & Aliasing
use Parks_and_Recreation;

select top 3 *
from employee_demographics
order by age desc;

-- Aliasing

select gender, AVG(age) as avg_age
from employee_demographics
group by gender
having AVG(age) > 40;