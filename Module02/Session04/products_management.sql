CREATE TABLE products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL
);

INSERT INTO products (product_name, category, price, quantity)
VALUES
    ('Dell Inspiron 15', 'Laptop', 13000000, 10),
    ('MacBook Air M2', 'Laptop', 25000000, 5),
    ('iPhone 15', 'Phone', 12000000, 0),
    ('Samsung Galaxy S24', 'Phone', 15000000, 12),
    ('Logitech Mouse', 'Accessory', 500000, 30);

SELECT * FROM products;

SELECT * 
FROM products 
WHERE price BETWEEN 5000000 AND 15000000;

SELECT *
FROM products
WHERE category IN ('Laptop', 'Phone');

SELECT *
FROM products
WHERE product_name LIKE 'Sam%';

SELECT *
FROM products
WHERE NOT category = 'Phone';

UPDATE products
SET price = price * 0.95
WHERE category = 'Laptop';

DELETE FROM products
WHERE quantity = 0;

