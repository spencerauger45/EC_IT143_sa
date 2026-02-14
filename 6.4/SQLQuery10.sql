SELECT TOP (1000) [Date]
      ,[Description]
      ,[Card_Member]
      ,[Account]
      ,[Amount]
      ,[Category]
  FROM [EC_IT143_DA].[dbo].[Planet_Express]

select pe.*
from dbo.Planet_Express as pe
where pe.Description = 'SOME OF THAT JAZZ';

CREATE NONCLUSTERED INDEX IX_Planet_Express_Description
ON dbo.Planet_Express (Description);
