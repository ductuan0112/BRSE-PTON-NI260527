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

CREATE TRIGGER after_product_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    INSERT INTO inventory_changes (
        product_id,
        old_quantity,
        new_quantity
    )
    VALUES (
        NEW.id,
        OLD.quantity,
        NEW.quantity
    );
END //

DELIMITER ;

INSERT INTO products (name, quantity)
VALUES 
	('A', 100),
    ('B', 200),
    ('C', 300);

UPDATE products 
SET quantity = 150
WHERE name = 'A';

UPDATE products 
SET quantity = 150
WHERE name = 'C';

SELECT * FROM inventory_changes;
