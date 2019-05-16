/* STEPS TO CREATE DATABASE, RUN FILES ON IT, AND MOVE INTO DATABASE */
-- 0. Create database: createdb -U postgres -w wedding
-- 1. psql -f ./fundamental-sql-commands.sql wedding postgres
-- 2. psql wedding postgres

-- Write a command that creates the table to track the wedding dinner.


CREATE TABLE wedding_guests(
	first_name text,
	last_name text,
	RSVP_sent bool,
	num_guests integer,
	num_meals integer
	
);


-- Write a command that adds a column to track whether the guest sent a thank you card.


ALTER TABLE wedding_guests ADD COLUMN thank_you_sent text;


-- You have decided to move the data about the meals to another table, so write a command to remove the column storing the number meals from the wedding table.


ALTER TABLE wedding_guests DROP COLUMN num_meals;


-- The guests will need a place to sit at the reception, so write a command that adds a column for table number.


ALTER TABLE wedding_guests ADD COLUMN table_number integer;


-- The wedding is over and we do not need to keep this information, so write a command that deletes the table numbers from the database.
-- DROP TABLE wedding_guests;
