--1

--SELECT d.[Name] AS 'Department Name', emp.LastName, emp.FirstName,
--CASE WHEN emp.IsSupervisor = 1 THEN 'True' ELSE 'False' END AS Supervisor
--FROM Employee emp
--LEFT JOIN Department d 
--ON emp.DepartmentId = d.Id
--ORDER BY [Department Name], LastName, FirstName

--2

--SELECT [Name], Budget
--FROM Department
--ORDER BY Budget DESC

--3

--SELECT d.[Name], emp.FirstName, emp.LastName,
--CASE WHEN emp.IsSupervisor = 1 THEN 'True' ELSE 'False' END AS Supervisor
--FROM Department d
--LEFT JOIN Employee emp
--ON d.Id = emp.DepartmentId
--WHERE emp.IsSupervisor = 1;

--4

--SELECT d.[Name], COUNT(e.Id) AS 'Count of Employees in Department'
--FROM Employee e
--LEFT JOIN Department d
--ON d.Id = e.DepartmentId
--GROUP BY d.[Name]

--5

--UPDATE Department
--SET Budget = Budget * 1.2

--6

--SELECT e.FirstName, e.LastName, et.EmployeeId
--FROM Employee e
--LEFT JOIN EmployeeTraining et
--ON e.Id = et.EmployeeId
--WHERE et.EmployeeId IS NULL

--7

--SELECT e.FirstName, e.LastName, COUNT(et.Id) AS 'Training Programs Enrolled In'
--FROM Employee e
--LEFT JOIN EmployeeTraining et
--ON e.Id = et.EmployeeId
--WHERE et.EmployeeId IS NOT NULL
--GROUP BY e.FirstName, e.LastName

--8

--SELECT tp.[Name], COUNT(et.EmployeeId) AS 'Count of Attendees'
--FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et
--ON tp.Id = et.TrainingProgramId
--GROUP BY tp.[Name]

--9

--SELECT tp.[Name], COUNT(et.EmployeeId) AS 'Count of Attendees'
--FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et
--ON tp.Id = et.TrainingProgramId
--GROUP BY tp.[Name], tp.MaxAttendees
--HAVING COUNT(et.EmployeeId) = tp.MaxAttendees

--10

--SELECT tp.[Name], tp.StartDate, tp.EndDate
--FROM TrainingProgram tp
--WHERE tp.StartDate > GETDATE();

--11

--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (3, 3)
--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (4, 3)
--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (5, 3)

--12

--SELECT TOP 3 tp.Id, COUNT(et.EmployeeId) AS 'Count of Attendees'
--FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et
--ON tp.Id = et.TrainingProgramId
--GROUP BY tp.Id
--ORDER BY Count(et.EmployeeId) DESC;

--13

--SELECT TOP 3 tp.[Name], COUNT(et.EmployeeId) AS 'Count of Attendees'
--FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et
--ON tp.Id = et.TrainingProgramId
--GROUP BY tp.[Name]
--ORDER BY Count(et.EmployeeId) DESC;

--14

--SELECT CONCAT(e.FirstName, ' ', e.LastName) as FullName, ce.Id AS 'ComputerId'
--FROM Employee e
--LEFT JOIN ComputerEmployee ce
--ON e.Id = ce.ComputerId
--WHERE ce.ComputerId IS NULL