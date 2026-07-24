create database Customers;
use Customers;

-- ================================
--  Create int Customers 
-- ==================================


CREATE TABLE Customers ( 
    customer_id INT PRIMARY KEY, 
    customer_name VARCHAR(50), 
    city VARCHAR(30) 
); 
 
INSERT INTO Customers VALUES 
(101,'Amit','Delhi'), 
(102,'Priya','Bangalore'), 
(103,'Rahul','Mumbai'), 
(104,'Sneha','Hyderabad'), 
(105,'Karan','Pune'); 

-- ==================================================
--                       Orders 
-- ==================================================

CREATE TABLE Orders ( 
    order_id INT PRIMARY KEY, 
    customer_id INT, 
    order_date DATE, 
    amount DECIMAL(10,2) 
); 
 
INSERT INTO Orders VALUES 
(1001,101,'2026-07-01',4500), 
(1002,102,'2026-07-03',1200), 
(1003,101,'2026-07-05',800), 
(1004,104,'2026-07-08',2500); 

-- ================================================
-- Products 
-- =================================================

CREATE TABLE Products ( 
    product_id INT PRIMARY KEY, 
    product_name VARCHAR(50), 
    price DECIMAL(10,2) 
); 
 
INSERT INTO Products VALUES 
(1,'Laptop',65000), 
(2,'Mouse',500), 
(3,'Keyboard',1200), 
(4,'Monitor',15000); 

-- ================================================
--  Order_Items  
-- =================================================

CREATE TABLE Order_Items ( 
    order_id INT, 
    product_id INT, 
    quantity INT 
); 
 
INSERT INTO Order_Items VALUES 
(1001,1,1), 
(1001,2,2), 
(1002,3,1), 
(1003,2,1), 
(1004,4,2);


-- ================================================
--  Employees   
-- =================================================



CREATE TABLE Employees ( 
    emp_id INT PRIMARY KEY, 
    emp_name VARCHAR(40), 
    manager_id INT 
); 
 
INSERT INTO Employees VALUES 
(1,'John',NULL), 
(2,'David',1), 
(3,'Alice',1), 
(4,'Mark',2), 
(5,'Sophia',2); 

-- 1. Display customer name with their order ID. 
select  customer_name  order_id from  customers c inner join Orders o on c.customer_id = o.customer_id;


-- 2. Display customer name, order date, and amount. 
select  c.customer_name,  o.order_id ,o.order_date, o.amount  from  customers c Right join Orders o on c.customer_id = o.customer_id;


-- 3. Show products purchased in each order. 
select p.product_name, o.order_id from Order_Items o Inner join Products  p on p. product_id = o. product_id order by o. order_id;

-- 4. Display order ID, product name, quantity, and price. 
select o.order_id, p.product_name, o.quantity, p.price   from Order_Items o Inner join Products  p on p. product_id = o. product_id order by o. order_id;


-- 5. Find total value of each ordered product.
select o.order_id, p.product_name, o.quantity, p.price, ( o.quantity*p.price) as total_amount   from Order_Items o Inner join Products  p on p. product_id = o. product_id order by o. order_id;


-- 6. Display all customers and their orders. 
select  customer_name  order_id from  customers c left join Orders o on c.customer_id = o.customer_id;


-- 7. Find customers who never placed any order. 
select  c.customer_name , o.order_id from  customers c
 left join Orders o on c.customer_id = o.customer_id 
 where o.order_id is null;


-- 8. Display customers with total number of orders. 
select  c.customer_name , count( o.order_id ) from customers c
 left join Orders o on c.customer_id = o.customer_id group by c.customer_name;
;

-- 9. Show every customer even if they have no purchase. 
select  c.customer_name , o.order_id from  customers c
 left join Orders o on c.customer_id = o.customer_id ;

-- 10. Find cities where customers haven't ordered anythin
select  c.city from  customers c
 left join Orders o on c.customer_id = o.customer_id 
 group by c.city having count( o.order_id) = 0;
 
 -- 11. Display all orders along with customer names.
 select  c.customer_name,  o.order_id ,o.order_date, o.amount  from  customers c Right join Orders o on c.customer_id = o.customer_id;


-- 12. Find orders whose customer information is missing. 
select    o.order_id 
 from  customers c Right join Orders o on c.customer_id = o.customer_id
 where c.customer_id is null;


-- 13. Show every order whether customer exists or not. 
select    o.order_id 
 from  customers c Right join Orders o on c.customer_id = o.customer_id;
 
 
 -- 14. Generate all possible Customer–Product combinations. 
 select * from customers cross join products;

-- 15. Count total possible combinations. 
 select count(*) from customers cross join products;

-- 16. Display first 10 combinations.  
 select * from customers cross join products limit 10;
 

 -- 17. Display employee names with their managers. 
 Select r.manager_id, e.emp_name  from employees e cross join employees r where e.manager_id  is not NUll and r.manager_id  is not NUll ;


-- 18. Find employees reporting to John. 
Select r.manager_id, e.emp_name  from employees e inner join employees r on e.manager_id =r.emp_id where e.manager_id = ( Select  emp_id from employees  where emp_name='john');

 Select  e.emp_name  from employees e where manager_id = ( Select  emp_id from employees  where emp_name='john');


-- 19. Find employees under manager David. 
 Select  e.emp_name  from employees e where manager_id = ( Select  emp_id from employees  where emp_name='David');

Select r.manager_id, e.emp_name  from employees e inner join employees r on e.manager_id =r.emp_id
 where e.manager_id = ( Select  emp_id from employees  where emp_name='David');

-- 20. Display employees without managers. 
 Select r.manager_id, e.emp_name  from employees e cross join employees r where e.manager_id  is  NUll and r.manager_id  is  NUll ;


-- 21. Display Customer → Order → Product. 
select * from customers c inner join orders o on c.customer_id =o.customer_id inner join  Order_Items oi on oi.order_id =o.order_id inner join Products  p on p.product_id = oi.product_id order by  c.customer_id;

-- 22. Display customer name, order date, product name, quantity. 
select c.customer_name , o.order_date,  p.product_name from customers c
 inner join orders o on c.customer_id =o.customer_id 
 inner join  Order_Items oi on oi.order_id =o.order_id 
 inner join Products  p on p.product_id = oi.product_id 
 order by  c.customer_id;

-- 23. Find total bill amount of every order. 
select order_id , amount from orders ;
select sum(amount) from orders;

-- 24. Display products purchased by Amit.
select c.customer_name , o.order_date,  p.product_name from customers c
 inner join orders o on c.customer_id =o.customer_id 
 inner join  Order_Items oi on oi.order_id =o.order_id 
 inner join Products  p on p.product_id = oi.product_id 
where  c.customer_name  = 'Amit';

-- 25. Display customers who purchased Mouse.
 select c.customer_name , o.order_date,  p.product_name from customers c
 inner join orders o on c.customer_id =o.customer_id 
 inner join  Order_Items oi on oi.order_id =o.order_id 
 inner join Products  p on p.product_id = oi.product_id 
where   p.product_name  = 'mouse';

-- 26. Display Customer, Order, Product, Quantity, Price. 
 select c.customer_name , o.order_id,  p.product_name, oi.quantity,p.price  from customers c
 inner join orders o on c.customer_id =o.customer_id 
 inner join  Order_Items oi on oi.order_id =o.order_id 
 inner join Products  p on p.product_id = oi.product_id ;


-- 27. Calculate total amount for every order. 
 select order_id , amount from orders ;

-- 28. Find highest value order. 
select  max(amount) from orders  ;

