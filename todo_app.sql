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
  update_at     timestamp,
  completed     boolean             NOT NULL   DEFAULT false
);
-- remove column completed
-- add column completed_at timestamp null default now()
-- change updated_at to not allow null and to have default of null()
ALTER TABLE tasks
  DROP COLUMN completed,
  ADD COLUMN completed_at timestamp NULL DEFAULT NULL,
  ALTER COLUMN update_at SET NOT NULL,
  ALTER COLUMN update_at SET DEFAULT now();

-- create a new task
