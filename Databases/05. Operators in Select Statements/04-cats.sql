-- 4. Given this cats table, what records are returned from these queries?

-- STEPS TO CREATE DATABASE, RUN FILES ON IT, AND MOVE INTO DATABASE
-- 0. Create database: createdb -U postgres -w cats
-- 1. psql -f ./04-cats.sql cats postgres
-- 2. psql cats postgres

/*
CREATE TABLE cats(
  "id"            INTEGER,
  "name"          VARCHAR(16),
  "gender"        VARCHAR(1),
  "age"           INTEGER,
  "intake_date"   DATE,
  "adoption_date" DATE
);
*/

/*  
INSERT INTO cats
    ("id", "name",   "gender", "age", "intake_date", "adoption_date")
VALUES
    ( 1, 'Mushi',    'M',       1,    '2016-01-09',  '2016-03-22'),
    ( 2, 'Seashell', 'F',       7,    '2016-01-09',   NULL),
    ( 3, 'Azul',     'M',       3,    '2016-01-11',  '2016-04-17'),
    ( 4, 'Victoire', 'M',       7,    '2016-01-11',  '2016-09-01'),
    ( 5, 'Nala',     'F',       1,    '2016-01-12',   NULL);
*/

SELECT name, adoption_date FROM cats;

-- Mushi, 2016-03-22
-- Seashell, null
-- Azul, 2016-04-17
-- Victoire, 2016-09-01
-- Nala, null

SELECT name, age FROM cats;

-- Mushi, 1
-- Seashell, 7
-- Azul, 3
-- Victoire, 7
-- Nala, 1


-- 5. From the cats table, write queries to select the following pieces of data.

-- Display all the information about all of the available cats.
SELECT * FROM cats;

-- Display the name and sex of all cats who are 7 years old.
SELECT name, gender FROM cats WHERE age=7;

-- Find all of the names of the cats, so you don’t choose duplicate names for new cats.
SELECT name FROM cats;