create database hr_analysis;

use hr_analysis;

select * from hr_1 limit 10;
select * from hr_2 limit 10;

ALTER TABLE hr_2 CHANGE `Employee Id` Employee_Id INT;



								-- Average Attrition Rate for All Departments --

SELECT  Department ,(COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*) AS Avg_Attrition_Rate
FROM hr_1 as e 
GROUP BY e.Department;



								-- Average Hourly Rate of Male Research Scientists --

SELECT AVG(e.HourlyRate) AS Avg_Hourly_Rate
FROM hr_1 as e
WHERE e.Gender = 'Male' AND e.JobRole = 'Research Scientist';




								-- Attrition Rate vs Monthly Income Stats --

select  e.attrition, count(*) as No_of_employees, avg(s.monthlyIncome) as Average_Monthly_Income
from hr_1 as e inner join hr_2 as s 
on e.employeenumber = s.Employee_ID
group by attrition;




								-- Average Working Years for Each Department --

SELECT e.Department, AVG(s.TotalWorkingYears) AS Avg_Working_Years
FROM hr_1 as e join hr_2 as s 
on e.Employeenumber = s.Employee_ID
GROUP BY Department;




								-- Job Role vs Work-Life Balance -- 

SELECT e.JobRole, AVG(s.WorkLifeBalance) AS Avg_WorkLife_Balance
FROM hr_1 as e
JOIN hr_2 as s ON e.Employeenumber = s.Employee_ID
GROUP BY e.JobRole;




								-- Attrition Rate vs Years Since Last Promotion --


select e.attrition, AVG(s.yearssincelastpromotion) as Avg_Last_Promotion
FROM hr_1 as e
JOIN hr_2 as s ON e.Employeenumber = s.Employee_ID
GROUP BY e.attrition;

				-- OR --

SELECT s.YearsSinceLastPromotion, 
       COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) AS Employees_Left,
       (COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*) AS Attrition_Rate
FROM hr_1 as e JOIN hr_2 as s 
ON e.Employeenumber = s.Employee_ID
GROUP BY s.YearsSinceLastPromotion
ORDER BY s.YearsSinceLastPromotion;








