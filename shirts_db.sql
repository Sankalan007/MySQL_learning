create database shirts_db;
use shirts_db;

create table shirts(
shirt_id INT PRIMARY KEY auto_increment,
article VARCHAR(15),
color VARCHAR(15),
shirt_size VARCHAR(10),
last_worn INT 
);

SELECT * FROM shirts;

INSERT INTO shirts(article, color, shirt_size, last_worn) values
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES ('polo shirt', 'purple', 'M', 50);


UPDATE shirts SET shirt_size = 'L' WHERE article = 'polo shirt';

UPDATE shirts SET shirt_size = 'XS', color = 'off white' WHERE color = 'white';

DELETE FROM shirts where last_worn = 200;