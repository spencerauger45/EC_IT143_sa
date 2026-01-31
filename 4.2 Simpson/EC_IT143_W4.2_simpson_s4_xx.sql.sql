drop view if exists dbo.simpson_load;
go

create view dbo.v_simpson_load
as


/*******************************************************************************************
Name: dbo.v_simpson_load
Purpose: Create the job title view for Homer

Modification Log:

Ver      Date          Author           Description
------   ------        ---------        ------------------
1.0		 01/29/2026    Spencer Auger    1. Built for 4.2 Assignment

Runtime:
1s

Notes: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
*******************************************************************************************/

-- Q: What is Homer's Job Title?

-- A: Let's ask SQL Server and find out...

SELECT job_title as title
FROM dbo.Family_Data
WHERE first_name = 'Homer'
	AND last_name = 'Simpson';