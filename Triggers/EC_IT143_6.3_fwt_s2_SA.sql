-- How to keep track of when a record was last modified
-- This works for the initial insert...

alter table dbo.t_hello_world
add last_modified_date DATETIME DEFAULT GETDATE();

-- Q2: How to keep track of when a record was last modified?
-- A2: Maybe use an after update trigger?
--https://stackoverflow.com/questions/9522982/t-sql-trigger-update
-- https://stackoverflow.com/questions/4574010/how-to-create-trigger-to-keep-track-of-last-changed-data