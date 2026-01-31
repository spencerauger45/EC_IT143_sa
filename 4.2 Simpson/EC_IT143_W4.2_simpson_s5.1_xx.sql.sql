-- Q: What is Homer's Job Title?

-- A: Let's ask SQL Server and find out...


SELECT *
INTO dbo.t_simpson_job_title
FROM dbo.v_simpson_load;
GO

