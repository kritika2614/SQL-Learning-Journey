SELECT e.Name,
       d.Dep_Name
FROM Employees e
INNER JOIN Departments d
ON e.Dep_ID = d.Dep_ID;
