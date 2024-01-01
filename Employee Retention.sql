# 1.Average Attrition rate for all Departments

select Department, 
concat(round(avg(case when Attrition = 'Yes' then 1 else 0 end) * 100,2),'%') as AvgAttritionRate
from project.hr_1  
group by Department;

# 2.Average Hourly rate of Male Research Scientist

select JobRole,Gender,round(avg(HourlyRate),2) as average_hourly_rate
from project.hr_1
where Gender = 'Male' and JobRole ='Research Scientist';

# 3.Attrition rate Vs Monthly income states

select h1.Department,round(avg(h2.MonthlyIncome)) as average_income,
concat(round(avg(case when h1.Attrition = 'Yes' then 1 else 0 end) * 100,2),'%') as AvgAttritionRate
from project.hr_1 h1 join project.hr_2 h2 on h1.EmployeeNumber = h2.EmployeeID
group by h1.Department;
    
# 4.Average working years for each Department

select h1.Department,round(avg(h2.TotalWorkingYears),2) as average_working_years
from project.hr_1 h1 join project.hr_2 h2 on h1.EmployeeNumber = h2.EmployeeID
group by h1.Department;

# 5.Job Role Vs Work life balance

select
h1.JobRole,
sum(case when WorkLifeBalance = 1 then 1 else 0 end) as Excellent,
sum(case when WorkLifeBalance = 2 then 1 else 0 end) as Good,
sum(case when WorkLifeBalance = 3 then 1 else 0 end) as Average,
sum(case when WorkLifeBalance = 4 then 1 else 0 end) as Poor,
count(*) AS GrandTotal
from project.hr_1 h1 join project.hr_2 h2 on h1.EmployeeNumber = h2.EmployeeID
group by h1.JobRole;

# 6.Attrition rate Vs Year since last promotion relation

select h1.Department, round(avg(h2.YearsSinceLastPromotion),2) as AvgYearsSinceLastPromotion,
concat(round(avg(case when h1.Attrition = 'Yes' then 1 else 0 end) * 100,2),'%') as AvgAttritionRate
from project.hr_1 h1 join project.hr_2 h2 on h1.EmployeeNumber = h2.EmployeeID
group by h1.Department;