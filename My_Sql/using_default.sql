create table temp1(
  id int,
  salary int default 25000 -- here we have used deafault so we get salary as 25000
);
insert into temp1(id) values(101);
select * from temp1;


/*
Output
id	salary
101	25000
*/
