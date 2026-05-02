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
-- Group rows based on one or more columns, then apply aggregate functions on each group.

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
