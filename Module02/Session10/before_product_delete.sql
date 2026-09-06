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

CREATE TRIGGER before_product_delete
BEFORE DELETE ON products
FOR EACH ROW
BEGIN
	IF OLD.quantity > 10 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Không thể xóa sản phẩm có tồn kho lớn hơn 10';
    END IF;
END //

DELIMITER ;

INSERT INTO products (name, quantity)
VALUES
	('A', 15),
    ('B', 5);
    
DELETE FROM products
WHERE name = 'A';

SELECT * FROM products;