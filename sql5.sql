CREATE TABLE members
(
member_id INT AUTO_INCREMENT,
name VARCHAR (100) ,
PRIMARY KEY (member_id)
);

CREATE TABLE committees
(
committee_id INT AUTO_INCREMENT,
name VARCHAR (100),
PRIMARY KEY (committee_id)
);

INSERT INTO members (name)
VALUES("John"), ("Jane"), ("wary"), ("David"), ("2melia");

INSERT INTO committees (name)
VALUES ("John"), ("Mary"), ("Amelial"), ("Joe");

SELECT * FROM members;

SELECT * FROM committees;

/* Задание:
Выведите участников, которые также являются членами комитета,
 используйте INNER JOIN (пересечение 2 таблиц по имени); */
 
select * from members inner join committees
on members.name=committees.name;
 
select * from members inner join committees
using(name);

CREATE TABLE products (
product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category INT NULL,
product_name VARCHAR(100) NOT NULL
);

CREATE TABLE categories (
category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL
);

INSERT INTO products(category, product_name)
VALUES (1, 'Системный блок'),
(1, 'Монитор'),
(2, 'Холодильник'),
(2, 'Телевизор'),
(NULL, 'Операционная система');

INSERT INTO categories (category_name)
VALUES ('Комплектующие компьютера'),
('Бытовая техника'),
('Мобильные устройства');

SELECT * FROM products;

SELECT * FROM categories;

SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c
ON p.category = c.category_id
UNION
SELECT p.product_name, c.category_name
FROM products p
RIGHT JOIN categories c
ON p.category = c.category_id;

select * from committees
right join members
using(name)
where committees.name is null;

select * from committees
right join members using(name);

CREATE TABLE t1(
id INT PRIMARY KEY
);

CREATE TABLE t2(
id INT PRIMARY KEY
);

INSERT INTO t1 VALUES (1),(2),(3);

INSERT INTO t2 VALUES (2),(3),(4); -- UNION

SELECT id FROM t1
UNION
SELECT id FROM t2;

