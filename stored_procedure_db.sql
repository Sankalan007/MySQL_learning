create database if not exists stored_proc_demo;
use stored_proc_demo;

create table if not exists employees(
emp_id int primary key auto_increment,
name varchar(100),
age int 
);

insert into employees(name, age) values('Arjun', 21);

drop procedure if exists GetEmployeeInfo;

delimiter //

create procedure GetEmployeeInfo(in eId int, out emp_name varchar(100))
begin
select name into emp_name from employees where emp_id = eId;

end;

//

delimiter ;



select * from employees;



set @EmployeeName = '';
call GetEmployeeInfo(2, @EmployeeName);
select @EmployeeName as employee_name;

