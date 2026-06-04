-- Assign row numbers to products based on price

SELECT product_name,
       price,
       ROW_NUMBER() OVER(ORDER BY price DESC) AS row_num
FROM products;

-- Rank products based on price

SELECT product_name,
       price,
       RANK() OVER(ORDER BY price DESC) AS product_rank
FROM products;

-- Dense rank products based on price

SELECT product_name,
       price,
       DENSE_RANK() OVER(ORDER BY price DESC) AS dense_rank
FROM products;

-- Display previous product price

SELECT product_name,
       price,
       LAG(price) OVER(ORDER BY price) AS previous_price
FROM products;

-- Display next product price

SELECT product_name,
       price,
       LEAD(price) OVER(ORDER BY price) AS next_price
FROM products;
-- Number customers city wise

SELECT customer_name,
       city,
       ROW_NUMBER() OVER(PARTITION BY city) AS city_row
FROM customers;

-- Rank customers by join date

SELECT customer_name,
       join_date,
       RANK() OVER(ORDER BY join_date) AS join_rank
FROM customers;

-- Find cumulative product price

SELECT product_name,
       price,
       SUM(price) OVER(ORDER BY price) AS running_total
FROM products;

-- Find average product price using window function

SELECT product_name,
       price,
       AVG(price) OVER() AS avg_price
FROM products;

-- Find highest product price using window function

SELECT product_name,
       price,
       MAX(price) OVER() AS highest_price
FROM products;

-- Find lowest product price using window function

SELECT product_name,
       price,
       MIN(price) OVER() AS lowest_price
FROM products;

-- Count customers city wise using window function

SELECT customer_name,
       city,
       COUNT(*) OVER(PARTITION BY city) AS city_count
FROM customers;

-- Rank stores by number of orders

SELECT store_id,
       COUNT(*) AS total_orders,
       RANK() OVER(ORDER BY COUNT(*) DESC) AS store_rank
FROM orders
GROUP BY store_id;

-- Display running quantity sold

SELECT product_id,
       quantity,
       SUM(quantity) OVER(ORDER BY product_id) AS running_quantity
FROM order_items;

-- Display order sequence

SELECT order_id,
       order_date,
       ROW_NUMBER() OVER(ORDER BY order_date) AS order_sequence
FROM orders; i want to add remaining 
