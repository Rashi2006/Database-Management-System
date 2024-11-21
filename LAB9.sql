------------------------------------------------------------SUB QUERIES

CREATE TABLE Stu_Detail (
    Rno INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);

INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

CREATE TABLE Academic (
    Rno INT,
    SPI DECIMAL(3, 1),
    Bklog INT
);

INSERT INTO Academic (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

CREATE TABLE Department (
    DID INT,
    DName VARCHAR(50)
);

INSERT INTO Department (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

--Part – A: 
--1. Display details of students who are from computer department. 
SELECT * FROM STU_DETAIL WHERE DID=(SELECT DID FROM DEPARTMENT WHERE DNAME='COMPUTER');

--2. Displays name of students whose SPI is more than 8. 
SELECT NAME FROM Stu_Detail WHERE RNO IN (SELECT RNO FROM ACADEMIC WHERE SPI>8);

--3. Display details of students of computer department who belongs to Rajkot city.
SELECT * FROM Stu_Detail WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DNAME='COMPUTER');

--4. Find total number of students of electrical department. 
SELECT COUNT(NAME) FROM Stu_Detail WHERE DID IN (SELECT DID FROM DEPARTMENT WHERE DNAME='ELECTRICAL');

--5. Display name of student who is having maximum SPI. 
SELECT NAME FROM Stu_Detail WHERE RNO = (SELECT RNO FROM ACADEMIC WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC));

--6. Display details of students having more than 1 backlog.
SELECT * FROM Stu_Detail WHERE RNO IN (SELECT RNO FROM ACADEMIC WHERE BKLOG>1);

--Part – B: 
--1. Display name of students who are either from computer department or from mechanical department.
SELECT NAME FROM Stu_Detail WHERE DID IN (SELECT DID FROM DEPARTMENT WHERE DNAME IN ('COMPUTER','MECHANICAL'));

--2. Display name of students who are in same department as 102 studying in.
SELECT NAME FROM Stu_Detail WHERE DID = (SELECT DID FROM Stu_Detail WHERE RNO=102);

--Part – C: 
--1. Display name of students whose SPI is more than 9 and who is from electrical department. 
SELECT NAME FROM Stu_Detail WHERE ( RNO IN (SELECT RNO FROM ACADEMIC WHERE SPI>9) AND DID IN (SELECT DID FROM DEPARTMENT WHERE DNAME='ELECTRICAL'));

--2. Display name of student who is having second highest SPI. 
SELECT NAME FROM Stu_Detail WHERE  RNO = (SELECT RNO FROM ACADEMIC WHERE SPI=(SELECT MAX(SPI) FROM ACADEMIC WHERE SPI<(SELECT MAX(SPI) FROM ACADEMIC)));

--3. Display city names whose students branch wise SPI is 9.2
SELECT CITY FROM Stu_Detail WHERE RNO IN (SELECT RNO FROM ACADEMIC WHERE SPI=9.2);



-----------------------------------------------------SET OPERATORS

CREATE TABLE Computer (
    RollNo INT,
    Name VARCHAR(50)
);


INSERT INTO Computer (RollNo, Name) VALUES
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');

CREATE TABLE Electrical (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Electrical (RollNo, Name) VALUES
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');


------------------ PART B ----------------------



CREATE TABLE Emp_DATA (
    EID INT,
    Name VARCHAR(50)
);

INSERT INTO Emp_DATA (EID, Name) VALUES
(1, 'Ajay'),
(9, 'Haresh'),
(5, 'Manish');

CREATE TABLE Customer (
    CID INT,
    Name VARCHAR(50)
);

INSERT INTO Customer (CID, Name) VALUES
(5, 'Ajay'),
(7, 'Mahesh'),
(5, 'Manish');

--PART- A
--1. Display name of students who is either in Computer or in Electrical. 
SELECT NAME FROM COMPUTER UNION SELECT NAME FROM Electrical;

--2. Display name of students who is either in Computer or in Electrical including duplicate data.
SELECT NAME FROM COMPUTER UNION ALL SELECT NAME FROM Electrical;
--3. Display name of students who is in both Computer and Electrical.
SELECT NAME FROM COMPUTER INTERSECT SELECT NAME FROM Electrical;

--4. Display name of students who are in Computer but not in Electrical.
SELECT NAME FROM COMPUTER EXCEPT SELECT NAME FROM Electrical;

--5. Display name of students who are in Electrical but not in Computer.
SELECT NAME FROM Electrical EXCEPT SELECT NAME FROM COMPUTER;

--6. Display all the details of students who are either in Computer or in Electrical. 
SELECT * FROM COMPUTER UNION SELECT * FROM Electrical;

--7. Display all the details of students who are in both Computer and Electrical.
SELECT * FROM COMPUTER INTERSECT SELECT * FROM Electrical;

--Part – B: 
--1. Display name of persons who is either Employee or Customer. 
SELECT NAME FROM Emp_DATA UNION SELECT NAME FROM CUSTOMER;

--2. Display name of persons who is either Employee or Customer including duplicate data.
SELECT NAME FROM Emp_DATA UNION ALL SELECT NAME FROM CUSTOMER;

--3. Display name of persons who is both Employee as well as Customer. 
SELECT NAME FROM Emp_DATA INTERSECT SELECT NAME FROM CUSTOMER;

--4. Display name of persons who are Employee but not Customer. 
SELECT NAME FROM Emp_DATA EXCEPT SELECT NAME FROM CUSTOMER;

--5. Display name of persons who are Customer but not Employee. 
SELECT NAME FROM CUSTOMER EXCEPT SELECT NAME FROM Emp_DATA;

--Part – C:  
--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only. 
SELECT * FROM Emp_DATA UNION SELECT * FROM CUSTOMER;

SELECT * FROM Emp_DATA UNION ALL SELECT * FROM CUSTOMER;

SELECT * FROM Emp_DATA INTERSECT SELECT * FROM CUSTOMER;

SELECT * FROM Emp_DATA EXCEPT SELECT * FROM CUSTOMER;

SELECT * FROM CUSTOMER EXCEPT SELECT * FROM Emp_DATA;

