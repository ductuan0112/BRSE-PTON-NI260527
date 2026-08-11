CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    status VARCHAR(20)
);

CREATE TABLE products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT
);

CREATE TABLE order_items (
	order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);