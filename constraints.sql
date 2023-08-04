create database constraints;
use constraints;

CREATE TABLE people (
    name VARCHAR(100),
    phone_no INT UNIQUE
);


CREATE TABLE palindromes (
    content VARCHAR(50) CHECK (REVERSE(content) = content)
);

CREATE TABLE palindromes2 (
    content VARCHAR(50),
    CONSTRAINT is_palindrome CHECK (REVERSE(content) = content)
);

CREATE TABLE name_address (
    name VARCHAR(50),
    address VARCHAR(100),
    CONSTRAINT name_address UNIQUE (name , address) -- combination of name and address should be unique but they may not be unique on their own
    
);

CREATE TABLE name_address2 (
    name VARCHAR(50),
    address VARCHAR(100),
    CONSTRAINT name_address UNIQUE (name , address), -- combination of name and address should be unique but they may not be unique on their own
    CONSTRAINT name_unique unique(name)
);

-- CREATE TABLE table_values (
--     values_col INT,
--     CONSTRAINT value_avg_greater_than_50 CHECK (AVG(values_col) > 50)
-- );

-- insert into table_values values(50); -- thi portion can be done with triggers

desc test;
desc alterCheck;

create table test(
name varchar(50)
);

alter table test add column address varchar(100);
alter table test drop column address;

rename table test to alterCheck;
alter table test rename to alterCheck; -- these two do the same thing

alter table alterCheck rename column name to names;

alter table alterCheck modify column names varchar(150);
alter table alterCheck change names all_names varchar(200);

alter table alterCheck add constraint is_greater_than_5 check(char_length(all_names) > 5);

insert into alterCheck values('arjun');
insert into alterCheck values('sankalan');