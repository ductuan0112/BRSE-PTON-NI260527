CREATE TABLE products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50),
    price INT NOT NULL
);

INSERT INTO products (product_name, category, price)
VALUES
    ('Dell Inspiron 15', 'Laptop', 15000000),
    ('MacBook Air M2', 'Laptop', 28000000),
    ('Asus Vivobook 15', 'Laptop', 18000000),
    ('HP Pavilion 14', 'Laptop', 20000000),
    ('iPhone 15', 'Phone', 22000000),
    ('Samsung Galaxy S24', 'Phone', 19000000),
    ('Xiaomi 14', 'Phone', 16000000),
    ('iPad Air M2', 'Tablet', 21000000),
    ('Samsung Galaxy Tab S9', 'Tablet', 17000000),
    ('Lenovo ThinkPad E14', 'Laptop', 24000000);
    
SELECT *
FROM products;

SELECT *
FROM products
WHERE price > (
	SELECT AVG(price)
    FROM products
);
    
SELECT *
FROM products p1
WHERE price = (
	SELECT MAX(price)
    FROM products p2
    WHERE p1.category = p2.category
);

SELECT *
FROM products
WHERE category IN (
	SELECT category 
    FROM products
    WHERE price > 20000000
);