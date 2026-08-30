DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
	emp_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    salary DECIMAL(12, 2) NOT NULL,
    department VARCHAR(50)
);

INSERT INTO employees (emp_id, full_name, salary, department)
VALUES
    ('E001', 'Nguyen Van An', 12000000.00, 'IT'),
    ('E002', 'Tran Thi Binh', 8500000.00, 'HR'),
    ('E003', 'Le Van Cuong', 15000000.00, 'Finance'),
    ('E004', 'Pham Thi Dung', 10500000.00, 'Marketing'),
    ('E005', 'Hoang Van Em', 14000000.00, 'IT'),
    ('E006', 'Do Thi Giang', 9000000.00, 'Sales'),
    ('E007', 'Bui Van Hung', 16000000.00, 'Finance'),
    ('E008', 'Vu Thi Lan', 9500000.00, 'HR'),
    ('E009', 'Dang Van Minh', 13000000.00, 'Marketing'),
    ('E010', 'Ngo Thi Nga', 11000000.00, 'Sales'),
    ('E011', 'Phan Van Long', 15500000.00, 'IT'),
    ('E012', 'Doan Thi Mai', 7800000.00, 'HR'),
    ('E013', 'Mai Van Nam', 12500000.00, 'Finance'),
    ('E014', 'Ho Thi Oanh', 10000000.00, 'Marketing'),
    ('E015', 'Vu Van Phuc', 13500000.00, 'Sales');
    
DROP PROCEDURE IF EXISTS sp_check_employee_income;

DELIMITER //

CREATE PROCEDURE sp_check_employee_income(
	IN p_full_name VARCHAR(50)
)
BEGIN
	DECLARE v_income_level VARCHAR(50);
    DECLARE v_salary DECIMAL(12, 2);
    
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE full_name = p_full_name;
    
    IF v_salary >= 15000000 THEN
		SET v_income_level = 'Thu nhập cao';
	ELSEIF v_salary >= 8000000 THEN
		SET v_income_level = 'Thu nhập trung bình';
	ELSE 
		SET v_income_level = 'Thu nhập thấp';
	END IF;
        
	SELECT 
		p_full_name AS full_name,
        v_income_level AS income_level;
END //

DELIMITER ;

CALL sp_check_employee_income ('Tran Thi Binh');