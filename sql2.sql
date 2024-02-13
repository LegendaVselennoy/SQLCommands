select * from Products
Order by price;

select productName, productCount * price as totalSum
from products
order by totalSum;

select * from products
limit 3;

select * from products
limit 2,3;

select distinct Manufacturer,ProductCount from products;

select Manufacturer,count(*) as ModelsCount
from products
group by Manufacturer;

select avg(price) as Avarage_Price from products;

select avg(price) as Avarage_Price from products
where Manufacturer='Apple';

select count(*) from products;

select min(price) , max(price) from products;

select Manufacturer,count(*) as modelCount
from products
group by Manufacturer
having count(*) > 1;

select Manufacturer,count(*) as modelsCount
from products
where price * ProductCount > 80000
group by Manufacturer
having count(*) > 1;

select Manufacturer,count(*) as modelsCount,sum(ProductCount) as Units
from products
where price * ProductCount > 80000
group by Manufacturer
having sum(ProductCount) > 2
order by Units desc;

select * from products
order by price desc;

select count(*) as Count
from products;

select * from products
limit 5;

select * from products
limit 1,2;

select sum(price) as totalSum from products;

select min(price)
from products
where Manufacturer='Apple';

select min(price),
       max(price),
       avg(price)
 from products
 where Manufacturer='Samsung';   