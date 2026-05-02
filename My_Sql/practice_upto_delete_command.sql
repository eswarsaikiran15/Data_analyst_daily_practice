CREATE DATABASE KIRAN;
USE KIRAN;

-- Create table
CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

-- Insert multiple records
INSERT INTO student (rollno, name, marks, grade, city)
VALUES
(101, 'anil', 78, 'C', 'Pune'),
(102, 'bhumika', 93, 'A', 'Mumbai'),
(103, 'chetan', 85, 'B', 'Mumbai'),
(104, 'dhruv', 96, 'A', 'Delhi'),
(105, 'emanuel', 12, 'F', 'Delhi'),
(106, 'farah', 82, 'B', 'Delhi');

-- View data
SELECT * FROM student;

-- VIEW UNIQUE DATA
SELECT DISTINCT CITY FROM STUDENT;

-- VIEW DATA MARKS WHICH ARE GREATER THAN 80
SELECT *FROM STUDENT WHERE city="Mumbai";
-- comparision 
-- and(to check for both conditions to be true)
SELECT *FROM STUDENT WHERE marks>80 and city="Mumbai";

-- or(to check for one of the conditions to be true)
SELECT *FROM STUDENT WHERE marks>80 or city="Mumbai";
-- arthematic operator using
SELECT *FROM STUDENT WHERE marks+10>100 ;

select * from student where marks=93;

-- between (selects for a given range)
select * from student where marks between 80 and 90;

-- in (matches any value in the list
select * from student where city in("Delhi","Mumbai");

-- to negate the given condition
select * from stduent where city not in ("Delhi","Mumbai");

-- limit clause( set an  upper limit  on number of (tuple) rows to be returned
select * from student limit 3; 

-- order by clause to sort in asc or desc order
select * from student 
order by city asc;
-- order by clause to sort in asc or desc order
select * from student 
order by city desc;

-- order by clause to sort in asc or desc order
select * from student 
order by marks asc
;

select * from student 
order by marks desc
limit 3 
;

-- aggregate functions

select avg(marks) from student;
select min(marks) from student;
select max(marks) from student;
select count(rollno) from student;

-- ============================================
-- GROUP BY CLAUSE
-- ============================================

-- The GROUP BY clause is used to group rows 
-- that have the same values into summary rows.

-- It collects data from multiple records 
-- and groups the result based on one or more columns.

-- Generally, GROUP BY is used with 
-- aggregate functions like:
-- COUNT(), SUM(), AVG(), MIN(), MAX()

-- ============================================
-- EXAMPLE:
-- Count number of students in each city
-- ============================================

SELECT city, COUNT(rollno)
FROM student
GROUP BY city;

SELECT city,name,COUNT(rollno)
FROM student
GROUP BY city,name;

SELECT city, avg(marks)
FROM student
GROUP BY city;

SELECT city, avg(marks)
FROM student
GROUP BY city
order by avg(marks)
;

SELECT city, avg(marks)
FROM student
GROUP BY city
order by avg(marks) desc
;
-- ============================================
-- EXPLANATION:
-- ============================================

-- Step 1: Data is grouped by 'city'
-- Step 2: COUNT(name) counts number of students in each city
-- Step 3: Output shows one row per city

-- ============================================
-- IMPORTANT NOTES:
-- ============================================

-- 1. Every column in SELECT must be:
--    - Either in GROUP BY
--    - Or used with an aggregate function

-- 2. GROUP BY is used after WHERE clause (if present)

-- 3. GROUP BY returns one row per group

-- 4. COUNT(column) ignores NULL values

-- ============================================
-- COMMON MISTAKE:
-- ============================================

-- ❌ WRONG:
-- SELECT city, name FROM student GROUP BY city;

-- ✔ CORRECT:
-- SELECT city, COUNT(name) FROM student GROUP BY city;



SELECT COUNT(name), city
FROM student
GROUP BY city
HAVING MAX(marks) > 90;

SELECT city, AVG(marks)
FROM student
WHERE marks > 50
GROUP BY city
HAVING AVG(marks) > 60
ORDER BY city ASC;

-- to update existing rows
update student
set grade="0"
where grade="A";
-- to update existing rows
set sql_safe_updates=0;
update student
set marks="85"
where marks="12";



select * from student;


-- delete( to delete existing rows)
delete from student
where marks<80;
select * from student;
