
-- Q2: How to keep track of when a record was last modified?
-- A2: Maybe use an after update trigger?

--Q3: Did it work"
--A3: Well, lets see...yup

--Remove stuff if it is already there

Delete from dbo.t_hello_world
	where my_message in('Hello World2', 'Hello World3', 'Hello World4');

	-- load test rows
	insert into dbo.t_hello_world(my_message)
	values('Hello World2'), ('Hello World3');

	-- see if the tigger worked
	select t.*
		from dbo.t_hello_world as t;

	-- try it again
	update dbo.t_hello_world SET my_message = 'Hello World4'
	 where my_message = 'Hello World3';

	 -- see if the trigger worked
	 select t.*
		from dbo.t_hello_world as t;