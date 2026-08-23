CREATE TABLE scores (
    student_id VARCHAR(10) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    score DECIMAL(4,2) NOT NULL
);

INSERT INTO scores (student_id, subject, score)
VALUES
    ('SV001', 'Math', 8.5),
    ('SV001', 'English', 7.5),
    ('SV001', 'Database', 9.0),

    ('SV002', 'Math', 6.0),
    ('SV002', 'English', 7.0),
    ('SV002', 'Database', 6.5),

    ('SV003', 'Math', 9.0),
    ('SV003', 'English', 8.5),
    ('SV003', 'Database', 9.5),

    ('SV004', 'Math', 5.5),
    ('SV004', 'English', 6.0),
    ('SV004', 'Database', 7.0),

    ('SV005', 'Math', 7.5),
    ('SV005', 'English', 8.0),
    ('SV005', 'Database', 7.0),

    ('SV006', 'Math', 8.0),
    ('SV006', 'English', 8.5),
    ('SV006', 'Database', 7.5);
    
SELECT * FROM scores;

-- Tính điểm trung bình của mỗi sinh viên

SELECT student_id, ROUND(AVG(score), 1) AS avg_score
FROM scores
GROUP BY student_id;

-- Chỉ hiển thị sinh viên có điểm trung bình trên 7.0

SELECT student_id, ROUND(AVG(score), 1) AS avg_score
FROM scores
GROUP BY student_id
HAVING avg_score > 7;

-- Hiển thị sinh viên có điểm trung bình cao nhất trong danh sách

SELECT student_id, ROUND(AVG(score), 1) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) = (
	SELECT MAX(avg_score)
    FROM (
		SELECT AVG(score) AS avg_score
        FROM scores
        GROUP BY student_id
    ) AS student_avg
);

-- Hiển thị sinh viên có điểm trung bình cao hơn điểm trung bình chung của tất cả sinh viên

SELECT student_id, ROUND(AVG(score), 1) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) > (
	SELECT AVG(avg_score) 
    FROM (
		SELECT AVG(score) AS avg_score
        FROM scores
        GROUP BY student_id
    ) AS student_avg
)



