CREATE TABLE students(
	student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    birth_year INT,
    class_name VARCHAR(10),
    address VARCHAR(255)
);

INSERT INTO students (student_id, full_name, birth_year, class_name, address)
VALUES
    ('SV001', 'Nguyen Van An', 2001, 'C01', 'Ha Noi'),
    ('SV002', 'Tran Thi Binh', 2002, 'C01', 'Hai Phong'),
    ('SV003', 'Le Van Cuong', 2000, 'C02', 'Da Nang'),
    ('SV004', 'Pham Thi Dung', 2003, 'C02', 'Ha Noi'),
    ('SV005', 'Hoang Van Em', 2001, 'C03', 'Nam Dinh'),
    ('SV006', 'Do Thi Giang', 2004, 'C03', 'Thanh Hoa'),
    ('SV007', 'Bui Van Hung', 2002, 'C01', 'Ha Noi'),
    ('SV008', 'Vu Thi Lan', 2003, 'C02', 'Nghe An'),
    ('SV009', 'Dang Van Minh', 2000, 'C03', 'Hai Duong'),
    ('SV010', 'Ngo Thi Nga', 2004, 'C01', 'Ha Nam');
    
SELECT * FROM students;

CREATE VIEW v_student_basic AS
SELECT student_id, full_name, class_name 
FROM students;

SELECT * 
FROM v_student_basic;