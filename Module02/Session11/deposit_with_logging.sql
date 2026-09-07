DROP DATABASE IF EXISTS account_management;
CREATE DATABASE account_management;

USE account_management;

CREATE TABLE accounts (
	account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_name VARCHAR(100) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL
);

CREATE TABLE transactions (
	transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    log_message VARCHAR(255),
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

INSERT INTO accounts (account_name, balance)
VALUES
    ('Nguyen Van An', 5000000.00),
    ('Tran Thi Binh', 10000000.00),
    ('Le Van Cuong', 0.00),
    ('Pham Thi Dung', 12000000.00),
    ('Hoang Van Giang', 3000000.00),
    ('Vo Thi Hanh', 15000000.00),
    ('Do Van Khoa', 8000000.00),
    ('Bui Thi Linh', 4500000.00),
    ('Dang Van Minh', 20000000.00),
    ('Phan Thi Nam', 6500000.00);
    
DELIMITER //

DROP PROCEDURE IF EXISTS deposit_with_logging//
CREATE PROCEDURE deposit_with_logging (
	IN p_account_id INT, 
    IN p_amount DECIMAL(10, 2)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SELECT 'Đã xảy ra lỗi hệ thống! Giao dịch bị hủy.' AS status;
	END;
    
	START TRANSACTION;
    
		UPDATE accounts
        SET balance = balance + p_amount
        WHERE account_id = p_account_id;
        
        INSERT INTO transactions (
			account_id,
            amount,
            log_message
		)
		VALUES (
			p_account_id,
            p_amount,
            'Nạp tiền vào tài khoản'
		);
        COMMIT;
        
        SELECT 'Nạp tiền và ghi log thành công!' AS status;

END //

DELIMITER ;

CALL deposit_with_logging (3, 1000000);

SELECT * FROM accounts WHERE account_id = 3;
SELECT * FROM transactions;