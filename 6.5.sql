SELECT TOP (1000) [Member_ID]
      ,[Name]
      ,[First_Name]
      ,[Middle_Name]
      ,[Last_Name]
      ,[Job_Title]
      ,[Status]
      ,[Hire_Date]
      ,[Termination_Date]
      ,[Department_Code]
      ,[Department]
      ,[Home_Address]
      ,[Birth_Date]
      ,[Manager]
  FROM [EC_IT143_DA].[dbo].[Family_Data]

--Primary Key

-- A database is like a digital filing cabinet that stores information such as names, transactions, or records. 
--SQL, which stands for Structured Query Language, is the language used to find, add, update, or organize that information. 
--For example, if you wanted to see all purchases made by a specific person, SQL allows you to ask the database and quickly get the answer.
    

 --Member_ID INT PRIMARY KEY

--Foreign key
 
 --Member_ID PRIMARY KEY
  
 --Card_Member FOREIGN KEY REFERENCES Family_Data(Name)
  
   --primary keys support data integrity by ensuring that each record is unique uncorruptable and consistent and restricting invalid data 
  -- through use of null constraints and esures trust through the databases information
   
   
   -- Inner Join
-- Returns only matching records in BOTH tables. Only members who exist in BOTH Family_Data AND FBS_Viza_Costmo.

SELECT
    fd.Name,
    fd.Job_Title,
    vc.Date,
    vc.Description,
    vc.Debit,
    vc.Credit
FROM EC_IT143_DA.dbo.Family_Data fd
INNER JOIN EC_IT143_DA.dbo.FBS_Viza_Costmo vc
    ON fd.Name = vc.Member_Name;

    -- Left Join
-- Returns ALL records from Family_Data, and matching records from FBS_Viza_Costmo. All family members, even if they have no Visa transactions.

SELECT
    fd.Name,
    fd.Job_Title,
    vc.Date,
    vc.Description,
    vc.Debit,
    vc.Credit
FROM EC_IT143_DA.dbo.Family_Data fd
LEFT JOIN EC_IT143_DA.dbo.FBS_Viza_Costmo vc
    ON fd.Name = vc.Member_Name;

    -- Right Join
-- Returns ALL records from FBS_Viza_Costmo., and matching records from FBS_Viza_Costmo. All Visa transactions, even if a member isn’t in Family_Data.

SELECT
    fd.Name,
    fd.Job_Title,
    vc.Date,
    vc.Description
FROM EC_IT143_DA.dbo.Family_Data fd
RIGHT JOIN EC_IT143_DA.dbo.FBS_Viza_Costmo vc
    ON fd.Name = vc.Member_Name;

    --Full JOin
-- Returns ALL records from BOTH tables. All family members AND all Visa transactions.

    SELECT
    fd.Name,
    fd.Job_Title,
    vc.Date,
    vc.Description
FROM EC_IT143_DA.dbo.Family_Data fd
FULL JOIN EC_IT143_DA.dbo.FBS_Viza_Costmo vc
    ON fd.Name = vc.Member_Name;


    -- Self Join
-- A SELF JOIN is when a table is joined to itself. the Family_Data table contains both employees and their managers. 
  
  SELECT
    emp.Name AS Employee_Name,
    emp.Job_Title AS Employee_Job,
    mgr.Name AS Manager_Name,
    mgr.Job_Title AS Manager_Job
FROM EC_IT143_DA.dbo.Family_Data emp
LEFT JOIN EC_IT143_DA.dbo.Family_Data mgr
    ON emp.Manager = mgr.Name;
