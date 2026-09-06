DROP DATABASE IF EXISTS employee_management;
CREATE DATABASE employee_management;
USE employee_management;

CREATE TABLE employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	salary DECIMAL(10,2) NOT NULL,
	email VARCHAR(100) UNIQUE,
	phone_number VARCHAR(15)
);

CREATE TABLE salary_log (
	log_id INT AUTO_INCREMENT PRIMARY KEY,
	employee_id INT,
	old_salary DECIMAL(10, 2),
	new_salary DECIMAL(10, 2),
	change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO employees
    (first_name, last_name, salary, email, phone_number)
VALUES
    ('Nguyen', 'An', 1200.00, 'an.nguyen@example.com', '0901000001'),
    ('Tran', 'Binh', 1500.00, 'binh.tran@example.com', '0901000002'),
    ('Le', 'Cuong', 1800.00, 'cuong.le@example.com', '0901000003'),
    ('Pham', 'Dung', 1350.00, 'dung.pham@example.com', '0901000004'),
    ('Hoang', 'Giang', 2100.00, 'giang.hoang@example.com', '0901000005'),
    ('Vo', 'Hanh', 1600.00, 'hanh.vo@example.com', '0901000006'),
    ('Do', 'Khoa', 2500.00, 'khoa.do@example.com', '0901000007'),
    ('Bui', 'Linh', 1900.00, 'linh.bui@example.com', '0901000008'),
    ('Dang', 'Minh', 1450.00, 'minh.dang@example.com', '0901000009'),
    ('Phan', 'Nam', 2300.00, 'nam.phan@example.com', '0901000010');

DELIMITER //

CREATE TRIGGER trg_after_update_salary
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
	INSERT INTO salary_log (
		employee_id,
		old_salary,
        new_salary
	)
    VALUES (
		OLD.id,
		OLD.salary,
        NEW.salary
    );
END//

DELIMITER ;

UPDATE employees 
SET salary = 1400.00
WHERE id = 1;

UPDATE employees 
SET salary = 1800.00
WHERE id = 2;

SELECT * FROM salary_log;

