use lesson_1;

Drop table if exists staff;

CREATE TABLE staff (
id INT AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(45),
lastname VARCHAR(45),
post VARCHAR(100),
seniority INT,
salary INT,
age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);


select * from staff order by age;

select firstname,lastname,age
from staff
order by firstname desc;

select distinct firstname from staff;

select * from staff limit 2;

select * from staff limit 4,3;

select * from staff order by id desc limit 2,3;

CREATE TABLE employee_tbl (
id_emp INT AUTO_INCREMENT PRIMARY KEY,
id INT NOT NULL,
name VARCHAR(50) NOT NULL,
work_date DATE,
daily_typing_pages INT
);

INSERT INTO employee_tbl (id, name, work_date, daily_typing_pages)
VALUES
(1, 'John', '2007-01-24', 250),
(2, 'Ram', '2007-05-27', 220),
(3, 'Jack', '2007-05-06', 170),
(3, 'Jack', '2007-04-06', 100),
(4, 'Jill', '2007-04-06', 220),
(5, 'Zara', '2007-06-06', 300),
(5, 'Zara', '2007-02-06', 350);

select sum(daily_typing_pages) from employee_tbl;

select name,sum(daily_typing_pages) from employee_tbl
group by name;

select count(*) from employee_tbl;

select count(id) from employee_tbl;

select count(distinct name) from employee_tbl;

select avg(daily_typing_pages) from employee_tbl;

CREATE TABLE employee_salary (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT,
salary INT
);

INSERT INTO employee_salary (name, age, salary)
VALUES
('Дима', 23, 100),
('Петя', 23, 200),
('Вася', 23, 300),
('Коля', 24, 1000),
('Иван', 24, 2000),
('Паша', 25, 700);

select age,sum(salary)  from employee_salary group by age;

select age,max(salary)  from employee_salary group by age;

select age,min(salary)  from employee_salary group by age;

select age,sum(salary) as sum
from employee_salary
group by age
having sum>=1000;

select age,count(*) as count
from employee_salary
group by age
having count<=2;

select age,count(*) as count
from employee_salary
group by age
having count between 0 and 2;

select age,count(*) as count
from employee_salary
group by age
having count in (0,1,2);

