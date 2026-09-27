create database HR_Attrition;
use HR_Attrition;

RENAME TABLE `wa_fn-usec_-hrem       employees` TO employees;
show tables;

1.Write a SQL query to determine the total number of employees in the organization and the total number of employees who have left the organization.”
  Select SUM(EmployeeCount) as total_emp,
  SUM(
       CASE WHEN Attrition='Yes'THEN 1
       ELSE 0
       END
       ) AS left_emp
  from employees;
  
  
  2.Write a SQL query to find the total number of employees in each department.
  Select Department,SUM(Employeecount) as total_emp
  from employees
  group by Department;
  
  3.“Write a SQL query to determine the number of employees who have left the organization in each department
    select Department,SUM(
               CASE WHEN Attrition='Yes' Then 1
               ELSE 0
               END
               ) AS left_emp
               
		from employees
		group by Department;
        
4.Write a SQL query to calculate the attrition rate for each department.
 SELECT
    Department,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
    / SUM(EmployeeCount) AS attrition_rate
FROM employees
GROUP BY Department
ORDER BY attrition_rate DESC;

5.Write a SQL query to identify the job roles with the highest attrition rates.
 Select Jobrole,SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100
    / SUM(EmployeeCount) AS attrition_rate
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate DESC
LIMIT 1;

6.Write a SQL query to compare the attrition rates of employees who work overtime versus those who do not work overtime.
select OverTime,SUM( 
                    CASE WHEN attrition='yes' THEN 1
                    ELSE 0
                    END
                    ) 
                    /SUM(Employeecount) *100 as attrition_rate
			from employees
			group by OverTime;
                
7.Write a SQL query to calculate the average monthly income for each department.” 
select Department,AVG(MonthlyIncome) as avg_monthly_income
from employees
group by Department;               

8.Write a SQL query to calculate the attrition rate for each employee tenure group.
                                        
 SELECT
    CASE
        WHEN YearsAtCompany BETWEEN 0 AND 2 THEN '0-2'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10'
        WHEN YearsAtCompany BETWEEN 11 AND 20 THEN '11-20'
        ELSE '21+'
    END AS TenureGroup,

    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) / SUM(EmployeeCount) * 100 AS attrition_rate

FROM employees

GROUP BY
    CASE
        WHEN YearsAtCompany BETWEEN 0 AND 2 THEN '0-2'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10'
        WHEN YearsAtCompany BETWEEN 11 AND 20 THEN '11-20'
        ELSE '21+'
    END

ORDER BY attrition_rate DESC;

9.Write a SQL query to calculate the attrition rate for each job satisfaction level.
SELECT
    JobSatisfaction,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
    / SUM(EmployeeCount) * 100 AS attrition_rate
FROM employees
GROUP BY JobSatisfaction;

10.Write a SQL query to identify employees who belong to high-risk attrition segments based on multiple conditions.
SELECT
    EmployeeNumber,
    JobRole,
    OverTime,
    JobSatisfaction,
    YearsAtCompany,
    Attrition
FROM employees
WHERE OverTime = 'Yes'
AND JobSatisfaction <= 2
AND YearsAtCompany <= 2