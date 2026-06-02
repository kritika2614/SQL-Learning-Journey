Select Name, Salary
Fom Employees
Where Salary > (Select MAX(Salary) From Employees)
LIMIT 1;
