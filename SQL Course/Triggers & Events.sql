-- Triggers and Events


-- Create the trigger
CREATE TRIGGER employee_insert 
ON employee_salary
AFTER INSERT
AS
BEGIN
    INSERT INTO employee_demographics (employee_id, first_name, last_name)
    SELECT i.employee_id, i.first_name, i.last_name
    FROM inserted i;
END;
GO

-- Test the trigger with an insert
INSERT INTO employee_salary (employee_id, first_name, last_name, salary)
VALUES (13, 'John', 'Doe', 50000);

-- Check the results
SELECT * FROM employee_demographics;

-- Events
 SELECT *
 FROM employee_demographics;

 CREATE EVENT delete_retirees
 ON SCHEDULE EVERY 30 SECOND
 DO
 BEGIN
	 DELETE
     FROM employee_demographics
	 WHERE age >= 60;
 END