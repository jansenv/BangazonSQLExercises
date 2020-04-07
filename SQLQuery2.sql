--1: List each employee first name, last name and supervisor status along with their department name. Order by department name, then by employee last name, and finally by employee first name.

--SELECT d.[Name] AS 'Department Name', emp.LastName, emp.FirstName,
--CASE WHEN emp.IsSupervisor = 1 THEN 'True' ELSE 'False' END AS Supervisor
--FROM Employee emp
--LEFT JOIN Department d 
--ON emp.DepartmentId = d.Id
--ORDER BY [Department Name], LastName, FirstName

--2: List each department ordered by budget amount with the highest first.

--SELECT [Name], Budget
--FROM Department
--ORDER BY Budget DESC

--3: List each department name along with any employees (full name) in that department who are supervisors.

--SELECT d.[Name], emp.FirstName, emp.LastName,
--CASE WHEN emp.IsSupervisor = 1 THEN 'True' ELSE 'False' END AS Supervisor
--FROM Department d
--LEFT JOIN Employee emp
--ON d.Id = emp.DepartmentId
--WHERE emp.IsSupervisor = 1;

--4: List each department name along with a count of employees in each department.

--SELECT d.[Name], COUNT(e.Id) AS 'Count of Employees in Department'
--FROM Employee e
--LEFT JOIN Department d
--ON d.Id = e.DepartmentId
--GROUP BY d.[Name]

--5: Write a single update statement to increase each department's budget by 20%.

--UPDATE Department
--SET Budget = Budget * 1.2

--6: List the employee full names for employees who are not signed up for any training programs.

--SELECT e.FirstName, e.LastName, et.EmployeeId
--FROM Employee e
--LEFT JOIN EmployeeTraining et
--ON e.Id = et.EmployeeId
--WHERE et.EmployeeId IS NULL

--7: List the employee full names for employees who are signed up for at least one training program and include the number of training programs they are signed up for.

--SELECT e.FirstName, e.LastName, COUNT(et.Id) AS 'Training Programs Enrolled In'
--FROM Employee e
--LEFT JOIN EmployeeTraining et
--ON e.Id = et.EmployeeId
--WHERE et.EmployeeId IS NOT NULL
--GROUP BY e.FirstName, e.LastName

--8: List all training programs along with the count employees who have signed up for each.

--SELECT tp.[Name], COUNT(et.EmployeeId) AS 'Count of Attendees'
--FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et
--ON tp.Id = et.TrainingProgramId
--GROUP BY tp.[Name]

--9: List all training programs who have no more seats available.

--SELECT tp.[Name], COUNT(et.EmployeeId) AS 'Count of Attendees'
--FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et
--ON tp.Id = et.TrainingProgramId
--GROUP BY tp.[Name], tp.MaxAttendees
--HAVING COUNT(et.EmployeeId) = tp.MaxAttendees

--10: List all future training programs ordered by start date with the earliest date first.

--SELECT tp.[Name], tp.StartDate, tp.EndDate
--FROM TrainingProgram tp
--WHERE tp.StartDate > GETDATE();

--11: Assign a few employees to training programs of your choice.

--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (3, 3)
--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (4, 3)
--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (5, 3)

--12: List the top 3 most popular training programs. (For this question, consider each record in the training program table to be a UNIQUE training program).

--SELECT TOP 3 tp.Id, COUNT(et.EmployeeId) AS 'Count of Attendees'
--FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et
--ON tp.Id = et.TrainingProgramId
--GROUP BY tp.Id
--ORDER BY Count(et.EmployeeId) DESC;

--13: List the top 3 most popular training programs. (For this question consider training programs with the same name to be the SAME training program).

--SELECT TOP 3 tp.[Name], COUNT(et.EmployeeId) AS 'Count of Attendees'
--FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et
--ON tp.Id = et.TrainingProgramId
--GROUP BY tp.[Name]
--ORDER BY Count(et.EmployeeId) DESC;

--14: List all employees who do not have computers.

--SELECT CONCAT(e.FirstName, ' ', e.LastName) as FullName, ce.Id AS 'EmployeeId'
--FROM Employee e
--LEFT JOIN ComputerEmployee ce
--ON e.Id = ce.EmployeeId
--WHERE ComputerId IS NULL

--15: List all employees along with their current computer information make and manufacturer combined into a field entitled ComputerInfo. If they do not have a computer, this field should say "N/A".

--SELECT CONCAT(e.FirstName, ' ', e.LastName) as FullName, ce.Id AS 'ComputerId', COALESCE((c.Manufacturer + ' ' + c.Make), 'N/A') AS 'ComputerInfo'
--FROM Employee e
--LEFT JOIN ComputerEmployee ce
--ON e.Id = ce.EmployeeId
--LEFT JOIN Computer c
--ON ce.ComputerId = c.Id
--WHERE c.DecomissionDate IS NULL

--16: List all computers that were purchased before July 2019 that are have not been decommissioned.

--SELECT Manufacturer, Make, PurchaseDate, DecomissionDate
--FROM Computer
--WHERE PurchaseDate < '20190701'
--AND DecomissionDate IS NULL

--17: List all employees along with the total number of computers they have ever had.

--SELECT e.Id, e.FirstName, e.LastName, COUNT(ce.Id) AS 'Computers Used'
--FROM Employee e
--LEFT JOIN ComputerEmployee ce
--ON e.Id = ce.EmployeeId
--GROUP BY e.Id, e.FirstName, e.LastName

--18: List the number of customers using each payment type

--19: List the 10 most expensive products and the names of the seller

--20: List the 10 most purchased products and the names of the seller

--21: Find the name of the customer who has made the most purchases

--22: List the amount of total sales by product type

--23: List the total amount made from all sellers