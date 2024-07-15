--Show the all database

	SELECT name 
	FROM sys.databases;

    use Northwind;

--Write an SQL query to retrieve all tables from northwind database.

	SELECT TABLE_NAME 
	FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_TYPE = 'BASE TABLE';

--Write an SQL query to retrieve all columns and rows from the employees table.

   select * from employees;

--Write an SQL query to retrieve all columns and rows from the categories table.

   select * from categories;

--Write an SQL query to retrieve all columns and rows from the Customers table.

   select * from Customers;

--Write an SQL query to retrieve all columns and rows from the Shippers table.

   select * from Shippers;

--Write an SQL query to retrieve all columns and rows from the Suppliers table.

   select * from Suppliers;

--Write an SQL query to retrieve all columns and rows from the Orders table.

   select * from Orders;

--Write an SQL query to retrieve all columns and rows from the Products table.

   select * from Products;

--Write an SQL query to retrieve all columns and rows from the Order Details table.

   select * from [Order Details];

--Write an SQL query to retrieve all columns and rows from the CustomerCustomerDemo table.

   select * from CustomerCustomerDemo;

--Write an SQL query to retrieve all columns and rows from the Region table.

   select * from Region;

--Write an SQL query to retrieve all columns and rows from the Territories table.

   select * from Territories;

--Write an SQL query to retrieve all columns and rows from the EmployeeTerritories table.

   select * from EmployeeTerritories;

--1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.

	select CategoryName, [Description] from Categories
	order by CategoryName;

 --2.Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers
 --table sorted by Phone. 

	 select ContactName, CompanyName, ContactTitle, Phone from Customers
	 order by Phone;

 --3.Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and 
 --Lastname respectively and HireDate from the employees table sorted from the newest to the oldest employee. 

	 select upper(FirstName) as [First Name], 
			upper(LastName) as [Last Name], 
			HireDate from Employees
			order by HireDate desc;

 --4.Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by 
 --Freight in descending order.

	 select top 10(OrderID), OrderDate, ShippedDate, CustomerID, Freight from Orders
	 order by Freight desc;

 --5.Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table. 
 
     select lower(CustomerID) as ID from Customers;

 --6.Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by 
 --the Country in descending order then by CompanyName in ascending order. 

	 select CompanyName, Fax, Phone, Country, HomePage from Suppliers 
	 order by Country desc, CompanyName asc;

 --7.Create a report that shows CompanyName, ContactNameof all customers from ‘Buenos Aires' only. 

	 select CompanyName, ContactName from Customers
	 where City ='Buenos Aires';

-- 8.Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock. 
 
	 select ProductName, UnitPrice, QuantityPerUnit from Products 
	 where UnitsInStock = 0;

 --9.Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain. 

	 select ContactName, Address, City from Customers 
	 where Country != 'Germany' or Country != 'Mexico' or Country != 'Spain';

 --10.Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996. 

	 select OrderDate, ShippedDate, CustomerID, Freight from Orders 
	 where ShippedDate ='1996-08-14';

 --11.Create a report showing FirstName, LastName, Country from the employees not from United States. 

	 select FirstName, LastName, Country from Employees
	 where Country !='USA';

-- 12.Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later 
--than the required date. 

	select EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from Orders
	where RequiredDate<ShippedDate;

--13.Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B. 

	select City, CompanyName, ContactName from Customers
	where city like 'a%' or City like 'b%';

--14.Create a report showing all the even numbers of OrderID from the orders table. 

	select OrderID from Orders
	where OrderID % 2 = 0;

--15.Create a report that shows all the orders where the freight cost more than $500. 

	select Freight from Orders
	where Freight>500;

--16.Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder. 

	select ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel from Products 
	where UnitsInStock != 0;

--17.Create a report that shows the CompanyName, ContactName number of all customer that have no fax number. 

	select CompanyName, ContactName, Fax from Customers
	where Fax is null;


--18.Create a report that shows the FirstName, LastName of all employees that do not report to anybody. 

	select FirstName,LastName from Employees 
	where ReportsTo is null;

--19.Create a report showing all the odd numbers of OrderID from the orders table. 

	select OrderID from Orders
	where OrderID % 2 =1;

--20.Create a report that shows the CompanyName, ContactName, Fax of all customers 
--that do not have Fax number and sorted by ContactName. 

	select CompanyName, ContactName, Fax from Customers
	where Fax is not null order by ContactName;

--21.Create a report that shows the City, CompanyName, ContactName of customers from cities that has 
--letter L in the name sorted by ContactName. 

	select City, CompanyName, ContactName from Customers 
	where City like 'l%' 
	order by ContactName;

--22.Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s. 

	 select FirstName, LastName, BirthDate from Employees 
	 where datepart(year, BirthDate) between 1950 and 1959;

--23.Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table. 

     select FirstName, LastName, DATEPART(year, BirthDate) as YEAR from Employees;

--24.Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped 
--by OrderID and sorted by NumberofOrders in descending order.HINT: you will need to use a Groupby statement. 

	select OrderID, COUNT(OrderID) as NumberofOrders from [Order Details]
	group by OrderID
	order by NumberofOrders desc;


--25.Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, 
--Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID 

select SupplierID, ProductName, compa from Products;

--26.Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all 
--orders with ShipPostalCode beginning with "98124".

	select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress from Orders
	where ShipPostalCode like '98124%';

--27.Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has 
--no "Sales" in their ContactTitle. 

	select ContactName, ContactTitle, CompanyName from Customers 
	where ContactTitle  not like '%Sales%';

--28.Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle"; 

	select FirstName, LastName, City from Employees 
	where City != 'Seattle';

--29.Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city 
--in Mexico or other cities in Spain other than Madrid. 

	select CompanyName,ContactTitle, City, Country from Customers 
	where Country in ('Spain','Madrid') and city not like 'Mexico';

--30.	Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet 
--in their Contactname.

    select ContactName from Customers where ContactName not like '_a%'; 

--31.	Create a report that shows the average UnitPrice rounded to the next whole number, total number of UnitsInStock 
--and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.

select * from Products;

--Stored Procedure

-- show all tables 

create procedure ShowAllTables
as
begin
 select table_name from INFORMATION_SCHEMA.TABLES
 where TABLE_TYPE = 'base table';
end;

exec ShowAllTables;

-- Write a stored procedure that retrieves all orders for a given customer ID. The customer ID should be passed as a parameter.

create procedure getCustomerOrder
     @CustomerID nchar(5)
as
begin
  select * from Orders
  where CustomerID = @CustomerID
end;

exec getCustomerOrder @CustomerID = 'VINET';


--Create a stored procedure that retrieves the order details 
--for a given order ID and product ID. Both the order ID and product ID should be passed as parameters.

create procedure GetOrderDetails
    @OrderID int,  
	@ProductID int
as
begin
   select * from [Order Details]
   where OrderID = @OrderID and ProductID = @ProductID 
end;

exec GetOrderDetails @OrderID = 10544 , @ProductID = 5;

select * from Orders;
select * from Products;