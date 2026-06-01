-- Display customers along with their orders

SELECT c.customer_id,
       c.customer_name,
       o.order_id,
       o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- Display orders along with store details

SELECT o.order_id,
       s.store_name,
       s.city,
       o.order_date
FROM orders o
INNER JOIN stores s
ON o.store_id = s.store_id;

-- Display products along with category details

SELECT p.product_name,
       c.category_name,
       p.price
FROM products p
INNER JOIN categories c
ON p.category_id = c.category_id;

-- Display customer names and order dates

SELECT c.customer_name,
       o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- Display store names and order IDs

SELECT s.store_name,
       o.order_id
FROM stores s
INNER JOIN orders o
ON s.store_id = o.store_id;

-- Display order details with product names

SELECT oi.order_id,
       p.product_name,
       oi.quantity
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id;

-- Display all customers and their orders

SELECT c.customer_name,
       o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Display all products with category names

SELECT p.product_name,
       c.category_name
FROM products p
LEFT JOIN categories c
ON p.category_id = c.category_id;

-- Display customer, order and store information

SELECT c.customer_name,
       o.order_id,
       s.store_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN stores s
ON o.store_id = s.store_id;

-- Display product, category and order quantity

SELECT p.product_name,
       c.category_name,
       oi.quantity
FROM products p
INNER JOIN categories c
ON p.category_id = c.category_id
INNER JOIN order_items oi
ON p.product_id = oi.product_id;

-- Find customers who placed orders in Hyderabad store

SELECT c.customer_name,
       s.store_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN stores s
ON o.store_id = s.store_id
WHERE s.city = 'Hyderabad';

-- Display products ordered by each customer

SELECT c.customer_name,
       p.product_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id;

-- Display category-wise products sold

SELECT c.category_name,
       p.product_name,
       oi.quantity
FROM categories c
INNER JOIN products p
ON c.category_id = p.category_id
INNER JOIN order_items oi
ON p.product_id = oi.product_id;

-- Find total orders handled by each store

SELECT s.store_name,
       COUNT(o.order_id) AS total_orders
FROM stores s
INNER JOIN orders o
ON s.store_id = o.store_id
GROUP BY s.store_name;

-- Display complete order summary

SELECT o.order_id,
       c.customer_name,
       p.product_name,
       oi.quantity,
       o.order_date
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id;