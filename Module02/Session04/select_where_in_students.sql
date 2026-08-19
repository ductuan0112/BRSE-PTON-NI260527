CREATE TABLE students (
	student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    gender VARCHAR(10),
    email VARCHAR(50)
);

INSERT INTO students
VALUES
    ('SV001', 'Nguyen Van A', '1990-02-23', 'Nam', 'email@gmail.com'),
    ('SV002','Le Thi B', '2005-03-12', 'Nu', NULL),
    ('SV003','Dang Van C', '2001-09-01', 'Nam', 'email3@gmail.com'),
    ('SV004','Hoang Thi D', '1998-11-14', 'Nu', NULL),
    ('SV005','Tran Thi E', '1989-07-29', 'Nu', NULL);
    
SELECT * 
FROM students
WHERE YEAR(birth_date) BETWEEN 2003 AND 2006; 

SELECT *
FROM students
WHERE gender = 'Nam' OR gender = 'Nu';

SELECT *
FROM students 
WHERE student_id IN ('SV001', 'SV004', 'SV005');

SELECT student_id AS ID, full_name AS `Name`, birth_date AS `Date of Birth`
FROM students; 