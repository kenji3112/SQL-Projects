-- Stored Procedures


---- Create the stored procedure
--CREATE PROCEDURE large_salaries
--AS
--BEGIN
--    SELECT *
--    FROM employee_salary
--    WHERE salary >= 50000;
--END;
--GO

---- Execute the stored procedure
--EXEC large_salaries;


-- Create the stored procedure
--CREATE PROCEDURE large_salaries2
--AS
--BEGIN
--    SELECT *
--    FROM employee_salary
--    WHERE salary >= 50000;
    
--    SELECT *
--    FROM employee_salary
--    WHERE salary >= 10000;
--END;
--GO

---- Execute the stored procedure
--EXEC large_salaries2;


-- Create the stored procedure
CREATE PROCEDURE large_salaries4
    @employee_id INT
AS
BEGIN
    SELECT salary
    FROM employee_salary
    WHERE employee_id = @employee_id;
END;
GO

-- Execute the stored procedure
EXEC large_salaries4 @employee_id = 1;

