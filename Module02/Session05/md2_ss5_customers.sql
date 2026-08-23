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
    product_name VARCHAR(100) NOT NULL,
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
    ('2026-08-01', 1),
    ('2026-08-03', 1),
    ('2026-08-05', 2),
    ('2026-08-07', 3),
    ('2026-08-10', 3),
    ('2026-08-12', 4),
    ('2026-08-15', 5);
    
INSERT INTO order_items
    (order_id, customer_id, product_name, quantity, price)
VALUES
    -- Order 1 - Customer 1
    (1, 1, 'Dell Inspiron 15', 1, 15000000),
    (1, 1, 'Logitech Mouse', 2, 500000),

    -- Order 2 - Customer 1
    (2, 1, 'Samsung Galaxy S24', 1, 18000000),
    (2, 1, 'Charger', 1, 1000000),

    -- Order 3 - Customer 2
    (3, 2, 'iPhone 15', 1, 22000000),
    (3, 2, 'Phone Case', 1, 500000),

    -- Order 4 - Customer 3
    (4, 3, 'Asus Vivobook', 1, 17000000),
    (4, 3, 'Keyboard', 1, 1200000),

    -- Order 5 - Customer 3
    (5, 3, 'Monitor', 2, 5000000),
    (5, 3, 'USB Hub', 1, 800000),

    -- Order 6 - Customer 4
    (6, 4, 'Xiaomi 14', 1, 16000000),
    (6, 4, 'Earphones', 1, 1500000),

    -- Order 7 - Customer 5
    (7, 5, 'iPad Air', 1, 19000000),
    (7, 5, 'Apple Pencil', 1, 2500000);
    
-- Hiển thị mã khách hàng, tên khách hàng, tổng tiền của đơn hàng

SELECT 
    o.order_id,
    c.customer_name,
    SUM(oi.price * oi.quantity) AS order_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id, c.customer_name;

-- Tính tổng doanh thu của mỗi khách hàng

SELECT 
	c.customer_id,
    c.customer_name,
    SUM(oi.price * oi.quantity) AS total_amount
FROM customers c
JOIN order_items oi
	ON c.customer_id = oi.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Chỉ hiển thị các khách hàng có doanh thu lớn hơn 20.000.000 

SELECT 
	c.customer_id,
    c.customer_name,
    SUM(oi.price * oi.quantity) AS total_amount
FROM customers c
JOIN order_items oi
	ON c.customer_id = oi.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING total_amount > 20000000;

-- Hiển thị khách hàng có doanh thu cao nhất

SELECT 
	c.customer_id,
    c.customer_name,
    SUM(oi.price * oi.quantity) AS total_amount
FROM customers c
JOIN order_items oi
	ON c.customer_id = oi.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING total_amount = (
	SELECT MAX(total_amount)
    FROM (
		SELECT SUM(price * quantity) AS total_amount
        FROM order_items
        GROUP BY customer_id
    ) AS customer_total_amount
);
