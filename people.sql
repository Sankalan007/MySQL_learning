CREATE DATABASE people;
USE people;

CREATE TABLE people (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
);

DROP TABLE people;


select * from people;

INSERT INTO people(first_name, last_name, age) VALUES ('Tina', 'Belcher', 13), ('Phillip', 'Frond', 38);
INSERT INTO people() VALUES(); -- inserts null values in all fields
INSERT INTO people(first_name) VALUES ('Tina');


CREATE TABLE people2 (
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT NOT NULL
);

select * from people2;

DESC people2;

INSERT INTO people2() VALUES(); -- query gets interrupted because of fields being NOT NULL
INSERT INTO people2 VALUES('Mario\'s', 'Pizza', 10); -- putting a '\' before "'" escapes the quote character 

CREATE TABLE people3(
first_name VARCHAR(20) NOT NULL DEFAULT 'Mystery',
last_name VARCHAR(20) NOT NULL DEFAULT 'default',
age INT NOT NULL DEFAULT 2
);

select * from people3;

INSERT INTO people3 VALUES();


CREATE TABLE people4(
first_name VARCHAR(20) DEFAULT 'Mystery',
last_name VARCHAR(20) DEFAULT 'default',
age INT DEFAULT 2
);

select * from people4;

INSERT INTO people4 VALUES(NULL, NULL, 2);


-- CREATE TABLE people5(
-- first_name VARCHAR(20) NULL DEFAULT NULL,
-- last_name VARCHAR(20) NULL DEFAULT NULL,
-- age INT DEFAULT 2
-- );

-- DESC poeple5;

-- select * from people5;

CREATE TABLE people6(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
age INT
);

INSERT INTO people6(name, age) VALUES ('ABCD', 5), ('XYZ', 6);

DESC people6;

SELECT * FROM people6;

CREATE TABLE Employees(
id INT PRIMARY KEY AUTO_INCREMENT,
last_name VARCHAR(100) NOT NULL,
first_name VARCHAR(100) NOT NULL,
middle_name VARCHAR(100),
age INT NOT NULL,
current_status VARCHAR(15) NOT NULL DEFAULT 'employed'
); 

DESC Employees;

INSERT INTO Employees(last_name, first_name, age) VALUES ('abc', 'xyz', 15);

SELECT * FROM Employees;

UPDATE Employees SET last_name = 'lala' WHERE first_name = 'xyz' AND age = 15;


 

