show databases;
create database pet_shop;

use pet_shop;

CREATE TABLE dogs(
name varchar(50),
breed varchar(50),
age int);

SHOW TABLES;





INSERT INTO cats(name, age) VALUES("Blue", 5);
INSERT INTO cats(age, name) VALUES(3, "victoria");

INSERT INTO cats(name, age) VALUES ("POTATO", 4), ("world", 2), ("DANGER", 7);


SHOW tables;


CREATE TABLE cats(
cat_id INT AUTO_INCREMENT PRIMARY KEY,
name varchar(100),
breed VARCHAR(100),
age int
);

DROP TABLE cats;



SHOW COLUMNS FROM cats;
DESC cats;

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
SELECT * FROM cats;


SELECT id FROM cats;
SELECT name, breed FROM cats;
SELECT name, age FROM cats WHERE breed = 'Tabby';
SELECT * FROM cats WHERE age = 4;
SELECT * FROM cats WHERE age = cat_id;

SELECT cat_id AS id, name as kittyName FROM cats;

SET SQL_SAFE_UPDATES = 0;
UPDATE cats SET name = 'JOCKY' WHERE name = 'JACK';
SET SQL_SAFE_UPDATES = 1;


