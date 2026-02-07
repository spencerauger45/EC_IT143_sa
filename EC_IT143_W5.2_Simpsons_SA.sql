/*****************************************************************************************************************
NAME:    Spencer Auger
PURPOSE: This script is a question and answer for my datasets.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     02/06/2022   Spencer Auger       1. Built this script for EC IT440


RUNTIME: 
1s

NOTES: 
This script is meant to answer the following question:
 
******************************************************************************************************************/

-- Q1: Which teams currently have the highest total payroll and average salary per player for January 2019? We need to compare this with other teams so that we can understand who is being underpaid and overpaid.
-- A1: Let's ask SQL and find out...

WITH TeamTotals AS (
    SELECT
        d.t_id,
        SUM(f.mtd_salary) AS total_team_payroll,
        AVG(f.mtd_salary) AS avg_salary_per_player
    FROM dbo.tblPlayerFact AS f
    JOIN dbo.tblPlayerDim  AS d
        ON f.pl_id = d.pl_id
    WHERE
        f.as_of_date >= '2019-01-01'
        AND f.as_of_date < '2019-02-01'
    GROUP BY
        d.t_id
)
SELECT TOP 1 *
FROM TeamTotals
ORDER BY total_team_payroll DESC;
