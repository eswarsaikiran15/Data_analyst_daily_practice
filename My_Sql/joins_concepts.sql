CREATE DATABASE join_practice;
USE join_practice;

CREATE TABLE student (
    student_id INT,
    name VARCHAR(50)
);

INSERT INTO student VALUES
(101, 'adam'),
(102, 'bob'),
(103, 'casey');

CREATE TABLE course (
    student_id INT,
    course VARCHAR(50)
);

INSERT INTO course VALUES
(102, 'english'),
(105, 'math'),
(103, 'science'),
(107, 'computer science');

/*
Example where alias is REQUIRED
SELECT student_id   -- ❌ ERROR (ambiguous)
FROM student
JOIN course
ON student.student_id = course.student_id;

* SQL doesn’t know which student_id you mean.

Fix using alias:
SELECT s.student_id
FROM student s
JOIN course c
ON s.student_id = c.student_id;
*/
select * from student;
select * from course;
-- inner join  here i have taken student s means we are taking alias (a) to improve readability, avoid ambiguity, and manage multiple table references efficiently
-- alias means alternate name
-- eg1-inner join
select *
from student as s
inner join course as c
on s.student_id=c.student_id;

-- eg2-- main inner join example
SELECT s.student_id, s.name, c.course
FROM student s
INNER JOIN course c
ON s.student_id = c.student_id;

-- left join 

select s.student_id,s.name,c.course
from student s 
left join course c
on s.student_id=c.student_id;

-- right join
select s.student_id,s.name,c.course
from student s
right join course c
on s.student_id=c.student_id;

--- full join
select * 
from student s 
left join course c
on s.student_id=c.student_id
union
select *
from student s
right join course c
on s.student_id=c.student_id;

-- left exclusive join 
select * 
from student s
left join course c
on s.student_id=c.student_id
where c.student_id is null;

-- right exclusive join
select * 
from student s
right join course c
on s.student_id=c.student_id
where s.student_id is null;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee (id, name, manager_id) VALUES
(101, 'adam', 103),
(102, 'bob', 104),
(103, 'casey', NULL),
(104, 'donald', 103);
-- self join acts as inner join here
SELECT e.name,m.name,e.id,m.id
FROM employee e
JOIN employee m
ON e.manager_id = m.id;
-- it is also slef join but here it shows null rows also because we used left join in query
SELECT e.name,m.name,e.id,m.id
FROM employee e
LEFT JOIN employee m
ON e.manager_id = m.id;
