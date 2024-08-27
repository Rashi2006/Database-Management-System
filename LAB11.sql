
--Part – A: 
--1. Combine information from student and result table using cross join or Cartesian product.
SELECT * FROM STU_INFO CROSS JOIN RESULT;
--2. Perform inner join on Student and Result tables. 
SELECT * FROM STU_INFO INNER JOIN RESULT ON STU_INFO.RNO = RESULT.RNO;
--3. Perform the left outer join on Student and Result tables. 
SELECT * FROM STU_INFO LEFT JOIN RESULT ON STU_INFO.RNO = RESULT.RNO;
--4. Perform the right outer join on Student and Result tables. 
SELECT * FROM STU_INFO RIGHT JOIN RESULT ON STU_INFO.RNO = RESULT.RNO;
--5. Perform the full outer join on Student and Result tables.
SELECT * FROM STU_INFO FULL OUTER JOIN RESULT ON STU_INFO.RNO = RESULT.RNO;
--6. Display Rno, Name, Branch and SPI of all students. 
SELECT STU_INFO.RNO ,STU_INFO.NAME, STU_INFO.BRANCH , RESULT.SPI FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO;
--7. Display Rno, Name, Branch and SPI of CE branch’s student only. 
SELECT STU_INFO.RNO ,STU_INFO.NAME, STU_INFO.BRANCH , RESULT.SPI FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO WHERE STU_INFO.BRANCH='CE';
--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only. 
SELECT STU_INFO.RNO ,STU_INFO.NAME, STU_INFO.BRANCH , RESULT.SPI FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO WHERE STU_INFO.BRANCH<>'EC';
--9. Display average result of each branch. 
SELECT AVG(RESULT.SPI),STU_INFO.BRANCH FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO GROUP BY STU_INFO.BRANCH;
--10. Display average result of CE and ME branch.
SELECT AVG(RESULT.SPI) FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO WHERE BRANCH='CE' OR BRANCH='ME';
--Part – B: 
--1. Display average result of each branch and sort them in ascending order by SPI. 
SELECT AVG(RESULT.SPI) , STU_INFO.BRANCH FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO GROUP BY STU_INFO.BRANCH ORDER BY AVG(RESULT.SPI);
--2. Display highest SPI from each branch and sort them in descending order. 
SELECT MAX(RESULT.SPI) , STU_INFO.BRANCH FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO GROUP BY STU_INFO.BRANCH ORDER BY MAX(RESULT.SPI) DESC;
--Part – C: 
--1. Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT MN.NAME , EN.NAME FROM EMPLOYEE_MASTER AS EN JOIN EMPLOYEE_MASTER AS MN ON EN.EMPLOYEENO = MN.MANAGERNO;

 