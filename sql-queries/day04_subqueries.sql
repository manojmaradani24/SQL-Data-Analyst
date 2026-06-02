-- Display products having price greater than average price

SELECT *
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
);

-- Display products having price less than average price

SELECT *
FROM products
WHERE price <
(
    SELECT AVG(price)
    FROM products
);

-- Find product with highest price

SELECT *
FROM products
WHERE price =
(
    SELECT MAX(price)
    FROM products
);

-- Find product with lowest price

SELECT *
FROM products
WHERE price =
(
    SELECT MIN(price)
    FROM products
);

-- Display customers who placed orders

SELECT *
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
);

-- Display customers who never placed orders

SELECT *
FROM customers
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM orders
);

-- Display products that were ordered

SELECT *
FROM products
WHERE product_id IN
(
    SELECT product_id
    FROM order_items
);

-- Display products that were never ordered

SELECT *
FROM products
WHERE product_id NOT IN
(
    SELECT product_id
    FROM order_items
);

-- Find stores that handled orders

SELECT *
FROM stores
WHERE store_id IN
(
    SELECT store_id
    FROM orders
);

-- Display categories having products

SELECT *
FROM categories
WHERE category_id IN
(
    SELECT category_id
    FROM products
);

-- Find products belonging to category with ID 1

SELECT *
FROM products
WHERE category_id =
(
    SELECT category_id
    FROM categories
    WHERE category_id = 1
);

-- Display customers from same city as customer 1

SELECT *
FROM customers
WHERE city =
(
    SELECT city
    FROM customers
    WHERE customer_id = 1
);

-- Find products costing more than cheapest product

SELECT *
FROM products
WHERE price >
(
    SELECT MIN(price)
    FROM products
);

-- Find products costing less than costliest product

SELECT *
FROM products
WHERE price <
(
    SELECT MAX(price)
    FROM products
);

-- Display orders placed by customers from Hyderabad

SELECT *
FROM orders
WHERE customer_id IN
(
    SELECT customer_id
    FROM customers
    WHERE city = 'Hyderabad'
);