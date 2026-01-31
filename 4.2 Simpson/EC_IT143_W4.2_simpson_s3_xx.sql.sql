-- Q: What is Homer's Job Title?

-- A: Let's ask SQL Server and find out...

SELECT job_title as title
	FROM dbo.Family_Data
	WHERE first_name = 'Homer'
	  AND last_name = 'Simpson';
