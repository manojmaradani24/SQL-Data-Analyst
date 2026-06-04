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

