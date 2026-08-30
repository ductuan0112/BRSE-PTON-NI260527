DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
	emp_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DOUBLE,
    id_card_number VARCHAR(12) UNIQUE
);

INSERT INTO employees (emp_id, full_name, department, salary, id_card_number)
VALUES
    ('E001', 'Nguyen Van An', 'IT', 12000000, '001234567890'),
    ('E002', 'Tran Thi Binh', 'HR', 8500000, '001234567891'),
    ('E003', 'Le Van Cuong', 'Finance', 15000000, '001234567892'),
    ('E004', 'Pham Thi Dung', 'Marketing', 10500000, '001234567893'),
    ('E005', 'Hoang Van Em', 'IT', 14000000, '001234567894'),
    ('E006', 'Do Thi Giang', 'Sales', 9000000, '001234567895'),
    ('E007', 'Bui Van Hung', 'Finance', 16000000, '001234567896'),
    ('E008', 'Vu Thi Lan', 'HR', 9500000, '001234567897'),
    ('E009', 'Dang Van Minh', 'Marketing', 13000000, '001234567898'),
    ('E010', 'Ngo Thi Nga', 'Sales', 11000000, '001234567899'),
    ('E011', 'Phan Van Long', 'IT', 15500000, '001234567900'),
    ('E012', 'Doan Thi Mai', 'HR', 7800000, '001234567901'),
    ('E013', 'Mai Van Nam', 'Finance', 12500000, '001234567902'),
    ('E014', 'Ho Thi Oanh', 'Marketing', 10000000, '001234567903'),
    ('E015', 'Vu Van Phuc', 'Sales', 13500000, '001234567904');
    
DROP PROCEDURE IF EXISTS sp_get_avg_salary;
    
DELIMITER //

CREATE PROCEDURE sp_get_avg_salary()
BEGIN
	DECLARE v_avg_salary DOUBLE;
    
    SELECT AVG(salary)
    INTO v_avg_salary
    FROM employees;
    
    SELECT v_avg_salary AS avg_salary;
END //

DELIMITER ;

CALL sp_get_avg_salary();
