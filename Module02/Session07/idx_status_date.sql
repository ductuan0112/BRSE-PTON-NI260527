CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    status ENUM('pending', 'processing', 'completed', 'cancelled') NOT NULL,
    total DECIMAL(12,2) NOT NULL
);

INSERT INTO orders (order_date, status, total)
VALUES
('2026-08-01', 'completed', 1500000.00),
('2026-08-02', 'pending',    850000.00),
('2026-08-03', 'completed', 2300000.00),
('2026-08-05', 'cancelled',  450000.00),
('2026-08-07', 'processing', 1250000.00),
('2026-08-10', 'completed', 3200000.00),
('2026-08-12', 'pending',    750000.00),
('2026-08-15', 'completed', 1800000.00),
('2026-08-20', 'processing', 2100000.00),
('2026-08-25', 'cancelled',  600000.00);

CREATE INDEX idx_status_date 
ON orders(status,order_date);

EXPLAIN
SELECT * 
FROM orders
WHERE status = 'completed'
	AND order_date >= '2026-08-02';
    