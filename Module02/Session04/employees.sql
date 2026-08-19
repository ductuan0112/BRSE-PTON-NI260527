CREATE TABLE employees (
	emp_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    birth_year INT NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    phone VARCHAR(11)
);

INSERT INTO employees (emp_id, full_name, birth_year, department, salary, phone)
VALUES
    ('NV001', 'Nguyen Van An', 1990, 'IT', 15000000, '09123456789'),
    ('NV002', 'Tran Thi Binh', 1995, 'HR', 12000000, '09876543210'),
    ('NV003', 'Le Van Cuong', 1988, 'Finance', 18000000, '09012345678'),
    ('NV004', 'Pham Thi Dung', 1992, 'Marketing', 14000000, '09345678901'),
    ('NV005', 'Hoang Van Em', 1997, 'IT', 13000000, '09765432109'),
    ('NV006', 'Do Thi Giang', 1994, 'Sales', 16000000, '09612345678'),
    ('NV007', 'Bui Van Hung', 1989, 'Finance', 20000000, NULL),
    ('NV008', 'Vu Thi Lan', 1996, 'HR', 4500000, '09234567890'),
    ('NV009', 'Dang Van Minh', 1991, 'Marketing', 17000000, NULL),
    ('NV010', 'Ngo Thi Nga', 1998, 'Sales', 3700000, '09987654321');

SELECT * 
FROM employees
WHERE salary BETWEEN 10000000 AND 20000000;

SELECT * 
FROM employees
WHERE department IN ('IT', 'HR');

SELECT * 
FROM employees
WHERE full_name LIKE '%Anh%';

SELECT * 
FROM employees
WHERE phone IS NULL;

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET salary = salary * 1.1
WHERE department = 'IT';

SET SQL_SAFE_UPDATES = 1;

UPDATE employees
SET phone = '0965346242'
WHERE emp_id = 'NV007';

UPDATE employees
SET phone = '0963433242'
WHERE emp_id = 'NV009';

DELETE FROM employees
WHERE salary < 5000000;

SELECT * FROM employees;