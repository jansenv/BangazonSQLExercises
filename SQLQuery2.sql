--1

SELECT d.[Name] AS 'Department Name', emp.LastName, emp.FirstName,
CASE WHEN emp.IsSupervisor = 1 THEN 'True' ELSE 'False' END AS Supervisor
FROM Employee emp
LEFT JOIN Department d 
ON emp.DepartmentId = d.Id
ORDER BY [Department Name], LastName, FirstName

--2

SELECT [Name], Budget
FROM Department
ORDER BY Budget DESC

--3

SELECT d.[Name], emp.FirstName, emp.LastName,
CASE WHEN emp.IsSupervisor = 1 THEN 'True' ELSE 'False' END AS Supervisor
FROM Department d
LEFT JOIN Employee emp
ON d.Id = emp.DepartmentId
WHERE emp.IsSupervisor = 1;

--4

SELECT COUNT(e.Id) AS 'Count of Employees in Department'
FROM Employee e
LEFT JOIN Department d
ON d.Id = e.DepartmentId
GROUP BY d.[Name]