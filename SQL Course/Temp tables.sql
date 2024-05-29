-- Temporary Tables
use Parks_and_Recreation;

create table #temp_table (
  first_name varchar(50),
  last_name varchar(50),
  favorite_movie varchar(100)
);



insert into #temp_table (first_name,last_name,favorite_movie) 
 values
 ('Kenji','Crespo','Halloween')
;


select * 
from #temp_table;

-- Step 1: Create a CTE with ROW_NUMBER to identify duplicates
WITH CTE_Duplicates AS (
    SELECT 
        first_name, 
        last_name,
        favorite_movie,
        ROW_NUMBER() OVER (PARTITION BY first_name, last_name, favorite_movie ORDER BY first_name) AS RowNum
    FROM 
        #temp_table
)
-- Step 2: Delete rows with RowNum greater than 1
	DELETE FROM CTE_Duplicates
	WHERE RowNum > 1;


 select * 
 from employee_salary;


 -- Create and populate the temporary table
	SELECT * 
	INTO #salary_over_50k
	FROM employee_salary
	WHERE salary >= 50000;

-- Select from the temporary table
	SELECT * 
	FROM #salary_over_50k;
