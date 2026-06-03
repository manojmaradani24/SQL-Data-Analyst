-- Create view for customer details

CREATE VIEW customer_details AS
SELECT customer_id,
       customer_name,
       city
FROM customers;

-- Display view data

SELECT *
FROM customer_details;

-- Create view for product details

CREATE VIEW product_details AS
SELECT product_id,
       product_name,
       price
FROM products;

-- Display product view

SELECT *
FROM product_details;

-- Create view for order details

CREATE VIEW order_details AS
SELECT order_id,
       customer_id,
       store_id,
       order_date
FROM orders;

-- Display order view

SELECT *
FROM order_details;

-- Find products above average price using CTE

WITH avg_price AS
(
    SELECT AVG(price) AS avg_cost
    FROM products
)
SELECT *
FROM products
WHERE price >
(
    SELECT avg_cost
    FROM avg_price
);

-- Find products below average price using CTE

WITH avg_price AS
(
    SELECT AVG(price) AS avg_cost
    FROM products
)
SELECT *
FROM products
WHERE price <
(
    SELECT avg_cost
    FROM avg_price
);

-- Display customer count city wise using CTE

WITH city_count AS
(
    SELECT city,
           COUNT(*) AS total_customers
    FROM customers
    GROUP BY city
)
SELECT *
FROM city_count;

-- Display category wise product count using CTE

WITH category_count AS
(
    SELECT category_id,
           COUNT(*) AS total_products
    FROM products
    GROUP BY category_id
)
SELECT *
FROM category_count;

-- Display stores having orders using CTE

WITH store_orders AS
(
    SELECT store_id,
           COUNT(*) AS total_orders
    FROM orders
    GROUP BY store_id
)
SELECT *
FROM store_orders;

-- Find highest priced product using CTE

WITH highest_price AS
(
    SELECT MAX(price) AS max_price
    FROM products
)
SELECT *
FROM products
WHERE price =
(
    SELECT max_price
    FROM highest_price
);

-- Find lowest priced product using CTE

WITH lowest_price AS
(
    SELECT MIN(price) AS min_price
    FROM products
)
SELECT *
FROM products
WHERE price =
(
    SELECT min_price
    FROM lowest_price
);

-- Display customers who placed orders using CTE

WITH ordered_customers AS
(
    SELECT DISTINCT customer_id
    FROM orders
)
SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM ordered_customers
);

-- Display products that were sold using CTE

WITH sold_products AS
(
    SELECT DISTINCT product_id
    FROM order_items
)
SELECT *
FROM products
WHERE product_id IN
(
    SELECT product_id
    FROM sold_products
);

-- Display order count by customer using CTE

WITH customer_orders AS
(
    SELECT customer_id,
           COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_orders;

-- Display total quantity sold by product using CTE

WITH product_sales AS
(
    SELECT product_id,
           SUM(quantity) AS total_quantity
    FROM order_items
    GROUP BY product_id
)
SELECT *
FROM product_sales;