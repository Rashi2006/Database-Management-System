CREATE TABLE Dept (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    Salary DECIMAL(8, 2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Dept(DepartmentID)
);

INSERT INTO Dept (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

INSERT INTO Person (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

--Part – A: 
--1. Find all persons with their department name & code. 
SELECT PERSON.PersonName , DEPT.DepartmentName , DEPT.DepartmentCode FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID;

--2. Find the person's name whose department is in C-Block. 
SELECT PERSON.PersonName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE DEPT.Location='C-BLOCK';

--3. Retrieve person name, salary & department name who belongs to Jamnagar city. 
SELECT PERSON.PersonName,Person.Salary,DEPT.DepartmentName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE PERSON.City='JAMNAGAR';

--4. Retrieve person name, salary & department name who does not belong to Rajkot city.
SELECT PERSON.PersonName,Person.Salary,DEPT.DepartmentName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE NOT PERSON.City='RAJKOT';

--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
SELECT PERSON.PersonName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE DEPT.DepartmentName='CIVIL' AND Person.JoiningDate>'1-Aug-2001';

--6. Find details of all persons who belong to the computer department. 
SELECT PERSON.PersonName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE DEPT.DepartmentName='COMPUTER';


--7. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days. 
SELECT Person.PersonName , DEPT.DepartmentName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE DATEDIFF(DAY , GETDATE(),PERSON.JoiningDate)>365;
--8. Find department wise person counts. 
SELECT COUNT(PERSON.PersonName) , DEPT.DepartmentName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID GROUP BY DEPT.DepartmentName;

--9. Give department wise maximum & minimum salary with department name.
SELECT MAX(PERSON.SALARY) , MIN(Person.Salary) , DEPT.DepartmentName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID GROUP BY DEPT.DepartmentName;

--10. Find city wise total, average, maximum and minimum salary.
SELECT MAX(SALARY) , MIN(Salary) ,SUM(Salary),AVG(Salary), City FROM PERSON GROUP BY CITY;

--11. Find the average salary of a person who belongs to Ahmedabad city.
SELECT AVG(Salary) FROM PERSON WHERE CITY='AHMEDABAD';

--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column) 
SELECT Person.PersonName + 'LIVES IN' + PERSON.City + 'AND WORKS IN' + DEPT.DepartmentName + 'DEPARTMENT' FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID;

--Part – B: 
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column) 
SELECT PERSON.PersonName + ' EARNS ' +  CAST(Person.Salary AS VARCHAR(10)) + ' FROM ' + DEPT.DepartmentName + ' DEPARTMENT MONTHLY'FROM PERSON JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID;
--2. Find city & department wise total, average & maximum salaries.
SELECT  MAX(PERSON.Salary) ,SUM(PERSON.Salary),AVG(PERSON.Salary) FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID GROUP BY Person.City , DEPT.DepartmentName;
--3. Find all persons who do not belong to any department. 
SELECT PERSONNAME FROM Person WHERE DepartmentID IS NULL;
--4. Find all departments whose total salary is exceeding 100000.
SELECT DEPT.DepartmentName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID GROUP BY DEPT.DepartmentName HAVING SUM(PERSON.SALARY)>100000;

--Part – C: 
--1. List all departments who have no person.
SELECT DEPT.DepartmentName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID GROUP BY DEPT.DepartmentName HAVING COUNT(PERSON.PERSONNAME)=0; 

--2. List out department names in which more than two persons are working. 
SELECT DEPT.DepartmentName FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID GROUP BY DEPT.DepartmentName HAVING COUNT(PERSON.PERSONNAME)>2; 

--3. Give a 10% increment in the computer department employee’s salary. (Use Update) 
UPDATE PERSON SET PERSON.Salary = PERSON.Salary * 0.10 FROM PERSON  JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID WHERE DEPT.DepartmentName = 'COMPUTER';
SELECT SALARY FROM PERSON;