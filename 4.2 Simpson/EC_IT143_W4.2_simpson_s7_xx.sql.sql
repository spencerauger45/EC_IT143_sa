CREATE PROCEDURE dbo.usp_simpson_job_title_load
AS



/*******************************************************************************************
Name: dbo.usp_simpson_job_title_load
Purpose: Load the Simpson job title table from the view

Modification Log:

Ver      Date          Author           Description
------   ----------    --------------   ------------------
1.0      01/29/2026    Spencer Auger     Built for 4.2 Assignment

Runtime:
1s

Notes:
This script exists to help me learn step 7 of 8 in the Answer Focused Approach
for T-SQL Data Manipulation
*******************************************************************************************/

BEGIN

    -- 1) Reload data

    TRUNCATE TABLE dbo.t_simpson_job_title;

    INSERT INTO dbo.t_simpson_job_title
    (
        title
    )
    SELECT
        v.title
    FROM dbo.v_simpson_load AS v;


    -- 2) Review Results

    SELECT t.*
    FROM dbo.t_simpson_job_title AS t;

END;
GO
