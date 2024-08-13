Create database AirlineCustomerSatisfaction;
use AirlineCustomerSatisfaction 
Select 
  * 
from 
  Airline_customer_satisfaction;
-- Total Satisfied Customers
Select 
  SUM(
    Case When satisfaction = 'satisfied' Then 1 Else 0 End
  ) as 'Total Satisfied Customers' 
From 
  Airline_customer_satisfaction;
-- Dissatisfied Customers
Select 
  SUM(
    Case When satisfaction = 'dissatisfied' Then 1 Else 0 End
  ) as 'Total Dissatisfied Customers' 
From 
  Airline_customer_satisfaction;
--Total Customers
Select 
  COUNT(satisfaction) as 'Total Customers' 
from 
  Airline_customer_satisfaction;
Alter table 
  Airline_customer_satisfaction 
Drop 
  column Satisfied;
-- Total satisfied by Customer Type
Select 
  Customer_Type, 
  COUNT(satisfaction) as 'Total satisfied' 
from 
  Airline_customer_satisfaction 
Where 
  satisfaction = 'satisfied' 
group by 
  Customer_Type 
order by 
  COUNT(satisfaction) desc;
-- Total dissatisfied by Customer Type
Select 
  Customer_Type, 
  COUNT(satisfaction) as 'Total dissatisfied' 
from 
  Airline_customer_satisfaction 
Where 
  satisfaction = 'dissatisfied' 
group by 
  Customer_Type 
order by 
  COUNT(satisfaction) desc;
-- Calculate the percentage of satisfied customers
SELECT 
  (
    SUM(
      CASE WHEN satisfaction = 'satisfied' THEN 1 ELSE 0 END
    ) * 100.0 / COUNT(satisfaction)
  ) AS percentage_satisfied 
FROM 
  Airline_customer_satisfaction;
-- Calculate the percentage of dissatisfied customers
SELECT 
  (
    SUM(
      CASE WHEN satisfaction = 'dissatisfied' THEN 1 ELSE 0 END
    ) * 100.0 / COUNT(satisfaction)
  ) AS percentage_dissatisfied 
FROM 
  Airline_customer_satisfaction;
Select 
  Age, 
  Case When Age <= 12 Then 'Child' When Age >= 13 
  AND Age <= 19 Then 'Teenager' When Age >= 20 
  And Age <= 30 Then 'Young Adult' When Age > 30 
  AND Age <= 49 Then 'Middle Age' Else 'Senior' End as Age_Group 
from 
  Airline_customer_satisfaction 
group by 
  Age 
Order by 
  COUNT(satisfaction) desc;
Alter table 
  Airline_customer_satisfaction 
Add 
  Age_Group varchar(250);
Update 
  Airline_customer_satisfaction 
Set 
  Age_Group = 'Child' 
Where 
  Age <= 12;
Update 
  Airline_customer_satisfaction 
Set 
  Age_Group = 'Teenager' 
Where 
  Age >= 13 
  AND Age <= 19;
Update 
  Airline_customer_satisfaction 
Set 
  Age_Group = 'Young Adult' 
Where 
  Age >= 20 
  And Age <= 30 
Update 
  Airline_customer_satisfaction 
Set 
  Age_Group = 'Middle Age' 
Where 
  Age > 30 
  AND Age <= 49 
Update 
  Airline_customer_satisfaction 
Set 
  Age_Group = 'Senior' 
Where 
  Age > 49 -- Total satisfied customers by age group
Select 
  Age_Group, 
  COUNT(satisfaction) as 'Total Satisfied Customers' 
From 
  Airline_customer_satisfaction 
Where 
  satisfaction = 'satisfied' 
group by 
  Age_group 
order by 
  COUNT(satisfaction) desc;
-- Total dissatisfied customers by age group
Select 
  Age_Group, 
  COUNT(satisfaction) as 'Total Dissatisfied Customers' 
From 
  Airline_customer_satisfaction 
Where 
  satisfaction = 'dissatisfied' 
group by 
  Age_group 
order by 
  COUNT(satisfaction) desc;
-- Total satisfied by Travel Type
Select 
  Type_of_Travel, 
  COUNT(satisfaction) as 'Total satisfied' 
from 
  Airline_customer_satisfaction 
Where 
  satisfaction = 'satisfied' 
group by 
  Type_of_Travel 
order by 
  COUNT(satisfaction) desc;
-- Total dissatisfied by Travel Type
Select 
  Type_of_Travel, 
  COUNT(satisfaction) as 'Total dissatisfied' 
from 
  Airline_customer_satisfaction 
Where 
  satisfaction = 'dissatisfied' 
group by 
  Type_of_Travel 
order by 
  COUNT(satisfaction) desc;
--Service Quality Analysis - Seat Comfort
Select 
  AVG(Seat_Comfort) as 'Avg. Seat Comfort' 
From 
  Airline_customer_satisfaction;
