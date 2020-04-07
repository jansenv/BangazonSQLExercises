--1

SELECT d.[Name] AS 'Department Name', emp.LastName, emp.FirstName,
CASE WHEN emp.IsSupervisor = 1 THEN 'True' else 'False' END AS Supervisor
FROM Employee emp
LEFT JOIN Department d 
ON emp.DepartmentId = d.Id
ORDER BY [Department Name], LastName, FirstName

--2

