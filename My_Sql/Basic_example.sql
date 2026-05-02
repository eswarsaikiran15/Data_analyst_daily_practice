-- it drops if database is already available
DROP DATABASE IF EXISTS college;

-- create the database with some name 
CREATE DATABASE college;

--we use ( USE) this for using that specific database
USE college;

-- DDL command to create student table
CREATE TABLE student(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);


-- we use this to insert values
INSERT INTO student VALUES (1,'kiran',21);
INSERT INTO student VALUES (2,'sai',26);
INSERT INTO student VALUES (3,'eswar',29);


-- Fetch all columns and rows from student table
SELECT * FROM student;
