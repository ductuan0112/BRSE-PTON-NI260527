CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_name)
VALUES
    ('Nguyen Van An'),
    ('Tran Thi Binh'),
    ('Le Van Cuong'),
    ('Pham Thi Dung'),
    ('Hoang Van Em');
    
INSERT INTO orders (order_date, customer_id)
VALUES
    ('2026-08-20', 1),
    ('2026-08-20', 2),
    ('2026-08-21', 1),
    ('2026-08-21', 3),
    ('2026-08-22', 4);
    
INSERT INTO order_items
    (order_id, customer_id, product_name, quantity, price)
VALUES
    (1, 1, 'Laptop Dell', 1, 15000000),
    (1, 1, 'Mouse Logitech', 2, 500000),

    (2, 2, 'iPhone 15', 1, 22000000),
    (2, 2, 'Phone Case', 2, 300000),

    (3, 1, 'Keyboard', 1, 1200000),
    (3, 1, 'Monitor', 1, 4500000),

    (4, 3, 'MacBook Air', 1, 28000000),
    (4, 3, 'USB Hub', 1, 800000),

    (5, 4, 'Samsung Galaxy S24', 1, 19000000),
    (5, 4, 'Charger', 1, 700000);
    
SELECT * 
FROM order_items;

-- Hiển thị: mã đơn hàng, ngày đặt hàng, tên khách hàng --

SELECT 
	o.order_id,
    o.order_date,
    c.customer_name
FROM customers c
INNER JOIN orders o
	ON c.customer_id = o.customer_id;
    
-- Hiển thị danh sách sản phẩm trong mỗi đơn hàng

SELECT
    order_id,
    product_name,
    quantity,
    price
FROM order_items;

-- Hiển thị các đơn hàng có tổng tiền > 10.000.000

SELECT 
	order_id,
    SUM(quantity * price) AS total_amount
FROM order_items
GROUP BY order_id
HAVING total_amount > 10000000;