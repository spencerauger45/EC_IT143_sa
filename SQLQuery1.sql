create view [dbo].[34_create_answers]
as
    -------------------------------------------------
    --Name: dbo.34_create_answers
    --Purpose: To answer questions from 3.3

    --Modification Log: 
    --Ver         Date          Author        Description
    ------        --------      ----------

    --------------------------------------------------------------------------
    --1.0         1/23          Spencer Auger 1. Built to answer questions

    --Runtime: 
    --1 Second

    --Notes: 
    --This answers my questions and questions posed by others in the 3.3 assignment

    ---------------------------------------------------------------------------------


    --Marginal Complexity Questions From Alexander Quicay
    --What are the top 5 province or state we have that starts with letter A.

      Select Top 5 Name
      From Person.StateProvince
      Where Name LIKE 'A%'
      ORDER BY Name; 


      --What state or province have the third maximum tax rate.

      Select Max(TaxRate) AS ThirdMaximumTaxRate
      From Sales.SalesTaxRate
      Where TaxRate < (
        select max(TaxRate)
        from Sales.SalesTaxRate
        Where TaxRate < (
            Select max(TaxRate)
            from Sales.SalesTaxRate
            )
    );

    --Moderate Complexity Questions From Seth Elijah Nicdao Avanceña
    --Show the names and sucategories for products that have customer reviews.

    SELECT DISTINCT 
           p.Name AS ProductName,
           ps.Name AS SubcategoryName
    FROM Production.ProductReview pr
    JOIN Production.Product p
         ON pr.ProductID = p.ProductID
    JOIN Production.ProductSubcategory ps
         ON p.ProductSubcategoryID = ps.ProductSubcategoryID;

    --Which salespeople work in which sales territories?

    SELECT 
        e.BusinessEntityID,
        e.JobTitle,
        t.Name AS TerritoryName,
        t.CountryRegionCode
    FROM HumanResources.Employee e
    JOIN Sales.SalesPerson sp
         ON e.BusinessEntityID = sp.BusinessEntityID
    JOIN Sales.SalesTerritory t
         ON sp.TerritoryID = t.TerritoryID
    ORDER BY TerritoryName;

    --Increased complexity Questions From Lorne Bailey and Myself
    ----Adventure Works management wants an estimate of how much gross revenue they have coming in to pay each of their employees, taxes, utilities, other expenses, and invest. 
    --   Can you estimate the economic value each employee contributes to the company's success?

    SELECT
        emp.EmployeeCount,
        rev.TotalRevenue,
        CAST(rev.TotalRevenue / NULLIF(emp.EmployeeCount, 0) AS DECIMAL(18,2)) AS RevenuePerEmployee
    FROM
        (SELECT COUNT(*) AS EmployeeCount
         FROM HumanResources.Employee) emp
    CROSS JOIN
        (SELECT SUM(TotalDue) AS TotalRevenue
         FROM Sales.SalesOrderHeader) rev;

    --From my understanding we have stopped sales in certain sales territories for specific business entitites. I would like to know when those ended, the territory ID, and what location those were. I will need the name of the territory and their sales for the year.

    select
        sth.BusinessEntityID,
        sth.territoryid,
        st.name as territoryname, 
        st.countryregioncode,
        Year(sth.EndDate) As EndYear,
        SUM(soh.totaldue) as territorysalesforyear
    From Sales.salesTerritoryHistory sth
    Join Sales.SalesTerritory st
        On sth.territoryid = st.territoryid
    Join Sales.SalesPerson sp
        ON sth.BusinessEntityID = sp.businessentityid
    Join Sales.SalesOrderHeader soh
        on sp.businessentityid = soh.salespersonid
            and year(soh.orderdate) = Year(sth.enddate)
    where sth.enddate is not null
    group by
        sth.BusinessEntityID,
        sth.territoryid,
        st.name, 
        st. countryregioncode, 
        year(sth.enddate)
    order by endyear, territorysalesforyear desc; 

    --Metadata Adventure work questions as asked by Daniel Asare and Me

    --What columns are in the SalesOrderHeader table?

    select * From Sales.SalesOrderHeader

    select
        COLUMN_NAME
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'Sales'
        AND TABLE_NAME = 'SalesOrderHeader'
    ORDER BY ORDINAL_POSITION;

    --Which tables in the database contain PRIMARY KEY constraints according to INFORMATION_SCHEMA.TABLE_CONSTRAINTS?

    select
        table_schema,
        table_name,
        constraint_name
    from information_schema.TABLE_CONSTRAINTS
    where CONSTRAINT_TYPE = 'PRIMARY KEY'
    ORDER BY TABLE_SCHEMA, table_name;