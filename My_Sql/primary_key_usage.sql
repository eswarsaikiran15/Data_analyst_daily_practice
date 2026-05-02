CREATE TABLE TEMP1(
    ID INT ,
    NAME VARCHAR(50),
    CITY VARCHAR(50),
    PRIMARY KEY(ID)

);
/*
Two ways to define primary key
1. Column-level
ID INT PRIMARY KEY
2. Table-level (what you used)
PRIMARY KEY(ID)
*/

CREATE TABLE TEMP1(
    ID INT ,
    NAME VARCHAR(50),
    CITY VARCHAR(50),
    PRIMARY KEY(ID,NAME)

);
