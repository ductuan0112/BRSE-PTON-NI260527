DROP DATABASE IF EXISTS order_management;
CREATE DATABASE order_management;

USE order_management;

CREATE TABLE products(
	id INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(100) NOT NULL,
	price DECIMAL(10, 2) NOT NULL CHECK (price > 0),
	stock INT NOT NULL
);

CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	total_price DECIMAL(10, 2),-- (Tổng tiền = Giá x Số lượng)
	order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO products (product_name, price, stock)
VALUES ('Laptop Gaming', 20000000, 10);

DELIMITER //

DROP PROCEDURE IF EXISTS st_place_order //
CREATE PROCEDURE st_place_order (
	IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_stock INT;
	DECLARE v_price DECIMAL(10, 2);
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;
    
	START TRANSACTION;
    
    SELECT stock 
	INTO v_stock
    FROM products
    WHERE id = p_product_id;
    
    SELECT price
	INTO v_price
    FROM products
    WHERE id = p_product_id;
    
    IF v_stock >= p_quantity THEN
		UPDATE products
        SET stock = stock - p_quantity
        WHERE id = p_product_id;
        
        INSERT INTO orders (product_id, quantity, total_price)
        VALUES (p_product_id, p_quantity, v_price * p_quantity);
        
        COMMIT;
        
        SELECT 'Đặt hàng thành công!' AS message;
	ELSE 
		ROLLBACK;
        SELECT 'Đặt hàng thất bại: Số lượng hàng không đủ!' AS message;
	END IF;
END //

DELIMITER ;

ALTER TABLE orders
ADD COLUMN status VARCHAR(50) DEFAULT 'Completed';

DELIMITER //

DROP PROCEDURE IF EXISTS st_cancel_order //
CREATE PROCEDURE st_cancel_order (
	IN p_order_id INT
)
BEGIN
	DECLARE v_product_id INT;
    DECLARE v_quantity INT;
    DECLARE v_current_status VARCHAR(50);
    DECLARE v_order_exists INT DEFAULT 0;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SELECT 'Lỗi hệ thống!' AS message;
    END;
	
    START TRANSACTION;
    SELECT COUNT(*)
    INTO v_order_exists
    FROM orders
    WHERE id = p_order_id;
    
    IF v_order_exists = 0 THEN
		ROLLBACK;
        SELECT 'Đơn hàng không tồn tại' AS message;
    ELSE 
		SELECT product_id, quantity, status
		INTO v_product_id, v_quantity, v_current_status
		FROM orders
		WHERE id = p_order_id
		FOR UPDATE;
    
		IF v_current_status = 'Cancelled' THEN
			ROLLBACK;
			SELECT 'Đơn hàng này đã được hủy trước đó' AS message;
		ELSE 
			UPDATE orders
			SET status = 'Cancelled'
			WHERE id = p_order_id;
        
			UPDATE products
			SET stock = stock + v_quantity
			WHERE id = v_product_id;
        
			COMMIT;
			SELECT 'Đã hủy thành công! Đã hoàn tồn kho' AS message;
		END IF;
	END IF;
		
END //

DELIMITER ;

CALL st_place_order(1, 3);
CALL st_cancel_order(3);

SELECT * FROM products;
SELECT * FROM orders;
