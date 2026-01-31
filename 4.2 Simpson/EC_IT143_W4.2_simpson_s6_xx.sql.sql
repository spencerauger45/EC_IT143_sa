

-- Q: What is Homer's Job Title?

-- A: Let's ask SQL Server and find out...

-- 1) Reload Data



TRUNCATE TABLE dbo.t_simpson_job_title;
GO

INSERT INTO dbo.t_simpson_job_title (title)
SELECT title
FROM dbo.v_simpson_load;
GO

-- 2) Review Results

select t.*
	from dbo.t_simpson_job_title as t;