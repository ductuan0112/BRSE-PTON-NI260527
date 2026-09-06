DROP DATABASE IF EXISTS order_management;
CREATE DATABASE order_management;
USE order_management;

CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipping', 'Completed', 'Cancelled')
);

CREATE TABLE order_logs (
	log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

DELIMITER //

CREATE TRIGGER trg_after_order_status_update
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
	IF OLD.status <> NEW.status THEN
		INSERT INTO order_logs (
			order_id,
            old_status,
            new_status
        )
        VALUES (
			OLD.id,
            OLD.status,
            NEW.status
        );
	END IF;
END //
DELIMITER ;

INSERT INTO orders (customer_name, total_amount, status)
VALUES 
	('Nguyen Van A', 1000000.00, 'Pending');
    
UPDATE orders 
SET status = 'Shipping'
WHERE id = 1; -- Đổi trạng thái -> ghi log

UPDATE orders 
SET customer_name = 'Nguyen Van B'
WHERE id = 1; -- Không đổi trạng thái -> không ghi log
    
SELECT * FROM orders;
SELECT * FROM order_logs;
