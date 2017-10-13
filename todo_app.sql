-- Sanity Check!

-- drops db if it exists
-- DROP DATABASE IF EXISTS todo_app;
-- -- delete a user if it exists
-- DROP USER IF EXITS michael;
-- -- create a user named michael
-- CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
-- -- create a database
-- CREATE DATABASE todo_app;
-- -- connect to todo_app
-- -- in psql: \c [database name]
-- create a table named tasks
CREATE TABLE tasks (
  id            SERIAL PRIMARY KEY  NOT NULL,   
  title         varchar(255)        NOT NULL,
  description   text,
  created_at    timestamp           NOT NULL   DEFAULT now(),
  update_at     timestamp,
  completed     boolean             NOT NULL   DEFAULT false
);