create database college;
use college;
/*
In a foreign key (FK) relationship:

Parent table → main data (dept)
Child table → dependent data (teacher)

CASCADE tells the database:

“If the parent changes, automatically apply the same change to child rows.”
*/
-- parent table
create table dept (
id int primary key,
name varchar(50)
);

insert into dept
values
(101,"english"),(102,"hindi");

select * from dept;

update dept
set id=111
where id=101;

-- child table - in this we have foreign key
create table teacher(
id int primary key,
name varchar(50),
dept_id int,
foreign key(dept_id) references dept(id)
on update cascade
on delete cascade

);

insert into teacher
values
(101,"adam",101),(102,"sai",102);

select * from teacher;
