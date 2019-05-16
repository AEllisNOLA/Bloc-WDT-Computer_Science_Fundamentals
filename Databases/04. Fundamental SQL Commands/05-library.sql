/* STEPS TO CREATE DATABASE, RUN FILES ON IT, AND MOVE INTO DATABASE */
-- 0. Create database: createdb -U postgres -w library
-- 1. psql -f ./05-library.sql library postgres
-- 2. psql library postgres

CREATE TABLE library_books(
	isbn text,
	title char(30),
	author text,
	genre text,
	publish_date date,
	num_copies integer,
	available_copies integer	
);

-- Find three books and add their information to the table.

INSERT INTO library_books VALUES ( 
9780802130204, 
'A Confederacy of Dunces', 
'John Kennedy Toole',
'Fiction',
'1980-04-11',
3,
2);

INSERT INTO library_books VALUES (
9780679781493,
'Less Than Zero',
'Brett Easton Ellis',
'Fiction',
'1985-11-15',
2,
2);

INSERT INTO library_books VALUES (
9780375725609,
'The Devil in the White City',
'Erik Larson',
'History',
'2003-09-22',
2,
1
);

-- Someone has just checked out one of the books. Change the number of available copies to 1 fewer.
-- "A Confederacy of Dunces checked out. Now 1 available copy.
UPDATE library_books SET available_copies = available_copies - 1 WHERE isbn='9780802130204';

-- Now one of the books has been added to the banned books list. Remove it from the table.
-- "Less Than Zero" banned
DELETE FROM library_books WHERE title='Less Than Zero' AND author='Brett Easton Ellis';
