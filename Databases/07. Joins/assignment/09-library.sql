/*
CREATE TABLE books (
  "isbn"   VARCHAR(16),
  "title"  VARCHAR(64),
  "author" VARCHAR(32),
  
  PRIMARY KEY ("isbn")
);

CREATE TABLE patrons (
  "id"   INTEGER,
  "name" VARCHAR(32),
  
  PRIMARY KEY ("id")
);

CREATE TABLE transactions (
  "id"               INTEGER,
  "patron_id"        INTEGER,
  "isbn"             VARCHAR(16),
  "checked_out_date" DATE,
  "checked_in_date"  DATE,
  
  FOREIGN KEY ("patron_id")
    REFERENCES "patrons" ("id")
    ON DELETE CASCADE,
  
  FOREIGN KEY ("isbn")
    REFERENCES "books" ("isbn")
    ON DELETE CASCADE,
  
  PRIMARY KEY ("id")
);

CREATE TABLE holds (
  "id"        INTEGER,
  "patron_id" INTEGER,
  "isbn"      VARCHAR(16),
  "rank"      INTEGER,
  "date"      DATE,
  
  FOREIGN KEY ("patron_id")
    REFERENCES "patrons" ("id")
    ON DELETE CASCADE,
  
  FOREIGN KEY ("isbn")
    REFERENCES "books" ("isbn")
    ON DELETE CASCADE,
  
  PRIMARY KEY ("id")
);

INSERT INTO books
  ("isbn",        "title",                                  "author")
VALUES
  ('1840918626', 'Hogwarts: A History',                     'Bathilda Bagshot'),
  ('3458400871', 'Fantastic Beasts and Where to Find Them', 'Newt Scamander'),
  ('9136884926', 'Advanced Potion-Making',                  'Libatius Borage');

INSERT INTO patrons
  ("id", "name")
VALUES
  ( 1,   'Hermione Granger'),
  ( 2,   'Terry Boot'),
  ( 3,   'Padma Patil'),
  ( 4,   'Cho Chang'),
  ( 5,   'Cedric Diggory');

INSERT INTO transactions
  ("id", "patron_id", "isbn",       "checked_out_date",                        "checked_in_date")
VALUES
 ( 1,     1,          '1840918626',  CURRENT_DATE - INTERVAL '6 YEARS, 1 DAY',  CURRENT_DATE - INTERVAL '6 YEARS'),
 ( 2,     4,          '9136884926',  CURRENT_DATE - INTERVAL '6 YEARS, 1 DAY',  CURRENT_DATE - INTERVAL '6 YEARS'),
 ( 3,     2,          '3458400871',  CURRENT_DATE - INTERVAL '6 YEARS, 1 DAY',  CURRENT_DATE - INTERVAL '6 YEARS'),
 ( 4,     3,          '3458400871',  CURRENT_DATE - INTERVAL '7 DAYS',          CURRENT_DATE - INTERVAL '4 DAYS'),
 ( 5,     2,          '9136884926',  CURRENT_DATE - INTERVAL '3 DAYS',          NULL),
 ( 6,     1,          '3458400871',  CURRENT_DATE - INTERVAL '3 DAYS',          CURRENT_DATE - INTERVAL '1 DAY'),
 ( 7,     5,          '3458400871',  CURRENT_DATE - INTERVAL '1 DAY',           NULL);

INSERT INTO holds
  ("id", "patron_id", "isbn",       "rank", "date")
VALUES
  ( 1,    4,          '3458400871',  1,     CURRENT_DATE - INTERVAL '1 DAY'),
  ( 2,    5,          '9136884926',  2,     CURRENT_DATE - INTERVAL '1 DAYS'),
  ( 3,    2,          '9136884926',  1,     CURRENT_DATE - INTERVAL '2 DAYS');
*/



-- To determine if the library should buy more copies of a given book, please provide the names and position, in order, of all of the patrons with a hold (request for a book with all copies checked out) on "Advanced Potion-Making".
SELECT p.name, h.rank
FROM patrons AS p
JOIN holds AS h
ON p.id = h.patron_id
JOIN books AS b
ON b.isbn = h.isbn
WHERE b.title = 'Advanced Potion-Making'
ORDER BY h.rank ASC;

-- List all of the library patrons. If they have one or more books checked out, list the books with the patrons.git 

SELECT p.name, bt.title
FROM patrons AS p
LEFT JOIN (
	SELECT b.title, t.patron_id
	FROM books AS b
	JOIN transactions AS t
	ON b.isbn = t.isbn
	WHERE t.checked_in_date IS NULL
) AS bt
ON p.id = bt.patron_id;