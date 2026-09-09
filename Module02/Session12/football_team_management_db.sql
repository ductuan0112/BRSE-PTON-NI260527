DROP DATABASE IF EXISTS football_team_management_db;
CREATE DATABASE football_team_management_db;

USE football_team_management_db;

CREATE TABLE football_teams (
	team_id INT AUTO_INCREMENT PRIMARY KEY,
	team_name VARCHAR(100) NOT NULL,
	team_code VARCHAR(20) NOT NULL UNIQUE,
	home_area VARCHAR(100) NOT NULL,
	founded_date DATE NOT NULL
);

CREATE TABLE players (
	player_id INT AUTO_INCREMENT PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	preferred_position ENUM ('Thủ môn', 'Hậu vệ', 'Tiền vệ', 'Tiền đạo'),
	phone_number VARCHAR(15) NOT NULL UNIQUE,
	skill_rating DECIMAL(3,1) CHECK (0 <= skill_rating <= 10)
);

CREATE TABLE matches (
	match_id INT AUTO_INCREMENT PRIMARY KEY,
	team_id INT,
	opponent_name VARCHAR(100) NOT NULL,
	venue VARCHAR(150) NOT NULL,
	match_time DATETIME NOT NULL,
	pitch_fee DECIMAL(10,2) CHECK (pitch_fee >= 0),
	status ENUM('Scheduled', 'Completed', 'Cancelled'),
	FOREIGN KEY (team_id) REFERENCES football_teams(team_id)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE match_registrations (
	registration_id INT AUTO_INCREMENT PRIMARY KEY,
	match_id INT,
	player_id INT,
	attendance_status ENUM('Registered', 'Played', 'Absent'),
	goals INT DEFAULT 0 CHECK (goals >= 0),
	registered_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE (match_id, player_id),
    
    FOREIGN KEY (match_id) REFERENCES matches(match_id)
		ON UPDATE CASCADE
        ON DELETE RESTRICT,
	FOREIGN KEY (player_id) REFERENCES players(player_id)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE team_logs (
	log_id INT AUTO_INCREMENT PRIMARY KEY,
	registration_id INT,
	player_id INT,
	log_time DATETIME NOT NULL,
	note TEXT NOT NULL,
    FOREIGN KEY (registration_id) REFERENCES match_registrations (registration_id)
		ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (player_id) REFERENCES players(player_id)
		ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO football_teams (
    team_id,
    team_name,
    team_code,
    home_area,
    founded_date
)
VALUES
    (1, 'Sài Gòn Strikers', 'SGS', 'Quận 1', '2018-03-10'),
    (2, 'Thunder FC', 'TFC', 'TP Thủ Đức', '2021-06-15'),
    (3, 'Brothers United', 'BRU', 'Bình Thạnh', '2016-09-20'),
    (4, 'Weekend Warriors', 'WKW', 'Quận 7', '2022-01-08'),
    (5, 'Office Eleven', 'O11', 'Gò Vấp', '2019-11-30');
    
INSERT INTO players (
    player_id,
    full_name,
    preferred_position,
    phone_number,
    skill_rating
)
VALUES
    (1, 'Nguyễn Minh Khang', 'Tiền đạo', '901112233', 8.2),
    (2, 'Trần Hoàng Nam', 'Tiền vệ', '902223344', 7.5),
    (3, 'Lê Quốc Huy', 'Hậu vệ', '903334455', 7.8),
    (4, 'Phạm Gia Bảo', 'Thủ môn', '904445566', 8.2),
    (5, 'Võ Thành Công', 'Tiền vệ', '905556677', 7.0);
    
INSERT INTO matches (
    match_id,
    team_id,
    opponent_name,
    venue,
    match_time,
    pitch_fee,
    status
)
VALUES
    (7001, 1, 'Black Cats', 'Sân Tao Đàn', '2026-05-20 18:00:00', 1200000, 'Scheduled'),
    (7002, 3, 'Blue Sharks', 'Sân Gia Định', '2026-05-21 19:30:00', 1500000, 'Completed'),
    (7003, 2, 'Bình Minh FC', 'Sân Linh Trung', '2026-05-22 18:30:00', 1000000, 'Completed'),
    (7004, 5, 'Red Bulls', 'Sân Kỳ Hòa', '2026-05-23 20:00:00', 1300000, 'Cancelled'),
    (7005, 4, 'Young Boys', 'Sân Hoàng Văn Thụ', '2026-05-24 17:30:00', 1100000, 'Scheduled');
    
INSERT INTO match_registrations (
    registration_id,
    match_id,
    player_id,
    attendance_status,
    goals,
    registered_at
)
VALUES
    (8001, 7002, 1, 'Played', 2, '2026-05-19 09:00:00'),
    (8002, 7002, 3, 'Played', 0, '2026-05-19 09:15:00'),
    (8003, 7001, 2, 'Registered', 0, '2026-05-18 20:00:00'),
    (8004, 7003, 5, 'Played', 1, '2026-05-20 08:30:00'),
    (8005, 7004, 4, 'Absent', 0, '2026-05-21 10:00:00');
    
INSERT INTO team_logs (
    log_id,
    registration_id,
    player_id,
    log_time,
    note
)
VALUES
    (1, 8003, 2, '2026-05-18 20:05:00', 'Xác nhận tham gia trận'),
    (2, 8001, 1, '2026-05-19 09:05:00', 'Đăng ký đá chính'),
    (3, 8002, 3, '2026-05-19 09:20:00', 'Xác nhận tham gia'),
    (4, 8004, 5, '2026-05-20 08:35:00', 'Đã có mặt tại sân'),
    (5, 8005, 4, '2026-05-23 20:05:00', 'Vắng mặt không báo trước');
    
-- 1. Tăng pitch_fee thêm 100.000 đồng cho các trận đồng thời thỏa mãn: Trạng thái là Completed

UPDATE matches
SET pitch_fee = pitch_fee + 100000
WHERE status = 'Completed';

-- Xóa các bản ghi trong team_logs có log_time trước ngày 20/05/2026

DELETE FROM team_logs
WHERE log_time < '2026-05-20';

-- Liệt kê full_name, preferred_position và skill_rating 
-- của các cầu thủ có điểm kỹ năng lớn hơn 7.8 hoặc có vị trí sở trường là Tiền vệ.

SELECT full_name, preferred_position, skill_rating 
FROM players
WHERE skill_rating > 7.8 OR preferred_position = 'Tiền vệ';

-- Liệt kê opponent_name, venue và match_time của các trận:
-- Diễn ra từ ngày 2026-05-20 đến hết ngày 2026-05-22.
-- Tên đội đối thủ bắt đầu bằng chữ B

SELECT opponent_name, venue, match_time
FROM matches
WHERE match_time BETWEEN '2026-05-20' AND '2026-05-22'
	AND opponent_name LIKE 'B%';

-- Liệt kê registration_id, goals và registered_at:
-- - Sắp xếp goals giảm dần.
-- - Nếu số bàn thắng bằng nhau, sắp xếp registration_id tăng dần.
-- - Mỗi trang có 2 bản ghi.
-- - Chỉ hiển thị trang thứ hai.

SELECT registration_id, goals, registered_at
FROM match_registrations
ORDER BY goals DESC, registered_id ASC
LIMIT 2 OFFSET 2;

-- Kết hợp các bảng liên quan để liệt kê:
-- - Tên đội bóng.
-- - Tên đội đối thủ.
-- - Họ tên cầu thủ.
-- - Vị trí sở trường.
-- - Số bàn thắng.
-- - Thời gian thi đấu.

SELECT ft.team_name, 
	m.opponent_name, 
    p.full_name, 
	p.preferred_position, 
	mr.goals, 
    m.match_time
FROM football_teams ft
JOIN matches m 
	ON ft.team_id = m.team_id
JOIN match_registrations mr
	ON m.match_id = mr.match_id
JOIN players p
	ON mr.player_id = p.player_id;
    
-- Liệt kê họ tên cầu thủ và tổng số bàn thắng trong các đăng ký có attendance_status = 'Played'. 
-- Chỉ hiển thị những cầu thủ có tổng số bàn thắng lớn hơn 1.

SELECT p.full_name,
	SUM(mr.goals) AS total_goals
FROM players p
JOIN match_registrations mr
	ON p.player_id = mr.player_id
WHERE mr.attendance_status = 'Played'
GROUP BY p.player_id, p.full_name
HAVING total_goals > 1;

-- Tạo chỉ mục kết hợp trên bảng match_registrations, gồm:
-- - attendance_status
-- - goals

CREATE INDEX id_match_registrations
ON match_registrations(attendance_status, goals);

-- Tạo một view hiển thị:
-- - player_id
-- - full_name
-- - Tổng số trận đã đăng ký
-- - Tổng số bàn thắng
-- Yêu cầu:
-- - Không tính các đăng ký có attendance_status = 'Absent'.
-- - Cầu thủ chưa có đăng ký hợp lệ vẫn phải xuất hiện.
-- - Các giá trị tổng của cầu thủ chưa có đăng ký bằng 0.

DROP VIEW IF EXISTS v_player;
CREATE VIEW v_player
AS 
SELECT p.player_id,
	p.full_name,
    COUNT(mr.match_id) AS total_match_registrations,
    COALESCE(SUM(mr.goals), 0) AS total_goals
FROM players p
LEFT JOIN match_registrations mr
	ON p.player_id = mr.player_id
	AND attendance_status <> 'Absent'
GROUP BY p.player_id;

SELECT * FROM v_player;

-- Viết trigger chạy sau khi cập nhật bảng match_registrations.
-- Khi attendance_status thực sự chuyển từ một giá trị khác sang Played, hệ thống tự động thêm một bản ghi vào team_logs với:
-- - registration_id: mã đăng ký vừa cập nhật.
-- - player_id: cầu thủ của đăng ký.
-- - note: Player confirmed as played.
-- - log_time: thời gian hiện tại của hệ thống.
-- Không ghi nhật ký nếu bản ghi đã có trạng thái Played và chỉ cập nhật một cột khác.

DELIMITER //
CREATE TRIGGER trg_after_match_registration_update
AFTER UPDATE ON match_registrations
FOR EACH ROW
BEGIN
	IF OLD.attendance_status <> 'Played'
		AND NEW.attendance_status = 'Played' THEN
	INSERT INTO team_logs (registration_id, player_id, note, log_time)
    VALUES (NEW.registration_id, NEW.player_id, 'Player confirmed as played', CURRENT_TIMESTAMP);
    END IF;
END //

DELIMITER ;

-- Viết trigger chạy sau khi thêm mới vào match_registrations.
-- Nếu bản ghi mới có attendance_status = 'Played':
-- - Tăng skill_rating của cầu thủ tương ứng thêm 0.1.
-- - Đảm bảo skill_rating không vượt quá 10.0.

DELIMITER //
CREATE TRIGGER trg_after_match_registration_insert
AFTER INSERT ON match_registrations
FOR EACH ROW
BEGIN

	IF NEW.attendance_status = 'Played' THEN
		UPDATE players
        SET skill_rating = CASE 
			WHEN skill_rating + 0.1 > 10 THEN 10
            ELSE skill_rating + 0.1
		END
        WHERE player_id = NEW.player_id;
    END IF;
END //

DELIMITER ;
  