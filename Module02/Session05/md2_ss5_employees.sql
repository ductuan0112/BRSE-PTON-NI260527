CREATE TABLE employees (
	emp_id VARCHAR(10) PRIMARY KEY,
	full_name VARCHAR(50) NOT NULL,
	department VARCHAR(50) NOT NULL,
	salary INT NOT NULL
); 

INSERT INTO employees (emp_id, full_name, department, salary)
VALUES
    ('E001', 'Nguyen Van An', 'IT', 9500000),
    ('E002', 'Tran Thi Binh', 'HR', 7500000),
    ('E003', 'Le Van Cuong', 'Finance', 14500000),
    ('E004', 'Pham Thi Dung', 'Marketing', 8500000),
    ('E005', 'Hoang Van Em', 'IT', 12000000),
    ('E006', 'Do Thi Giang', 'Sales', 10500000),
    ('E007', 'Bui Van Hung', 'Finance', 16000000),
    ('E008', 'Vu Thi Lan', 'HR', 8000000),
    ('E009', 'Dang Van Minh', 'Marketing', 11000000),
    ('E010', 'Ngo Thi Nga', 'Sales', 7000000),
    ('E011', 'Phan Van Nam', 'IT', 15500000),
    ('E012', 'Mai Thi Hoa', 'HR', 9000000),
    ('E013', 'Truong Van Long', 'Finance', 13500000),
    ('E014', 'Dinh Thi Mai', 'Marketing', 7800000),
    ('E015', 'Cao Van Son', 'Sales', 12500000);
    
SELECT * FROM employees;

SELECT department, COUNT(*) AS count_department
FROM employees
GROUP BY department; 

SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department; 

SELECT department, COUNT(*) AS total_emp
FROM employees
GROUP BY department
HAVING COUNT(*) >= 3;

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING avg_salary > 12000000;