create database TestDB;

use TestDB;

SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';

create table Employees(
emp_id int,
emp_name nvarchar(100),
emp_joining_date date,
emp_position nvarchar(100)
);

INSERT INTO Employees (emp_id, emp_name, emp_joining_date, emp_position)
VALUES 
(1, 'Aarav Patel', '2021-01-10', 'Software Engineer'),
(2, 'Vivaan Sharma', '2021-02-15', 'Project Manager'),
(3, 'Aditya Singh', '2021-03-20', 'QA Engineer'),
(4, 'Vihaan Gupta', '2021-04-25', 'Business Analyst'),
(5, 'Krishna Kumar', '2021-05-30', 'Software Engineer'),
(6, 'Arjun Nair', '2021-06-15', 'HR Manager'),
(7, 'Sai Kiran', '2021-07-20', 'Data Analyst'),
(8, 'Reyansh Mehta', '2021-08-25', 'Network Engineer'),
(9, 'Ayaan Rao', '2021-09-30', 'Software Engineer'),
(10, 'Ishaan Joshi', '2021-10-15', 'System Administrator'),
(11, 'Arnav Yadav', '2021-11-20', 'Database Administrator'),
(12, 'Atharv Reddy', '2021-12-25', 'DevOps Engineer'),
(13, 'Aryan Iyer', '2022-01-10', 'Software Engineer'),
(14, 'Kabir Nair', '2022-02-15', 'Business Analyst'),
(15, 'Kian Kapoor', '2022-03-20', 'Project Manager'),
(16, 'Shaurya Khanna', '2022-04-25', 'Software Engineer'),
(17, 'Ayaan Jain', '2022-05-30', 'Network Engineer'),
(18, 'Rudra Agarwal', '2022-06-15', 'QA Engineer'),
(19, 'Aarush Kapoor', '2022-07-20', 'Data Analyst'),
(20, 'Hrithik Saxena', '2022-08-25', 'Software Engineer'),
(21, 'Parth Thakur', '2022-09-30', 'HR Manager'),
(22, 'Arnav Verma', '2022-10-15', 'System Administrator'),
(23, 'Arjun Reddy', '2022-11-20', 'Database Administrator'),
(24, 'Anirudh Shah', '2022-12-25', 'Software Engineer'),
(25, 'Dhruv Bansal', '2023-01-10', 'DevOps Engineer'),
(26, 'Madhav Dubey', '2023-02-15', 'Project Manager'),
(27, 'Pranav Chandra', '2023-03-20', 'QA Engineer'),
(28, 'Advait Rao', '2023-04-25', 'Network Engineer'),
(29, 'Ayaan Sinha', '2023-05-30', 'Software Engineer'),
(30, 'Vihaan Mishra', '2023-06-15', 'Business Analyst'),
(31, 'Nirvaan Patel', '2023-07-20', 'Data Analyst'),
(32, 'Devansh Ghosh', '2023-08-25', 'Software Engineer'),
(33, 'Samarth Menon', '2023-09-30', 'HR Manager'),
(34, 'Aarav Das', '2023-10-15', 'System Administrator'),
(35, 'Veer Malhotra', '2023-11-20', 'Database Administrator'),
(36, 'Ishaan Singh', '2023-12-25', 'Software Engineer'),
(37, 'Reyansh Desai', '2024-01-10', 'DevOps Engineer'),
(38, 'Vivaan Raj', '2024-02-15', 'Project Manager'),
(39, 'Aditya Bhat', '2024-03-20', 'QA Engineer'),
(40, 'Arjun Naik', '2024-04-25', 'Network Engineer'),
(41, 'Krishna Prasad', '2024-05-30', 'Software Engineer'),
(42, 'Arnav Shetty', '2024-06-15', 'Business Analyst'),
(43, 'Rudra Kulkarni', '2024-07-20', 'Data Analyst'),
(44, 'Vihaan Menon', '2024-08-25', 'Software Engineer'),
(45, 'Sai Joshi', '2024-09-30', 'HR Manager'),
(46, 'Aarush Reddy', '2024-10-15', 'System Administrator'),
(47, 'Arnav Sharma', '2024-11-20', 'Database Administrator'),
(48, 'Advait Singh', '2024-12-25', 'Software Engineer'),
(49, 'Dhruv Kumar', '2025-01-10', 'DevOps Engineer'),
(50, 'Madhav Sinha', '2025-02-15', 'Project Manager');

/* List all employees.*/

select * from employees;

/* Find employees who joined after January 1, 2023.*/

select * from employees where emp_joining_date > '2023-01-01';


/* Count the number of employees in each position.*/

select emp_position , count(*) as emp_count
from employees
group by emp_position;

/* Find employees with the position "Software Engineer." */

select * from employees where emp_position = 'software engineer';

/* Get the names of employees who joined in 2022. */

select * from employees where year (emp_joining_date) = '2022';

/* List employees in alphabetical order by name. */

select * from employees order by emp_name;

/* Find the earliest joining date. */

select min(emp_joining_date) as earlist_joining_date from employees;

/* Find the latest joining date. */

select max(emp_joining_date) as latest_joining_date from employees;

--List employees with names starting with 'A.'

select * from employees where emp_name like 'A%';

--Find the total number of employees.

select count(*) from employees;  

--Find employees who are in the "HR Manager" or "Project Manager" positions.

select * from employees where emp_position in('HR Manager','Project Manager');

--List employees ordered by their joining date in descending order.

select * from employees order by emp_joining_date desc;

--Get the average length of employee names.

select avg(len(emp_name)) as employee_name_avg_length from employees; 

--Find employees who joined in the month of January, irrespective of the year.

select * from employees where month(emp_joining_date)=1;

--Count the numbekr of employees whose names contain the substring 'an'. 

select COUNT(*) as name_contain_an from employees where emp_name like '%an%';