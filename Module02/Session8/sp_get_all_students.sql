CREATE TABLE students(
	student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    class_name VARCHAR(10) NOT NULL
);

INSERT INTO students (student_id, full_name, class_name)
VALUES
('SV001', 'Nguyen Van An', 'IT01'),
('SV002', 'Tran Thi Binh', 'IT01'),
('SV003', 'Le Van Cuong', 'IT02'),
('SV004', 'Pham Thi Dung', 'IT02'),
('SV005', 'Hoang Van Em', 'IT03'),
('SV006', 'Vu Thi Hoa', 'IT03'),
('SV007', 'Do Van Hung', 'IT01'),
('SV008', 'Bui Thi Lan', 'IT02'),
('SV009', 'Nguyen Van Minh', 'IT03'),
('SV010', 'Tran Thi Ngoc', 'IT01'),
('SV011', 'Le Van Phong', 'IT02'),
('SV012', 'Pham Thi Quynh', 'IT03');

DELIMITER //

CREATE PROCEDURE sp_get_all_students()

BEGIN
SELECT *
FROM students;
END //

DELIMITER ;

CALL sp_get_all_students();