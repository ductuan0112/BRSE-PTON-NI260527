CREATE TABLE students (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    gender VARCHAR(10),
    email VARCHAR(50)
);

INSERT INTO students (full_name, birth_date, gender, email)
VALUES
    ('Nguyen Van A', '1990-10-20', 'Nam', 'email@gmail.com'),
    ('Le Thi B', '1996-11-08', 'Nu', NULL),
    ('Dang Van C', '1965-01-12', 'Nam', 'email2@gmail.com'),
    ('Hoang Thi D', '1978-08-18', 'Nu', NULL),
    ('Tran Thi E', '1989-06-27', 'Nu', NULL);
    
SELECT * FROM students;

SELECT student_id, full_name, email
FROM students;