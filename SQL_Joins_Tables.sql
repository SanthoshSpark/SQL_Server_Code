 
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';

use TestDB;

/*
create table customerType (
	CustomerTypeID int primary key, 
	Name varchar(10)
)

insert into customerType values (1,'VIP')
insert into customerType values (2,'Regular')


create table Customers (
   CustomerID int primary key,
   Name varchar(100),
   CustomerTypeID int null,
   CONSTRAINT FK_Customers_CustomerTypeID FOREIGN KEY (CustomerTypeID)
      REFERENCES customerType (CustomerTypeID)
);

insert into Customers values(1, 'Kevin Costner',1);
insert into Customers values(2, 'Akshay Kumar',2);
insert into Customers values(3, 'Sean Connery',1);
insert into Customers values(4, 'Sanjay Dutt',2);
insert into Customers values(5, 'Sharukh Khan',null);


create table Tables (
   TableNo int primary key,
   CustomerID int null,
   CONSTRAINT FK_Tables_CustomerID FOREIGN KEY (CustomerID)
      REFERENCES Customers (CustomerID)
);

insert into Tables values(1, null);
insert into Tables values(2, 1);
insert into Tables values(3, 2);
insert into Tables values(4, 5);
insert into Tables values(5, null);


create table Orders (
   OrderNo int primary key,
   OrderDate datetime,
   CustomerID int null,
   Amount decimal(10,2),
   CONSTRAINT FK_Orders_CustomerID FOREIGN KEY (CustomerID)
      REFERENCES Customers (CustomerID)
);

insert into Orders Values(1,'2019-12-10',1,5000)
insert into Orders Values(2,'2019-12-09',1,3000)
insert into Orders Values(3,'2019-12-10',2,7000)
insert into Orders Values(4,'2019-12-01',2,7000)
insert into Orders Values(5,'2019-12-10',3,1000)
insert into Orders Values(6,'2019-12-03',3,1000)
insert into Orders Values(7,'2019-12-10',4,3000)
insert into Orders Values(8,'2019-12-10',2,4000)

create table DiscVoucher (
   FromAmount decimal(10,0) ,
   UptoAmount decimal(10,0) ,
   Discount decimal(10,0)
)

insert into DiscVoucher Values(0,3000,0)
insert into DiscVoucher Values(3001,8000,10)
insert into DiscVoucher Values(8001,99999,25)  
*/

select * from customerType;

select * from Orders;

select * from Customers;

select * from [Tables];

select * from Orders;

select * from DiscVoucher;


--List all customers along with their customer type.

select Customers.Name, customerType.Name as customerType from Customers 
left join customerType 
on Customers.CustomerTypeID = customerType.CustomerTypeID;


--Find all orders along with the customer name and customer type.

select Orders.OrderNo, Orders.OrderDate, Customers.CustomerID, Customers.Name, customerType.CustomerTypeID from Orders 
left join Customers on Orders.CustomerID = Customers.CustomerID
left join customerType on Customers.CustomerTypeID = customerType.CustomerTypeID;


--List all tables along with the customer sitting at the table.

select [Tables].TableNo, Customers.Name as CustomerName from [Tables]
left join Customers on [Tables].CustomerID = Customers.CustomerID;


--Find all VIP customers who have placed an order.

select distinct Customers.Name from  Customers
left join Orders on  Customers.CustomerID = Orders.CustomerID
left join customerType on Customers.CustomerTypeID = customerType.CustomerTypeID
where customerType.Name = 'VIP';


--List all orders along with the table number where the customer who placed the order is sitting.

select Orders.OrderNo, Orders.OrderDate,Orders.Amount, [Tables].CustomerID from Orders
left join [Tables] on Orders.CustomerID = [Tables].CustomerID;

--Find the total amount spent by each customer.

select Customers.Name, sum (Orders.Amount) as TotalAmout from Customers 
left join Orders on Customers.CustomerID = Orders.CustomerID
group by Customers.Name;


--List all customers who have not placed any orders.

select Customers.Name from Customers
left join Orders on Customers.CustomerID = Orders.CustomerID
where Orders.CustomerID is null;


--Find all tables that are currently not occupied by any customer.

select TableNo from [Tables]
where CustomerID is null;


--List the number of orders placed by each customer type.

select customerType.Name as CustomerType, COUNT(Orders.OrderNo) as numberOfOrder from Orders
left join Customers on Orders.CustomerID = Customers.CustomerTypeID
left join customerType on Customers.CustomerTypeID = customerType.CustomerTypeID
group by customerType.Name;


--Find all orders placed on '2019-12-10' along with customer details.

select Orders.OrderNo, Customers.Name from Orders
left join Customers on Orders.CustomerID = Customers.CustomerID
where Orders.OrderDate = '2019-12-10';

SELECT Orders.OrderNo, Orders.OrderDate, Orders.Amount, Customers.Name AS CustomerName, customerType.Name AS CustomerType
FROM Orders
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN customerType ON Customers.CustomerTypeID = customerType.CustomerTypeID
WHERE Orders.OrderDate = '2019-12-10';


--List all customers and the total amount they have spent on orders.

select Customers.Name, sum(Orders.Amount) as Amount from Customers
left join Orders on Customers.CustomerID= Customers.CustomerID
group by Customers.Name;


--Find all regular customers who have placed an order of more than 5000.

select distinct Customers.Name, Orders.Amount from Customers
left join Orders on Customers.CustomerID = Orders.CustomerID
where Orders.Amount > 5000 ;

SELECT DISTINCT Customers.Name
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN customerType ON Customers.CustomerTypeID = customerType.CustomerTypeID
WHERE customerType.Name = 'Regular' AND Orders.Amount > 5000;


--List all tables along with customer names and their order count.

select [Tables].TableNo, Customers.Name, count(Orders.OrderNo) as orderCount from [Tables]
left join Customers on [Tables].CustomerID = Customers.CustomerID
left join Orders on Customers.CustomerID = Orders.CustomerID
group by [Tables].TableNo,Customers.Name;

SELECT Tables.TableNo, Customers.Name AS CustomerName, COUNT(Orders.OrderNo) AS OrderCount
FROM Tables
LEFT JOIN Customers ON Tables.CustomerID = Customers.CustomerID
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Tables.TableNo, Customers.Name;


--Find the highest amount spent by a customer on a single order.

select Customers.Name, max(Orders.Amount) as HighestOrder from Customers
left join Orders on Customers.CustomerID = Customers.CustomerID
group by Customers.Name;


--List all orders along with their applicable discount.

select Orders.OrderNo, Orders.OrderDate, Orders.Amount, DiscVoucher.Discount from Orders
left join DiscVoucher on Orders.Amount between DiscVoucher.UptoAmount and DiscVoucher.FromAmount;


--Find all customers who have occupied a table but have not placed any orders.

select Customers.Name from Customers 
left join [Tables] on Customers.CustomerID = [Tables].CustomerID
left join Orders on [Tables].CustomerID = Orders.CustomerID
where Orders.OrderNo is null and Customers.CustomerID is not null;

--List the total number of orders placed by each customer.

select Customers.Name, sum(Orders.OrderNo) as TotalNumberOfOrder from Orders
left join Customers on Orders.CustomerID = Customers.CustomerID
group by Customers.Name;

--Find the average amount spent per order by VIP customers.

select avg(Orders.Amount) as averageAmount from Orders
left join Customers on Orders.CustomerID = Customers.CustomerID 
left join customerType on Customers.CustomerTypeID = customerType.CustomerTypeID
where customerType.Name = 'VIP';

--List all customers along with their orders and applicable discounts.

select Customers.Name, Orders.OrderNo, Orders.Amount,DiscVoucher.Discount from Customers
left join Orders on Customers.CustomerID = Orders.CustomerID
left join DiscVoucher on Orders.Amount between DiscVoucher.FromAmount and DiscVoucher.UptoAmount;

--Find all orders that have no applicable discount.

select Orders.OrderNo, Orders.OrderDate, Orders.Amount from Orders
left join DiscVoucher on Orders.Amount between DiscVoucher.FromAmount and DiscVoucher.UptoAmount
where DiscVoucher.Discount is null;

SELECT Orders.OrderNo, Orders.OrderDate, Orders.Amount
FROM Orders
LEFT JOIN DiscVoucher ON Orders.Amount BETWEEN DiscVoucher.FromAmount AND DiscVoucher.UptoAmount
WHERE DiscVoucher.Discount IS NULL;

/*
List all tables that are occupied by VIP customers.
Find the total number of tables occupied by each customer type.
List all customers along with their most recent order date.
Find all orders placed by customers who are not assigned a customer type.
List all customers along with their customer type and the total amount they have spent on orders.
Find the number of orders placed on each date.
List all VIP customers and their orders along with the applicable discount.
Find the total amount spent by each customer type.
List all orders along with the customer name and the table number where the customer is sitting.
Find all orders where the discount is more than 10%.

*/