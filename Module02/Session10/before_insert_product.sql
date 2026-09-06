DROP SCHEMA IF EXISTS InventoryManagement;
CREATE SCHEMA InventoryManagement;
USE InventoryManagement;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE inventory_changes (
    change_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    old_quantity INT NOT NULL,
    new_quantity INT NOT NULL,
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

DELIMITER //

CREATE TRIGGER before_insert_product
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF NEW.quantity < 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Không thể thêm sản phảm có số lượng nhỏ hơn 0';
    END IF;
END //

DELIMITER ;

INSERT INTO products (name, quantity)
VALUES 
	('C', -10);
