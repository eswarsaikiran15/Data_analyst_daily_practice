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
