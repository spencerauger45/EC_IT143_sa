-- Q: What is the current date and time?

-- A: Let's ask SQL Server and find out...

-- 1) Reload Data

truncate table dbo.t_hello_world;

insert into dbo.t_hello_world
		select v.my_message
			,  v.current_date_time
		  from dbo.v_hello_world_load as v;

-- 2) Review Results

select t.*
	from dbo.t_hello_world as t;