CREATE DATABASE book_shop;
USE book_shop;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) AS author_name FROM books;
SELECT CONCAT_WS('-', title, author_fname, author_lname) AS author_name FROM books;

SELECT substring('HELLO WORLD', 5); 
SELECT substr('HELLO WORLD', -5, 1);

SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title
FROM
    books; 
    
SELECT REPLACE('ABCD', 'AB', 'Arjun') AS replace_demo;
SELECT REPLACE('cheese milk bread', ' ', ' and ') AS replace_demo;
SELECT REPLACE(title, ' ', '-') FROM books;

SELECT 
    author_lname, REVERSE(author_fname)
FROM
    books;
    
SELECT CHAR_LENGTH('Hello');
SELECT LENGTH('Hello');

select upper(title) from books;
select concat('I LOVE ', upper(title), ' !!!') from books;

select insert('Hi guys', 3, 1, ' dudes and '); -- inserts ' dudes and ' in position 3 and replaces 1 character

select left('omghilol', 3);
select right('omghilol', 3); -- leftmost and rightmost 3 characters

select repeat('hi', 10); -- repeats hi 10 times

select trim('   san kalan '); -- trims only leading and trailing spaces
select trim(leading '.' from '...sankalan..'); -- trims only leading '.'
select trim(trailing '.' from '...sankalan..'); -- trims only trailing '.'
select trim(both '.' from '...sankalan..'); -- trims both trailing and leading '.'

select reverse(upper('Why does my cat look at me with such hatred?'));

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
select distinct author_fname from books;
SELECT distinct CONCAT(author_fname, ' ', author_lname) from books;
select distinct author_fname, author_lname, released_year FROM books;

select author_fname from books order by author_fname desc;

select book_id, author_fname, author_lname from books order by 2; --  ordered by 2nd column name(here author_fname)

select * from books order by author_lname, released_year;

select concat(author_fname, ' ', author_lname) as author from books order by author;






select author_fname, author_lname, released_year from books order by released_year desc limit 4, 5;
select author_fname, author_lname, released_year from books order by released_year desc;


select title, author_fname, author_lname from books where author_fname like '%da%'; -- author name contains 'da'
select title, author_fname, author_lname from books where author_fname like '____'; -- author name is of 4 characters
select title, author_fname, author_lname from books where author_fname like '%n'; -- author name has 'n' at the end

select title, author_fname, author_lname from books where title like '%\%%'; -- escape character for %

select title from books where title like '%stories%';
select title, pages from books order by pages desc limit 1;
select title, pages from books order by pages limit 1;
select concat(title, ' - ', released_year) from books as summary order by released_year desc limit 3;
select title, author_lname from books order by author_lname, title;


select count(*) from books;

select count(author_fname) from books; -- counting any non-null author_fname values

select count(distinct author_fname) from books; -- counting only the distinct first names

select count(title) from books where title like '%the%';

-- Exercise

select author_lname, count(*) from books group by author_lname; 
select sum(pages), author_lname from books group by author_lname; -- groups by the author_lname behind the scenes and then shows their respective counts
select released_year, count(*) from books group by released_year;
select author_lname from books group by author_lname;
select max(pages) from books;

select title, pages from books where pages = (select max(pages) from books);
select title, released_year from books where released_year = (select min(released_year) from books);

select author_fname, auth or_lname, count(*) from books group by author_lname, author_fname;

select author_lname, MIN(released_year) from books group by author_lname;
select author_lname, MAX(released_year) from books group by author_lname;

select author_fname, author_lname, count(*) as books_written, max(pages) most_pages, max(released_year) as latest_release, min(released_year) as earliest_release from books group by author_lname, author_fname;


-- Exercise 

select count(*) from books;
select released_year, count(*) from books group by released_year;
select avg(released_year) from books group by author_lname, author_fname;
select sum(stock_quantity) as total_books from books;
select concat(author_fname, ' ', author_lname) as name, avg(released_year) as average from books group by author_fname, author_lname;
select concat(author_fname, ' ', author_lname) as name, title, pages from books where pages = (select max(pages) from books);
select released_year, count(*), avg(pages) from books group by released_year order by released_year;

-- 


select released_year from books where released_year > 2000;
select released_year from books where released_year >= 2000;
select released_year from books where released_year <= 2000;
select released_year from books where released_year >= 2000 AND released_year <= 2015;
select released_year from books where released_year between 2000 and 2015; -- inclusive for both lower and upper limit, generally used for comparing dates





