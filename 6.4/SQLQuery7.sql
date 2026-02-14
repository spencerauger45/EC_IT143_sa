select pa.*
   from Person.Address As pa
 where pa.city = 'Bothell';

USE [AdventureWorks2022]
GO
CREATE NONCLUSTERED INDEX IX_Address_City
ON Person.Address (City);

GO


select name
from sys.indexes
where object_id = object_id('dbo.P')
and type_desc = 'NONCLUSTERED';

drop index IX_Address_City on Person.Address;