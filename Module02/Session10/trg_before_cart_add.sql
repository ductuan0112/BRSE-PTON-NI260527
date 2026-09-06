DROP SCHEMA IF EXISTS InventoryManagement;
CREATE SCHEMA InventoryManagement;
USE InventoryManagement;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE cart_items (
	id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
	quantity INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

DELIMITER //

CREATE TRIGGER trg_before_cart_add
BEFORE INSERT ON cart_items
FOR EACH ROW
BEGIN
	DECLARE v_stock INT;
    
    SELECT quantity
    INTO v_stock
    FROM products
    WHERE id = NEW.product_id;
    
	IF NEW.quantity > v_stock THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Số lượng hàng trong kho không đủ...';
	END IF;
END //

DELIMITER ;

INSERT INTO products (name, quantity)
VALUES ('IPhone 15', 5);

SELECT * FROM products;

INSERT INTO cart_items (product_id, quantity)
VALUES (1, 2); -- Thêm thành công

INSERT INTO cart_items (product_id, quantity)
VALUES (1, 10); -- Thêm thất bại

SELECT * FROM cart_items;