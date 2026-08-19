CREATE TABLE students (
	student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    gender VARCHAR(10),
    email VARCHAR(50)
);

INSERT INTO students
VALUES
    ('SV001', 'Nguyen Van A', '1990-10-20', 'Nam', 'email@gmail.com'),
    ('SV002','Le Thi B', '1996-11-08', 'Nu', NULL),
    ('SV003','Dang Van C', '1965-01-12', 'Nam', 'email2@gmail.com'),
    ('SV004','Hoang Thi D', '1978-08-18', 'Nu', NULL),
    ('SV005','Tran Thi E', '1989-06-27', 'Nu', NULL);
    
UPDATE students
SET email = 'email2@gmail.com'
WHERE student_id = 'SV002';

UPDATE students
SET email = 'email4@gmail.com'
WHERE student_id = 'SV004';

UPDATE students
SET email = 'email5@gmail.com'
WHERE student_id = 'SV005';

UPDATE students
SET email = 'email3@gmail.com'
WHERE student_id = 'SV003';

UPDATE students
SET gender = 'Nam'
WHERE student_id = 'SV005';

DELETE FROM students
WHERE student_id = 'SV003';

SELECT * FROM students;