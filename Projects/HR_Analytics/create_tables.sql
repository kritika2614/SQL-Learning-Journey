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
