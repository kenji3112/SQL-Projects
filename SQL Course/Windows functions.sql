use Parks_and_Recreation;

-- Windows Functions

  select gender, AVG(salary) as Avg_salary
  from employee_demographics dem
  join employee_salary sal
  on dem.employee_id = sal.employee_id
  group by gender;


  select dem.first_name,dem.last_name, AVG(salary) OVER(partition by gender) as Avg_salary
    from employee_demographics dem
    join employee_salary sal
     on dem.employee_id = sal.employee_id;
  
  
  select dem.first_name,dem.last_name, AVG(salary) as Avg_salary
    from employee_demographics dem
    join employee_salary sal
     on dem.employee_id = sal.employee_id
	group by dem.first_name,dem.last_name;

   select dem.first_name,dem.last_name, gender, salary,
	  sum(salary) OVER(partition by gender order by dem.employee_id) as Rolling_Total
      from employee_demographics dem
      join employee_salary sal
      on dem.employee_id = sal.employee_id;

	  select dem.employee_id,dem.first_name,dem.last_name, gender, salary,
	  ROW_NUMBER() over(partition by gender order by salary desc) as Row_No,
	  RANK() over(partition by gender order by salary desc) as Rank_No,
	  DENSE_RANK() over(partition by gender order by salary desc) as Dense_Rank_No
      from employee_demographics dem
      join employee_salary sal
      on dem.employee_id = sal.employee_id;
  	  

  	  
