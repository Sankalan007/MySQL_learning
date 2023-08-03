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
    CONSTRAINT name_address UNIQUE (name , address)
);
