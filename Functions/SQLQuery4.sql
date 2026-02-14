-- Q: How to extract first name from contact name?

-- A: Well, here is your problem...
--CustomerName = Alejandra Camino -> Alejandra
-- Google search "How to extract first name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

select t.ContactName
	, Left(t.ContactName, Charindex(' ', t.ContactName + ' ' ) - 1) as first_name
	from dbo.t_w3_schools_customers as t
  order by 1;