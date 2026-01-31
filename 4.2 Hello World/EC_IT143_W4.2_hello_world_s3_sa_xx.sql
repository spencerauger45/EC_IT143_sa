-- Q: What is the current date and time?

-- A: Let's ask SQL Server and find out...

select 'Hello World' As my_message
	, GETDATE() as current_date_time;