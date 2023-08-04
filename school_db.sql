create database school;
use school;

create table students(
id int primary key auto_increment,
first_name varchar(50)
);

drop table student;
drop table papers;

create table papers(
title varchar(100),
grade decimal(15, 2),
student_id int,
foreign key(student_id) references students(id) on delete cascade
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


-- Exercise

select first_name, title, grade from students s join papers p on s.id = p.student_id order by grade desc;
select first_name, title, grade from students s left join papers p on s.id = p.student_id;
select first_name, ifnull(title, 'MISSING'), ifnull(grade, 0) from students s left join papers p on s.id = p.student_id;
select first_name, avg(ifnull(grade), 0) as average from students s left join papers p on s.id = p.student_id group by first_name order by average desc;

select first_name, avg(ifnull(grade, 0)) as average, 
case 
when avg(ifnull(grade, 0)) > 75 then 'PASSING'
else 'FAILING'
end as grades
from students s left join papers p on s.id = p.student_id group by first_name order by average desc;

