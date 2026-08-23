CREATE TABLE employees (
	emp_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT
);

INSERT INTO employees (emp_id, full_name, department, salary)
VALUES
    ('E001', 'Nguyen Van An', 'IT', 12000000),
    ('E002', 'Tran Thi Binh', 'HR', 9000000),
    ('E003', 'Le Van Cuong', 'Finance', 15000000),
    ('E004', 'Pham Thi Dung', 'Marketing', 11000000),
    ('E005', 'Hoang Van Em', 'IT', 14000000),
    ('E006', 'Do Thi Giang', 'Sales', 10000000),
    ('E007', 'Bui Van Hung', 'Finance', 16000000),
    ('E008', 'Vu Thi Lan', 'HR', 9500000),
    ('E009', 'Dang Van Minh', 'Marketing', 13000000),
    ('E010', 'Ngo Thi Nga', 'Sales', 10500000);
    
CREATE INDEX idx_department
ON employees(department);

EXPLAIN
SELECT *
FROM employees
WHERE department = 'IT';
