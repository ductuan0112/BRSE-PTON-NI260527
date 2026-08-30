CREATE TABLE products(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    category VARCHAR(50)
);

INSERT INTO products (product_name, price, category)
VALUES
('Laptop Dell XPS 13', 25000000.00, 'Laptop'),
('MacBook Air M3', 28000000.00, 'Laptop'),
('iPhone 16', 22000000.00, 'Smartphone'),
('Samsung Galaxy S25', 24000000.00, 'Smartphone'),
('iPad Air M2', 18000000.00, 'Tablet'),
('Samsung Galaxy Tab S10', 20000000.00, 'Tablet'),
('Logitech MX Master 3S', 2500000.00, 'Accessories'),
('Keychron K8 Pro', 3200000.00, 'Accessories'),
('Sony WH-1000XM5', 7500000.00, 'Headphone'),
('AirPods Pro 2', 6500000.00, 'Headphone'),
('Dell UltraSharp U2723QE', 12000000.00, 'Monitor'),
('LG UltraGear 27GP850', 9500000.00, 'Monitor');

DROP PROCEDURE IF EXISTS sp_get_product_by_category;

DELIMITER //

CREATE PROCEDURE sp_get_product_by_category (
IN p_category VARCHAR(50)
)
BEGIN
	SELECT *
    FROM products
    WHERE category = p_category;
END //
DELIMITER ;

CALL sp_get_product_by_category ('Headphone');