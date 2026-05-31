-- Find total number of customers

SELECT COUNT(*) AS total_customers
FROM customers;

-- Find total number of products

SELECT COUNT(*) AS total_products
FROM products;

-- Find total value of all products

SELECT SUM(price) AS total_product_value
FROM products;

-- Find average product price

SELECT AVG(price) AS average_product_price
FROM products;

-- Find highest product price

SELECT MAX(price) AS highest_product_price
FROM products;

-- Find lowest product price

SELECT MIN(price) AS lowest_product_price
FROM products;

-- Count customers city-wise

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- Count products category-wise

SELECT category_id,
       COUNT(*) AS total_products
FROM products
GROUP BY category_id;

-- Find average product price category-wise

SELECT category_id,
       AVG(price) AS average_price
FROM products
GROUP BY category_id;

-- Find total product value category-wise

SELECT category_id,
       SUM(price) AS total_value
FROM products
GROUP BY category_id;

-- Find highest priced product in each category

SELECT category_id,
       MAX(price) AS highest_price
FROM products
GROUP BY category_id;

-- Find lowest priced product in each category

SELECT category_id,
       MIN(price) AS lowest_price
FROM products
GROUP BY category_id;

-- Show cities having more than one customer

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;

-- Show categories having more than one product

SELECT category_id,
       COUNT(*) AS total_products
FROM products
GROUP BY category_id
HAVING COUNT(*) > 1;

-- Display cities sorted by customer count

SELECT city,
       COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;