select * from auto;

SELECT MARK, color, COUNT(color) AS 'Quantity' FROM AUTO
WHERE MARK = 'LADA'
GROUP BY color, mark 
UNION SELECT MARK, color, COUNT(color) AS 'Quantity' FROM AUTO
WHERE MARK = 'BMW'
GROUP BY color, mark;

SELECT MARK, (COUNT(color) - 1) AS 'Quantity' FROM AUTO
GROUP BY MARK;

create table test_a(id int, test varchar(10));

create table test_b(id int);

insert into test_a(id,test) values
(10,'A'),
(20,'A'),
(30,'F'),
(40,'D'),
(50,'C');

insert into test_b(id) values (10), (30),(50);

SELECT * FROM test_a
natural left JOIN test_b
WHERE test_b.id IS NULL;

SELECT * FROM test_a
JOIN test_b
WHERE test_b.id IS NULL;