create trigger trg_hello_world_last_mod on  dbo.t_hello_world
after update
as

/*****************************************************************************************************************
NAME:    [db0].trg_hello_world_last_mod
PURPOSE: Hello World - Last modified by trigger

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     02/13/2026   Spencer Auger  1. Built this script for EC IT440


RUNTIME: 
1s

NOTES: 
Keep track of the last modified date for each new row in the table
******************************************************************************************************************/

	update dbo.t_hello_world
		   set
			   last_modified_date = GETDATE()
		where my_message IN
		(
			select distinct
				my_message
			  from Inserted
	);
