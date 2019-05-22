/* 

CREATE TABLE employees(
  "id"   INTEGER,
  "name" VARCHAR(32),
  
  PRIMARY KEY("id")
);

CREATE TABLE shifts(
  "id"         INTEGER,
  "date"       VARCHAR(16),
  "start_time" TIME,
  "end_time"   TIME,
  
  PRIMARY KEY("id")
);

CREATE TABLE scheduled_shifts(
  "employee_id" INTEGER,
  "shift_id"    INTEGER,
  
  FOREIGN KEY ("employee_id")
    REFERENCES "employees" ("id")
    ON DELETE CASCADE,
  
  FOREIGN KEY ("shift_id")
    REFERENCES "shifts" ("id")
    ON DELETE CASCADE,
  
  UNIQUE("shift_id")
);

INSERT INTO employees
  ("id", "name")
VALUES
  ( 1,   'Hermione Granger'),
  ( 2,   'Ronald Weasley'),
  ( 3,   'Luna Lovegood'),
  ( 4,   'Draco Malfoy'),
  ( 5,   'Padma Patil'),
  ( 6,   'Neville Longbottom'),
  ( 7,   'Cedric Diggory'),
  ( 8,   'Cho Chang'),
  ( 9,   'Dean Thomas');

INSERT INTO shifts
  ("id",  "date",       "start_time", "end_time")
VALUES
  (  1,   '1998-03-09', '08:00:00',   '12:00:00'),
  (  2,   '1998-03-09', '08:00:00',   '16:00:00'),
  (  3,   '1998-03-09', '12:00:00',   '16:00:00'),
  (  4,   '1998-03-09', '12:00:00',   '20:00:00'),
  (  5,   '1998-03-09', '16:00:00',   '20:00:00'),

  (  6,   '1998-03-10', '08:00:00',   '12:00:00'),
  (  7,   '1998-03-10', '08:00:00',   '16:00:00'),
  (  8,   '1998-03-10', '12:00:00',   '16:00:00'),
  (  9,   '1998-03-10', '12:00:00',   '20:00:00'),
  ( 10,   '1998-03-10', '16:00:00',   '20:00:00'),

  ( 11,   '1998-03-11', '08:00:00',   '12:00:00'),
  ( 12,   '1998-03-11', '08:00:00',   '16:00:00'),
  ( 13,   '1998-03-11', '12:00:00',   '16:00:00'),
  ( 14,   '1998-03-11', '12:00:00',   '20:00:00'),
  ( 15,   '1998-03-11', '16:00:00',   '20:00:00'),

  ( 16,   '1998-03-12', '08:00:00',   '12:00:00'),
  ( 17,   '1998-03-12', '08:00:00',   '16:00:00'),
  ( 18,   '1998-03-12', '12:00:00',   '16:00:00'),
  ( 19,   '1998-03-12', '12:00:00',   '20:00:00'),
  ( 20,   '1998-03-12', '16:00:00',   '20:00:00'),

  ( 21,   '1998-03-13', '08:00:00',   '12:00:00'),
  ( 22,   '1998-03-13', '08:00:00',   '16:00:00'),
  ( 23,   '1998-03-13', '12:00:00',   '16:00:00'),
  ( 24,   '1998-03-13', '12:00:00',   '20:00:00'),
  ( 25,   '1998-03-13', '16:00:00',   '20:00:00');

INSERT INTO scheduled_shifts
  ("employee_id", "shift_id")
VALUES
  ( 1,              2),
  ( 1,              7),
  ( 1,             12),
  ( 1,             17),
  ( 1,             22),
  
  ( 2,              8),
  ( 2,             18),

  ( 3,              3),
  ( 3,             13),
  ( 3,             23),
  
  ( 4,             15),
  ( 4,             20),
  ( 4,             25),

  ( 5,              4),
  ( 5,              9),
  ( 5,             14),
  
  ( 5,              1),
  ( 5,              6),
  ( 5,             11),
  ( 8,             19),
  ( 8,             24),

  ( 9,              5),
  ( 9,             10);

*/

-- List all employees and all shifts.

SELECT e.name, s.date, s.start_time, s.end_time 
FROM scheduled_shifts AS ss 
JOIN employees AS e ON e.id = ss.employee_id 
JOIN shifts AS s ON ss.shift_id = s.id;

