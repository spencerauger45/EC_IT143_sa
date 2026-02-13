-- Q: How to extract first name from contact name?

-- A: Well, here is your problem...
--CustomerName = Alejandra Camino -> Alejandra

select t.ContactName
	From dbo.t_w3_schools_customers as t
 order by 1;
