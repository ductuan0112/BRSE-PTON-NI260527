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

CALL st_place_order(1, 20);
SELECT * FROM orders;
SELECT * FROM products;
