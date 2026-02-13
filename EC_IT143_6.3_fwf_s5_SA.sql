create function [dbo].[udf_parse_first_name]
(@v_combined_name as varchar (500)
)
returns varchar(100)

/*****************************************************************************************************************
NAME:    [db0].udf_parse_first_name]
PURPOSE: Parse First Name from combined name

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     02/13/2026   Spencer Auger  1. Built this script for EC IT440


RUNTIME: 
1s

NOTES: 
Adapted from the following...
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name
 
******************************************************************************************************************/

	begin
		declare @v_first_name as varchar(100)

		set @v_first_name = left(@v_combined_name, charindex(' ', @v_combined_name + ' ' ) - 1);

		return @v_first_name;

	end;
go
