-- Q: How to extract first name from contact name?

-- A: Well, here is your problem...
--CustomerName = Alejandra Camino -> Alejandra
-- Google search "How to extract first name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

with s1 -- use a Common Table expression and compare first_name to first_name2

	as (select t.ContactName
			, Left(t.ContactName, Charindex(' ', t.ContactName+ ' ' ) - 1) as first_name
			,dbo.udf_parse_first_name(t.ContactName) As first_name2
		  from dbo.t_w3_schools_customers as t)
	  select s1.*
		from s1
	 where s1.first_name<> s1.first_name2; -- expect result is 0 rows
	
