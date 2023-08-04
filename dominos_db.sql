create database dominos;
use dominos;

create table customers(
customer_id int primary key auto_increment,
first_name varchar(100),
last_name varchar(100),
email varchar(50)
);

drop table customers;

delete from customers where customer_id = 1;
select * from orders;

create table orders(
order_id int primary key auto_increment,
order_time timestamp default now(),
customer_id int,
amount decimal(6,2),
foreign key(customer_id) references customers(customer_id) on delete cascade
);

create table orders2(
order_id int primary key auto_increment,
order_time timestamp default now(),
customer_id int,
amount decimal(6,2),
foreign key(customer_id) references customers(customer_id) on delete set null
);

delete from customers where customer_id = 2;

select * from orders;
select * from orders2;

drop table orders;

show tables;

select * from customers;
select * from orders;

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
('George', 'Michael', 'gm@gmail.com'),
('David', 'Bowie', 'david@gmail.com'),
('Blue', 'Steele', 'blue@gmail.com'),
('Bette', 'Davis', 'bette@aol.com');


INSERT INTO orders2 (amount, customer_id)
VALUES
(800.67, 2),
(12.50, 2),
(450.25, 5);

select * from customers c, orders o where o.customer_id = c.customer_id;

select * from customers join orders on orders.customer_id = customers.customer_id;
select * from customers join orders on customers.customer_id = orders.customer_id;

select * from customers left join orders on orders.customer_id = customers.customer_id;

select * from customers right join orders on orders.customer_id = customers.customer_id;

select c.customer_id, first_name from customers c join orders o on o.customer_id = c.customer_id;


select concat(first_name, ' ', last_name) name, coalesce(sum(amount), 0) money_spent from customers c left join orders o on c.customer_id = o.customer_id group by first_name, last_name;




