-- Display all customer records

SELECT *
FROM customers;

-- Display all product records

SELECT *
FROM products;

-- Show customer names and email addresses

SELECT customer_name,email
FROM customers;

-- Find all unique cities where customers live

SELECT DISTINCT city
FROM customers;

-- Display customers from Hyderabad

SELECT *
FROM customers
WHERE city='Hyderabad';

-- Display products costing more than 5000

SELECT *
FROM products
WHERE price>5000;

-- Show products from highest price to lowest price

SELECT *
FROM products
ORDER BY price DESC;

-- Show products from lowest price to highest price

SELECT *
FROM products
ORDER BY price ASC;

-- Display first 3 customer records

SELECT *
FROM customers
LIMIT 3;

-- Display products belonging to category 1 and 2

SELECT *
FROM products
WHERE category_id IN(1,2);