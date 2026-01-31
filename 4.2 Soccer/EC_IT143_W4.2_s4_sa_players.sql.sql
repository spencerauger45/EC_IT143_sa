DROP VIEW IF EXISTS dbo.v_first_player;
GO

CREATE VIEW dbo.v_first_player
AS


/*******************************************************************************************
Name: dbo.v_first_player
Purpose: Create a view that returns the first player in the list

Modification Log:

Ver      Date          Author           Description
------   ----------    --------------   ------------------
1.0      01/29/2026    Spencer Auger     Built for 4.2 Assignment

Runtime:
1s

Notes:
This script exists to help me learn step 4 of 8 in the Answer Focused Approach
for T-SQL Data Manipulation
*******************************************************************************************/
-- Q: Who is the first player on the list?

-- A: Let's ask SQL Server and find out...

SELECT TOP (1)
       pl_id,
       pl_name
FROM dbo.tblPlayerDim
ORDER BY pl_id ASC;
GO
