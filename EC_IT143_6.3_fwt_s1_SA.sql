-- How to keep track of when a record was last modified
-- This works for the initial insert...

alter table dbo.t_hello_world
add last_modified_date DATETIME DEFAULT GETDATE();

-- Q2: How to keep track of when a record was last modified?