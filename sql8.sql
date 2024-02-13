CREATE TABLE users (
username VARCHAR(50) PRIMARY KEY,
password VARCHAR(50) NOT NULL,
status VARCHAR(10) NOT NULL);

CREATE TABLE users_profile (
username VARCHAR(50) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE);

INSERT INTO users values
('admin' , '7856', 'Active'),
('staff' , '90802', 'Active'),
('manager' , '35462', 'Inactive');

INSERT INTO users_profile values
('admin', 'Administrator' , 'Dhanmondi', 'admin@test.com' ) ,
('staff', 'Jakir Nayek' , 'Mirpur', 'zakir@test.com' ),
('manager', 'Mehr Afroz' , 'Eskaton', 'mehr@test.com' );

select * from users;

select * from users_profile;

with cte1 as (
 select * from users_profile 
)
select * from cte1;

with cte2 as (
 select count(*) from users
 where status='Active'
)
select * from cte2;

with recursive cte3 as (
   select 1 as a , 1*1 as res
   union all 
   select a+1, pow(a+1,2) as res
   from cte3
   where a<10
)
select * from cte3;

SELECT *,
MAX(OSZ) OVER(PARTITION BY TB) 'максимальной задолженности в каждом банке',
AVG(PROCENT_RATE) OVER(PARTITION BY TB, SEGMENT) AS "средний размер процентной ставки в каждом банке в зависимости от сегмента",
COUNT(ID_DOG) OVER() 'количество договоров '
FROM table1;


SELECT *,
ROW_NUMBER() OVER(ORDER BY count_revisions DESC),
RANK() OVER(ORDER BY count_revisions DESC),
DENSE_RANK() OVER(ORDER BY count_revisions DESC),
NTILE(3) OVER(ORDER BY count_revisions DESC)
FROM table1;

WITH cte AS
(
SELECT *,
DENSE_RANK() OVER(ORDER BY count_revisions DESC) AS ds
FROM table1
)
SELECT * FROM cte
WHERE ds = 2;

SELECT *,
LEAD(Event, 1, 'end') OVER(PARTITION BY id_task ORDER BY date_event),
LEAD(date_event, 1, '2099-01-01') OVER(PARTITION BY id_task ORDER BY date_event)
FROM table1;