-- Q: Who is the first player on the list?

-- A: Let's ask SQL Server and find out...


SELECT TOP (1)
       pl_id,
       pl_name
FROM dbo.tblPlayerDim
ORDER BY pl_id ASC;
