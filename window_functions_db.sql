create database window_functions_db;
use window_functions_db;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);


select emp_no, department, salary, avg(salary) over(partition by department) from employees;

SELECT 
    emp_no, department, salary, MIN(salary), MAX(salary)
FROM
    employees; -- will not work as non-aggregated columns are being used with aggregated columns
select emp_no, department, salary, min(salary) over(), max(salary) over() from employees; -- will work as over() is working on every row

-- select emp_no, department, sum(*) from employees group by department; -- sum of all rows does not make any sense unlike count where it means count of rows

select emp_no, department, sum(salary) over(partition by department) as dept_salary, sum(salary) over() as overall_salary from employees;


select emp_no, department, salary, sum(salary) over(partition by department) as dept_salary, sum(salary) over(partition by department order by salary desc) as rolling_dept_salary from employees;
select emp_no, department, salary, min(salary) over(partition by department) as min_salary, min(salary) over(partition by department order by salary desc) as rolling_min_salary from employees;
select emp_no, department, salary, max(salary) over(partition by department) as max_salary, max(salary) over(partition by department order by salary desc) as rolling_max_salary from employees;

select emp_no, department, salary, 
row_number() over(partition by department order by salary desc) as row_numbers, 
rank() over(partition by department order by salary desc) as dept_salary_rank, 
rank() over(order by salary desc) as overall_salary_rank,
dense_rank() over(order by salary desc) as overall_salary_dense_rank
from employees order by overall_salary_rank;

SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    first_value(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	first_value(emp_no) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

select emp_no, department, salary, salary - lag(salary) over(order by salary desc) as salary_diff from employees;
select emp_no, department, salary, salary - lag(salary) over(partition by department order by salary desc) as salary_diff from employees;