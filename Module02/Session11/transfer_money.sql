DROP DATABASE IF EXISTS account_management;
CREATE DATABASE account_management;

USE account_management;

CREATE TABLE accounts (
	account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_name VARCHAR(100) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL
);

INSERT INTO accounts (account_id, account_name, balance)
VALUES 
	(4, 'Tài khoản A', 2000000),
    (5, 'Tài khhoản B', 0);
    
DELIMITER //

DROP PROCEDURE IF EXISTS transfer_money //
CREATE PROCEDURE transfer_money (
	IN p_sender_id INT,
    IN p_receiver_id INT,
    IN p_amount DECIMAL(10, 2)
)
BEGIN
    DECLARE v_balance DECIMAL(10, 2);
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SELECT 'Đã xảy ra lỗi hệ thống! Giao dịch bị hủy.' AS status;
    END;

    START TRANSACTION;
		UPDATE accounts
        SET balance = balance - p_amount
        WHERE account_id = p_sender_id;
        
        UPDATE accounts
        SET balance = balance + p_amount
        WHERE account_id = p_receiver_id;
        
        SELECT balance 
        INTO v_balance
        FROM accounts
        WHERE account_id = p_sender_id;
        
        IF v_balance < 0 THEN
			ROLLBACK;
            SELECT 'Số dư không đủ để thực hiện giao dịch' AS message;
		ELSE
			COMMIT;
            SELECT 'Chuyển tiền thành công' AS message;
		END IF;
        
END //

DELIMITER ;

CALL transfer_money(4, 5, 300000);
SELECT * FROM accounts;