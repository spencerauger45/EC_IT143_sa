create procedure dbo.usp_hello_world_load
as



/*******************************************************************************************
Name: dbo.v_hellow_world_load
Purpose: Create the hello world - load view

Modification Log:

Ver      Date          Author           Description
------   ------        ---------        ------------------
1.0		 01/29/2026    Spencer Auger    1. Built for 4.2 Assignment

Runtime:
1s

Notes: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
*******************************************************************************************/

	begin

		-- 1)Reload data

		truncate table dbo.t_hello_world
		
		insert into dbo.t_hello_world
		select v.my_message
			,  v.current_date_time
		  from dbo.v_hello_world_load as v;


		-- 2)Review Results

		select t.*
			from dbo.t_hello_world as t;

	end;
go