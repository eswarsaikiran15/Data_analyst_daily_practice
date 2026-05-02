create database college;
use college;

-- parent table
create table dept (
id int primary key,
name varchar(50)
);

-- child table - in this we have foreign key
create table teacher(
id int primary key,
name varchar(50),
dept_id int,
foreign key(dept_id) references dept(id)

);
