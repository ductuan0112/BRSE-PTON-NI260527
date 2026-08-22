CREATE TABLE students (
	student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR (50) NOT NULL,
    birth_year INT NOT NULL,
    gender ENUM ('Nam', 'Nu'),
    score DECIMAL(4, 2) NOT NULL CHECK (score BETWEEN 0 AND 10)
);

INSERT INTO students (student_id, full_name, birth_year, gender, score)
VALUES
    ('SV001', 'Nguyen Van An', 2001, 'Nam', 8.50),
    ('SV002', 'Tran Thi Binh', 2002, 'Nu', 7.25),
    ('SV003', 'Le Van Cuong', 2000, 'Nam', 9.00),
    ('SV004', 'Pham Thi Dung', 2003, 'Nu', 6.75),
    ('SV005', 'Hoang Van Em', 2001, 'Nam', 8.00),
    ('SV006', 'Do Thi Giang', 2004, 'Nu', 9.50),
    ('SV007', 'Bui Van Hung', 2002, 'Nam', 5.50),
    ('SV008', 'Vu Thi Lan', 2003, 'Nu', 7.80),
    ('SV009', 'Dang Van Minh', 2000, 'Nam', 8.90),
    ('SV010', 'Ngo Thi Nga', 2004, 'Nu', 6.50);
    
SELECT *
FROM students;
    
SELECT student_id, UPPER(full_name) as full_name
FROM students;

SELECT full_name, YEAR(current_date()) - birth_year AS age
FROM students;

SELECT full_name, ROUND(score, 1) AS score
FROM students;

SELECT COUNT(*) AS student_total, 
	MAX(score) AS max_score, 
    MIN(score) AS min_score
FROM students;