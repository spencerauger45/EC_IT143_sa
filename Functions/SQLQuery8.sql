-- Q: How to extract first name from contact name?

-- A: Well, here is your problem...
--CustomerName = Alejandra Camino -> Alejandra
-- Google search "How to extract first name from combined name tsql stack overflow"
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name

select t.CustomerID
	 , t.CustomerName
	 , t.ContactName
	 , dbo.udf_parse_first_name(t.ContactName) as ContactName_first_name
	 , '' as ContactName_last_name -- how to extract last name from Contact Name
	 , t.Address
	 , t.City
	 , t.Country
	from dbo.t_w3_schools_customers as t
	order by 3;
