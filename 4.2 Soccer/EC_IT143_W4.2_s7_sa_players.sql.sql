CREATE PROCEDURE dbo.usp_first_player_load
AS



/*******************************************************************************************
Name: dbo.usp_first_player_load
Purpose: Load the first-player table from the view

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

    TRUNCATE TABLE dbo.t_first_player;

    INSERT INTO dbo.t_first_player
    (
        pl_id,
        pl_name
    )
    SELECT
        v.pl_id,
        v.pl_name
    FROM dbo.v_first_player AS v;


    -- 2) Review Results

    SELECT t.*
    FROM dbo.t_first_player AS t;

END;
GO
