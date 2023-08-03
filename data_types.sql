create database data_type_db;
use data_type_db;

create table parents(children int);
select * from parents;

insert into parents values(3), (2), (90.89);

CREATE TABLE children (
    id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    age INT,
    weight DECIMAL(4 , 2 ) -- 4 digits total, 2 after decimal, which gives us 2 digits before decimal
						   -- if we add more than 2 digits after the decimal it will just truncate it to the closest value such as 5.026 -> 5.03
                           -- but will give error if we add more before the decimal
);

select * from children;

insert into children(age, weight) values(12, 4000.235);

create table numbers(x float, y double);
select * from numbers;
SELECT FORMAT(x, 7), FORMAT(y, 15) FROM numbers;


insert into numbers values (1.12345678, 1.12345689876543210);


CREATE TABLE people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

select * from people;

insert into people values ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

select curtime();
select curdate();
select now();

insert into people values ('Tina', curdate(), curtime(), now()); -- now() gives both date and time in this order

select birthdate, day(birthdate), dayofweek(birthdate), dayofyear(birthdate), dayname(birthdate), monthname(birthdate) from people;

select birthdate, date_format(birthdate, '%a, %b %D') from people;

select birthdate, datediff(curdate(), birthdate) from people; -- difference from first parameter to second parameter(first - second)
select date_add(curdate(), interval 1 month);
select date_add(birthdate, interval 18 year) from people;
select date_sub(curdate(), interval 18 year);

select birthdate, year(birthdate + interval 18 year) as will_be_18 from people;
select birthdate, date_add(birthdate, interval 18 year) as will_be_18 from people;

select timestamp(now()); -- timestamp takes up less space and contains date from 1970 to 2083
select timestamp('2000-12-25 11:00:00');

CREATE TABLE captions (
    text VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from captions;

CREATE TABLE captions2 (
    text VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

select * from captions2;

insert into captions(text) values('world cup');

insert into captions2(text) values('watching france vs argentina');
update captions2 set text = 'mbappe hat trick' where text = 'watching france vs argentina';

-- Exercise

-- use case of char : fixed length such as area code, zip code, phone number
CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(10 , 2 ),
    quantity SMALLINT
);
-- datetime takes larger space while timestamp takes smaller space, timestamp has smaller range while datetime has larger range
select curtime();
select curdate();
select dayofweek(curdate());
select dayname(curdate());
select curdate(), date_format(curdate(), '%m/%d/%Y') as formatted_date; -- %m : month in short, %M : monthname, %d : date in numeric, %D : date with english subscript, %y : year in abbr. form(2 digit), %Y : year in long form(4 digit)
select curdate(), date_format(now(), '%M %D at %h:%i') as formatted_time; -- you can use date_format for formatting both date and time, but you can use time_format to format time only

CREATE TABLE tweets (
    content VARCHAR(140),
    username VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select birthdate from people where birthdate > 2005;

select cast('9:12:7' as time);

select * from people where birthtime > cast('12:0:0' as time);
select * from people where birthtime between cast('12:0:0' as time) and cast('13:0:0' as time);