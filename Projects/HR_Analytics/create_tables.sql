CREATE TABLE Departments (
    Dep_ID INT PRIMARY KEY,
    Dep_Name VARCHAR(50)
);

CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT,
    Dep_ID INT,
    Manager_ID INT
);

CREATE TABLE Projects (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100),
    Emp_ID INT
);

CREATE TABLE Attendance (
    Emp_ID INT,
    Days_Present INT
);
Create
#Which Department is the most expensive for the company:
SELECT d.DEP_ID, Dep_Name, SUM(SALARY), AVG(SALARY) AS AVGSAL, COUNT(e.Emp_ID) as EmpCount
FROM Departments as d
LEFT JOIN Employees as e
ON d.Dep_ID = e.Dep_ID
GROUP BY d.Dep_ID, d.Dep_Name
ORDER BY SUM(Salary) DESC;

#Which employees are paid above their department's average?
SELECT Emp_ID, Salary, DEPSAL
FROM (SELECT Emp_ID, Salary, AVG(Salary) OVER (Partition by Dep_ID) as DEPSAL FROM EMPLOYEES) AS Y
WHERE SALARY > DEPSAL;  

# Which employees may need attention due to low attendance?
    SELECT *
    FROM (SELECT e.Name, a.Days_Present, AVG(a.Days_Present) OVER () AS AVGATT FROM Employees AS e
    JOIN Attendance as a
    ON e.Emp_ID = a.Emp_ID) as Y
    WHERE Days_Present<AvgATT;
# Which managers handle the highest teams?
    SELECT e.Name AS MANAGER_NAME
    COUNT(e1.NAME) AS TOTAL_EMPLOYEES
    FROM EMPLOYEES as e
    JOIN EMPLOYEES e1
    ON e.EmpID=e1.MANAGER_ID
    GROUPBY e.Name
    ORDER BY TOTALEMPLOYEES DESC
    LIMIT 1

#  Create an Employee Performance Dashboard (where we need Employee name, department ID, Manager Name, Salary, Project_Name, Days Present
    SELECT e.Name,
       e1.Name AS Manager_Name,
       d.Dep_Name,
       e.Salary,
       p.Project_Name,
       a.Days_present
FROM Employees e
LEFT JOIN Employees e1
ON e.Manager_ID = e1.Emp_ID
LEFT JOIN Departments d
ON e.Dep_ID = d.Dep_ID
LEFT JOIN Projects p
ON e.Emp_ID = p.Emp_ID
LEFT JOIN Attendance a
ON e.Emp_ID = a.Emp_ID;

# Which department appears most productive?
SELECT d.Dep_Name, COUNT(DISTINCT e.Emp_ID) as employess_count, AVG(e.SALARY)as avg_Sal, AVG(a.DAYS_PRESENT) as avgattendance, COUNT(DISTINCT p.Project_Name)
as no_of_project
FROM departments as d
LEFT JOIN EMPLOYEES AS e
ON d.Dep_ID=e.Dep_ID
LEFT JOIN PROJECTS as p
ON e.Emp_ID=p.Emp_ID
LEFT JOIN ATTENDANCE as a
ON e.Emp_ID=a.Emp_ID
GROUP BY d.Dep_Name
ORDER BY no_of_project DESC;

    

