CREATE TABLE products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50),
    price INT NOT NULL
);

INSERT INTO products (product_name, product_type, price)
VALUES
    ('Dell Inspiron 15', 'Laptop', 15000000),
    ('MacBook Air M2', 'Laptop', 28000000),
    ('Asus Vivobook 15', 'Laptop', 18000000),
    ('iPhone 15', 'Phone', 22000000),
    ('Samsung Galaxy S24', 'Phone', 19000000),
    ('Xiaomi 14', 'Phone', 16000000),
    ('iPad Air M2', 'Tablet', 21000000),
    ('Samsung Galaxy Tab S9', 'Tablet', 17000000),
    ('Lenovo ThinkPad E14', 'Laptop', 24000000),
    ('Google Pixel 8', 'Phone', 20000000);
    

CREATE INDEX idx_category_price
ON products(category, price);

EXPLAIN
SELECT *
FROM products
WHERE category = 'Phone' 
	AND price BETWEEN 18000000 AND 25000000;
