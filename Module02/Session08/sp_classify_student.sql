DROP TABLE IF EXISTS students;

CREATE TABLE students (
	student_id VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    avg_score DECIMAL(3, 2) NOT NULL CHECK (avg_score BETWEEN 0 AND 10)
);

INSERT INTO students (student_id, full_name, avg_score)
VALUES
    ('SV001', 'Nguyen Van An', 8.5),
    ('SV002', 'Tran Thi Binh', 7.8),
    ('SV003', 'Le Van Cuong', 6.5),
    ('SV004', 'Pham Thi Dung', 6.2),
    ('SV005', 'Hoang Van Em', 5.5),
    ('SV006', 'Do Thi Giang', 5.0),
    ('SV007', 'Bui Van Hung', 4.8),
    ('SV008', 'Vu Thi Lan', 9.2),
    ('SV009', 'Dang Van Minh', 8.0),
    ('SV010', 'Ngo Thi Nga', 7.0),
    ('SV011', 'Phan Van Long', 6.4),
    ('SV012', 'Doan Thi Mai', 4.0);
    
DROP PROCEDURE IF EXISTS sp_classify_student;

DELIMITER //
CREATE PROCEDURE sp_classify_student(
	IN p_full_name VARCHAR(50),
    OUT p_result VARCHAR (50)
)
BEGIN
	DECLARE v_classification VARCHAR(20);
    DECLARE v_avg_score DECIMAL(3, 2);
    
    SELECT avg_score
    INTO v_avg_score
    FROM students
    WHERE full_name = p_full_name;
    
    SET v_classification = CASE 
		WHEN v_avg_score >= 8 THEN 'Giỏi'
		WHEN v_avg_score >= 6.5 THEN 'Khá'
		WHEN v_avg_score >= 5 THEN 'Trung Bình'
		ELSE 'Yếu'
    END;
    
    SET p_result = v_classification;
END //
DELIMITER ;

CALL sp_classify_student('Nguyen Van An', @result);

SELECT @result AS classification;