-- Given this dogs table, write queries to select the following pieces of data:
-- Intake teams typically guess the breed of shelter dogs, so the breed column may have multiple words (for example, "Labrador Collie mix").

-- STEPS TO CREATE DATABASE, RUN FILES ON IT, AND MOVE INTO DATABASE
-- 0. Create database: createdb -U postgres -w dogs
-- 1. psql -f ./03-dogs.sql dogs postgres
-- 2. psql dogs postgres


CREATE TABLE dogs (
  "id"          INTEGER, 
  "name"        VARCHAR(25),
  "gender"      VARCHAR(1),
  "age"         INTEGER,
  "weight"      INTEGER,
  "breed"       TEXT,
  "intake_date" DATE,
  "in_foster"   DATE
);

INSERT INTO dogs
  ("id",  "name",      "gender", "age", "weight", "breed",              "intake_date", "in_foster")
VALUES
  (10001, 'Boujee',    'F',       3,     36,      'labrador poodle',    '2017-06-22',   null),
  (10002, 'Munchkin',  'F',       0,     8,       'dachsund chihuahua', '2017-01-13',  '2017-01-31'),
  (10004, 'Marley',    'M',       0,     10,      'labrador',           '2017-05-04',  '2016-06-20'),
  (10003, 'Lassie',    'F',       7,     17,      'collie shepherd',    '2016-07-05',  '2017-07-22'),
  (10006, 'Marmaduke', 'M',       7,     150,     'great dane',         '2016-03-22',  '2016-05-15'),
  (10007, 'Rosco',     'M',       5,     180,     'rottweiler',         '2017-04-01',   null);


-- Display the name, gender, and age of all dogs that are part Labrador.
SELECT name, gender, age FROM dogs WHERE breed LIKE '%labrador%';

-- Display the ids of all dogs that are under 1 year old.
SELECT id FROM dogs WHERE age < 1;

-- Display the name and age of all dogs that are female and over 35lbs.
SELECT name, age FROM dogs WHERE gender='F' AND weight > 35;

-- Display all of the information about all dogs that are not Shepherd mixes.
SELECT * FROM dogs WHERE breed NOT LIKE '%shepherd%';

-- Display the id, age, weight, and breed of all dogs that are either over 60lbs or Great Danes.
SELECT id, age, weight, breed FROM dogs WHERE weight > 60 OR breed LIKE '%great dane%';
