use org;









-- Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name "WORKER_NAME".

select first_name as WORKER_Name from worker;





















-- Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.

Select upper(first_name) from worker;




-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.

select distinct(department) from worker;





-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.

select substring(first_name,1,3) from worker;


-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the 
--      first name column ‘Amitabh’ from the Worker table.

SELECT POSITION('a' IN 'Amitabh') AS location;



-- Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after
--     removing white spaces from the right side.

select RTRIM(fIRST_NAME) FROM WORKER;


-- Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after 
--   removing white spaces from the left side.

select LTRIM(fIRST_NAME) FROM WORKER;


-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table
--     and prints its length.

select distinct length(Department) from worker;


-- Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.


select replace(First_name, 'a','A')  from worker;


-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a 
--     single column COMPLETE_NAME. A space char should separate them.

select concat(first_name, " ", last_name) as COMPLETE_NAME from WORKER;



-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select * FROM WORKER
ORDER BY fIRST_NAME asc;


-- Q-12. Write an SQL query to print all Worker details 
--      from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select * FROM WORKER
ORDER BY fIRST_NAME asC, DEPARTMENT DESC;


-- Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”
--        from the Worker table.

select * from worker 
where First_name in ("Vipul", "Satish");


--  Q-14. Write an SQL query to print details of workers excluding first names,
--        “Vipul” and “Satish” from the Worker table.

select * from worker 
where First_name not in ("Vipul", "Satish");


-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

select * from worker
where department like 'admin';


-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select * from worker where first_name like "%a%";




-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from worker where first_name like '%a';


-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’
--    and contains six alphabets.

select * from worker where first_name like '______h';


-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select * from worker where Salary between  100000 and 500000;



-- Q-20. Write an SQL query to print details of the Workers who joined in Feb 2021.

Select * from worker where year(joining_date) = 2021 and month(Joining_date) = 2;



-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

Select count(*) from worker where department = "Admin";


-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

Select concat(first_name, " ", last_name) as Worker_Name, Salary 
from worker where Salary between 50000 and 100000;


Select concat(first_name, " ", last_name) as Worker_Name from worker where Salary between 50000 and 100000;


-- select  department, count(worker_id) from worker group by department order by worker_id DESC;
-- Q-23. Write an SQL query to fetch the number of workers for each department in descending order.

SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;

-- Select * from worker;
-- select * from Title;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID;
-- Select WORKER_Title, COUNT(*) FROM Title 
-- group by worker_title
-- having count(*) >1;


--  Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;


--  Q-26. Write an SQL query to show only odd rows from a table.

Select * from worker where mod(Worker_id,2)<> 0;


--  Q-27. Write an SQL query to show only even rows from a table.

Select * from worker where mod(Worker_id,2) = 0;


-- Q-28. Write an SQL query to clone a new table from another table.

Create table Workclone like worker;

select * from workclone;


-- Q-29. Write an SQL query to fetch intersecting records of two tables.

(Select * from Worker)
INTERSECT
(Select * from workclone);

(SELECT * FROM Worker) ''INTERSECT''
(SELECT * FROM WorkerClone);


--  Q-30. Write an SQL query to show records from one table that another table does not have.


SELECT * FROM Worker
UNION
SELECT * FROM Title;

-- . Write an SQL query to show the current date and time.

SELECT curdate();

-- Whereas the following MySQL query returns the current date and time:

Select now();


-- . Write an SQL query to show the top n (say 10) records of a table.

Select * from worker 
order by salary Desc limit 10;


-- Write an SQL query to determine the nth (say n=5) highest salary from a table.

select Salary FROM Worker ORDER BY Salary DESC LIMIT 4,1;



Select first_name, max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);

