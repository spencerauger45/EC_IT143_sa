-- Q: What is the current date and time?

-- A: Let's ask SQL Server and find out...

-- 1) Reload Data

TRUNCATE TABLE dbo.t_first_player;
GO

INSERT INTO dbo.t_first_player
(
    pl_id,
    pl_name
)
-- 2) Review Results
SELECT
    pl_id,
    pl_name
FROM dbo.v_first_player;
GO

