drop view if exists dbo.hello_world_load;
go

create view dbo.v_hello_world_load
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

-- Q: What is the current date and time?

-- A: Let's ask SQL Server and find out...

select 'Hello World' As my_message
	, GETDATE() as current_date_time;

