CREATE TABLE products (
 product_id INT PRIMARY KEY,
 product_name VARCHAR(50) NOT NULL,
 price INT NOT NULL CHECK (price > 0),
 stock INT NOT NULL
);