create table sales(
   sales_employee varchar(50) not null,
   fiscal_year int not null,
   sale decimal(14,2) not null,
   primary key(sales_employee,fiscal_year)
);

select * from sales;

select sum(sale) from sales;

select fiscal__year, sum(sale)
from sales
group by fiscal_year;

create view CopyProducts as  
select price,productcount,manufacturer
from products
where manufacturer='Apple';

select * from CopyProducts;

drop view CopyProducts;

create table test(
  id int ,
  count int
);

Drop table test;

alter view CopyProducts as 
select price,productcount,manufacturer,productname
from products
where manufacturer='Apple';

alter table test add column teststring varchar(40);

select * from test;

alter table test drop column teststring;

select * from auto;

select mark,count(*) as count_mark,
(select count(*) from auto)-count(*) as mark
from auto
group by MARK;

WITH RECURSIVE sequence (n) AS
(
SELECT 0
UNION ALL
SELECT n + 1
FROM sequence
WHERE n + 1 <= 10
)
SELECT n
FROM sequence;

WITH RECURSIVE cte AS
(
SELECT 1 AS a
UNION ALL
SELECT a + 1 FROM cte
WHERE a < 10
)
SELECT * FROM cte;

