-- to update existing rows
update student
set grade="0"
where grade="A";

-- it gives error like -17:12:52	update student set grade="0" where grade="A"	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.016 sec
-- in this condition we want to set sql_safe_updates=0

set sql_safe_updates=0;
update student
set grade="0"
where grade="A";

/* output:
101	anil	78	C	Pune
102	bhumika	93	0	Mumbai
103	chetan	85	B	Mumbai
104	dhruv	96	0	Delhi
105	emanuel	12	F	Delhi
106	farah	82	B	Delhi
				*/

-- to update existing rows
set sql_safe_updates=0;
update student
set marks="85"
where marks="12";



select * from student;

/*
101	anil	78	C	Pune
102	bhumika	93	0	Mumbai
103	chetan	85	B	Mumbai
104	dhruv	96	0	Delhi
105	emanuel	85	F	Delhi
106	farah	82	B	Delhi
				
*/
