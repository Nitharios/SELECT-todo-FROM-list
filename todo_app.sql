-- Sanity Check!

-- drops db if it exists
DROP DATABASE IF EXISTS todo_app;
-- -- delete a user if it exists
DROP USER IF EXISTS michael;
-- -- create a user named michael
CREATE USER michael 
WITH ENCRYPTED PASSWORD 'stonebreaker';
-- -- create a database
CREATE DATABASE todo_app;
-- -- connect to todo_app
\c todo_app;
-- create a table named tasks
CREATE TABLE tasks (
  id            SERIAL              NOT NULL   PRIMARY KEY,   
  title         varchar(255)        NOT NULL,
  description   text,
  created_at    timestamp           NOT NULL   DEFAULT now(),
  updated_at     timestamp,
  completed     boolean             NOT NULL   DEFAULT false
);
-- remove column completed
-- add column completed_at timestamp null default now()
-- change updated_at to not allow null and to have default of null()
ALTER TABLE tasks
  DROP COLUMN completed,
  ADD COLUMN completed_at timestamp NULL DEFAULT NULL,
  ALTER COLUMN updated_at SET NOT NULL,
  ALTER COLUMN updated_at SET DEFAULT now();
-- create a new task, by only setting values (not defining which columns)
  -- `id = default value`  
  -- `title = 'Study SQL'`  
  -- `description = 'Complete this exercise'`  
  -- `created_at = now()`  
  -- `updated_at = now()`  
  -- `completed_at = NULL`
INSERT INTO tasks 
  VALUES(default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
-- create a new task  
  -- `title = 'Study PostgreSQL'`  
  -- `description = 'Read all the documentation'`
INSERT INTO tasks 
  VALUES(default, 'Study PostgreSQL', 'Read all the documentation');
 -- select all the titles of tasks that are not yet completed
SELECT title
  FROM tasks
  WHERE completed_at IS NULL;
 -- update the task with a title of `'Study SQL'` to be completed as of now
 UPDATE tasks
  SET completed_at = now()
  WHERE title = 'Study SQL';
 -- select all titles and descriptions of tasks that are not yet completed
 
 -- select all fields of every task sorted by creation date in descending order
 
 -- create a new task  
 --  `title = 'mistake 1'`  
 --  `description = 'a test entry'`  
 
 -- create a new task  
 --  `title = 'mistake 2'`  
 --  `description = 'another test entry'`  
 
 -- create a new task  
 --  `title = 'third mistake'`  
 --  `description = 'another test entry'`  
 
 -- select title fields of all tasks with a title that includes the word `'mistake'`
 
 -- delete the task that has a title of `mistake 1`
 
 -- select title and description fields of all tasks with a title that includes the word `'mistake'`
 
 -- delete all tasks that includes the word `'mistake'` in the title
 
 -- select all fields of all tasks sorted by `title` in ascending order

