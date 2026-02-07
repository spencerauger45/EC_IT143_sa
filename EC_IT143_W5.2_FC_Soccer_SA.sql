/*****************************************************************************************************************
NAME:    Spencer Auger
PURPOSE: This script is a question and answer for my Simpson dataset.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     02/06/2022   Spencer Auger       1. Built this script for EC IT440


RUNTIME: 
1s

NOTES: 
This script is meant to answer the following question:
 
******************************************************************************************************************/

-- Q1: (From Myself) Combine dbo.FBS_Viza_Costmo with dbo.Family_Data to see if transaction activity differs by employee status (active vs terminated) or by job title?
-- A2: Let's ask SQL and find out...



SELECT
    fv.Status,
    fd.Job_Title,
    COUNT(*)                    AS transaction_count,
    SUM(ISNULL(fv.Debit,0))     AS total_spending,
    AVG(ISNULL(fv.Debit,0))     AS avg_transaction_amount
FROM dbo.FBS_Viza_Costmo fv
JOIN dbo.Family_Data fd
    ON fv.Member_Name = fd.Name
WHERE
    ISNULL(fv.Debit,0) > 0 
GROUP BY
    fv.Status,
    fd.Job_Title
ORDER BY
    total_spending DESC,
    avg_transaction_amount DESC;

-- Q2: (From Myself) how do Homer and Marge differ in spending habits over time? I would use Amount_Float, Category, Date, Card Member, and Job Title to compare financial behavior and lifestyle patterns.
-- A2: Let's ask SQL and find out...


SELECT
    pe.Card_Member,
    fd.Job_Title,
    YEAR(pe.[Date])  AS txn_year,
    MONTH(pe.[Date]) AS txn_month,
    pe.Category,
    SUM(pe.Amount)   AS total_spend,
    AVG(pe.Amount)   AS avg_txn_amount,
    COUNT(*)         AS txn_count
FROM dbo.Planet_Express pe
JOIN dbo.Family_Data fd
    ON pe.Card_Member = fd.Name
WHERE
    pe.Card_Member IN ('Homer Simpson','Marge Simpson')
GROUP BY
    pe.Card_Member,
    fd.Job_Title,
    YEAR(pe.[Date]),
    MONTH(pe.[Date]),
    pe.Category
ORDER BY
    pe.Card_Member,
    txn_year,
    txn_month,
    total_spend DESC;


-- Q3: (From Myself) Are there merchants or transaction descriptions that consistently produce unusually high charges for specific household members? We need to understand if any of the charges on the account are fraudulent so we can protect the families financial assets.
-- A3: Let's ask SQL and find out...

WITH AllCharges AS (


    SELECT
        pe.Card_Member AS member_name,
        pe.Description AS merchant,
        pe.Amount      AS charge_amount,
        pe.[Date]
    FROM dbo.Planet_Express pe
    WHERE pe.Amount > 0

    UNION ALL

    SELECT
        fv.Member_Name,
        fv.Description,
        ISNULL(fv.Debit,0) AS charge_amount,
        fv.[Date]
    FROM dbo.FBS_Viza_Costmo fv
    WHERE ISNULL(fv.Debit,0) > 0
),

MerchantStats AS (
    SELECT
        member_name,
        merchant,
        COUNT(*)                  AS txn_count,
        AVG(charge_amount)       AS avg_charge,
        MAX(charge_amount)       AS max_charge
    FROM AllCharges
    GROUP BY
        member_name,
        merchant
)

SELECT
    member_name,
    merchant,
    txn_count,
    avg_charge,
    max_charge
FROM MerchantStats
WHERE
      txn_count >= 3                   
  AND max_charge > avg_charge * 2        
ORDER BY
    max_charge DESC;


-- Q4: (From Alexander Richards) Which Planet Express account withdrew the most money in a given year, and in which month did these expenses peak? I will need the name, total amount withdrawn that year, and month.
-- A4: Let's ask SQL and find out... this is a long one

WITH YearTotals AS (
    SELECT
        Card_Member,
        SUM(Amount) AS total_yearly_withdrawn
    FROM dbo.Planet_Express
    WHERE YEAR([Date]) = 1989
      AND Amount > 0   
    GROUP BY
        Card_Member
),

RankedYear AS (
    SELECT *,
           RANK() OVER (
             ORDER BY total_yearly_withdrawn DESC
           ) AS year_rank
    FROM YearTotals
),

MonthlyTotals AS (
    SELECT
        Card_Member,
        MONTH([Date]) AS txn_month,
        SUM(Amount) AS total_monthly_withdrawn
    FROM dbo.Planet_Express
    WHERE YEAR([Date]) = 1989
      AND Amount > 0
    GROUP BY
        Card_Member,
        MONTH([Date])
),

PeakMonth AS (
    SELECT *,
           RANK() OVER (
             PARTITION BY Card_Member
             ORDER BY total_monthly_withdrawn DESC
           ) AS month_rank
    FROM MonthlyTotals
)

SELECT
    ry.Card_Member,
    ry.total_yearly_withdrawn,
    DATENAME(month, DATEFROMPARTS(1989, pm.txn_month, 1)) AS peak_month,
    pm.total_monthly_withdrawn AS peak_month_amount
FROM RankedYear ry
JOIN PeakMonth pm
  ON ry.Card_Member = pm.Card_Member
 AND pm.month_rank = 1
WHERE ry.year_rank = 1;
