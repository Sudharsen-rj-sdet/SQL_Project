create database project_10;
use project_10;
-- create table sales 
-- here product id is foreign key which refers to products table 

CREATE TABLE Sales (
 sale_id INT PRIMARY KEY,
 product_id INT,
 quantity_sold INT,
 sale_date DATE,
 total_price DECIMAL(10, 2),
 FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
-- insert values into sales 
INSERT INTO Sales (sale_id, product_id, quantity_sold, sale_date, total_price) VALUES
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 2, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);



-- create table products 
drop table Products;
CREATE TABLE Products (
 product_id INT PRIMARY KEY,
 product_name VARCHAR(100),
 category VARCHAR(50),
 unit_price DECIMAL(10, 2)
);
-- insert the values inside products table 
INSERT INTO Products (product_id, product_name, category, unit_price) VALUES
(101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphones', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 15.00);

-- display overall data from products 
select * from products;

-- display overall data from sales 
select * from sales;

-- query 1

use project_10;
DELIMITER //
CREATE PROCEDURE Update_Unit_Price_1(
    IN p_product_id INT,
    IN p_new_price DECIMAL(10,2)
)
BEGIN
    UPDATE Products 
    set  unit_price = p_new_price
    where product_id=p_product_id;
    
END //
delimiter ;
call Update_Unit_price_1(102,633.00);
call Update_Unit_price_1(105,69.00);
select product_id, unit_price from Products;

-- query 2 

select p.product_name, p.category,s.total_price as revenue_generated 
from products p inner join sales s 
where p.product_id = s.product_id and s.sale_date LIKE '2024%';


