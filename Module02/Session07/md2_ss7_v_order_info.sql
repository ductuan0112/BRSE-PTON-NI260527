CREATE TABLE customers(
	customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL
);

CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    customer_id VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, customer_name)
VALUES
    ('C001', 'Nguyen Van An'),
    ('C002', 'Tran Thi Binh'),
    ('C003', 'Le Van Cuong'),
    ('C004', 'Pham Thi Dung'),
    ('C005', 'Hoang Van Em');
    
INSERT INTO orders (order_date, customer_id)
VALUES
    ('2026-08-01', 'C001'),
    ('2026-08-03', 'C001'),
    ('2026-08-05', 'C002'),
    ('2026-08-07', 'C003'),
    ('2026-08-10', 'C003'),
    ('2026-08-12', 'C004');
    
CREATE VIEW v_order_info AS
SELECT 
	o.order_id,
    o.order_date,
    c.customer_name
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;

SELECT *
FROM v_order_info;