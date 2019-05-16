-- STEPS TO CREATE DATABASE, RUN FILES ON IT, AND MOVE INTO DATABASE
-- 0. Create database: createdb -U postgres -w spacecrafts
-- 1. psql -f ./06-spacecrafts.sql library postgres
-- 2. psql spacecrafts postgres

CREATE TABLE spacecrafts (
	id integer,
	name text,
	year_launched integer,
	origin_country text,
	description text,
	orbiting_body text,
	currently_operating boolean,
	miles_from_Earth integer
);

-- Add three non-Earth-orbiting satellites to the table.

INSERT INTO spacecrafts (id, name, year_launched, origin_country, description, orbiting_body, currently_operating, miles_from_Earth)
VALUES 
(1, 'MAVEN', 2013, 'United States', 'Find how Mars lost its water and atmosphere', 'Mars', false, 250000000),
(2, 'THEMIS', 2007, 'United States', 'Study energy releases from Earth''s magnetosphere', 'Earth''s Moon', true, 238900),
(3, 'Sakigake', 1985, 'Japan', 'Observe space plasma and magnetic field in interplanetary space', 'Sun', false, 4340000);

-- Remove one of the satellites from the table since it has just crashed into the planet.
DELETE FROM spacecrafts WHERE id=1;

-- Edit another satellite because it is no longer operating and change the value to reflect that.
UPDATE spacecrafts SET currently_operating=false WHERE id=2; 