-- Q: Who is the first player on the list?

-- A: Let's ask SQL Server and find out...

DROP TABLE IF EXISTS dbo.t_first_player;
GO

SELECT *
INTO dbo.t_first_player
FROM dbo.v_first_player;
GO