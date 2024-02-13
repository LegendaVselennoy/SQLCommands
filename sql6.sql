select firstname , lastname
from customers
union select FirstName,LastName from employees;

select * from customers;

select *from employees;

select firstname , lastname
from customers
union select FirstName,LastName from employees
order by FirstName desc;

select firstname , lastname
from customers
union all select FirstName,LastName from employees
order by FirstName;

select firstname,Lastname, AccountSum + AccountSum*0.1 as totalSum
from customers where AccountSum<3000
union select firstname,Lastname,AccountSum + AccountSum*0.3 as totalSum
from customers where AccountSum>=3000;

 
 CREATE TABLE orders (
  Id INT  AUTO_INCREMENT primary key,
  ProductId INT NOT NULL,
  CustomerId INT NOT NULL,
  CreatedAt DATE NOT NULL,
  ProductCount INT DEFAULT 1,
  Price DECIMAL NOT NULL,
  Foreign key(ProductId) references Products(Id) on delete cascade,
  Foreign key(CustomerId) references Customers_2(Id) on delete cascade
 );
 
 drop table orders;
 
 select * from customers;
 
 select * from orders; 
 
 select orders.CreatedAt,orders.ProductCount,products.ProductName
 from orders
 join products on products.Id=orders.ProductId;

