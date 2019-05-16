-- STEPS TO CREATE DATABASE, RUN FILES ON IT, AND MOVE INTO DATABASE
-- 0. Create database: createdb -U postgres -w emails
-- 1. psql -f ./07-emails.sql emails postgres
-- 2. psql emails postgres

CREATE TABLE emails (
	id integer,
	subject text,
	sender text,
	additional_recipients text,
	email_body text,
	sent_at timestamp,
	mark_as_read boolean,
	email_chain_id int
);

-- Add three new emails to the inbox.

INSERT INTO emails (id, subject, sender, additional_recipients, email_body, sent_at, mark_as_read, email_chain_id)
VALUES
(12, 'Submission approved!', 'Bloc', null, 'Your Bloc submission has been approved!', TIMESTAMP '2019-05-14 13:11:14', true, 40),
(15, 'Job Interview went great!', 'Job McJobbyface', 'CTO Fredricka Harris', 'It was nice meeting you! We''d like to bring you in for a second interview.', TIMESTAMP '2019-05-15 10:41:21', true, 54),
(17, 'Concert on Friday', 'John Farris', 'William Reid', 'I got the tickets. Y''all owe me $27 a-pop.', TIMESTAMP '2019-05-16 15:01:42', false, 49);


DELETE FROM emails WHERE id=17;


UPDATE emails SET mark_as_read=false WHERE id=15;