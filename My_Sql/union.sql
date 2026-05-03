
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
-- union
select name from employee
union
select name from employee;


--union all
select name from employee
union all 
-- allow duplicates 
select name from employee;

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
