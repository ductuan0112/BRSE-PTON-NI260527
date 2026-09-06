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
    fromaccount_id INT NOT NULL,
    toaccount_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fromaccount_id) REFERENCES accounts(account_id),
    FOREIGN KEY (toaccount_id) REFERENCES accounts(account_id)
);

INSERT INTO accounts (account_name, balance)
VALUES
    ('Nguyen Van An', 5000000.00),
    ('Tran Thi Binh', 10000000.00),
    ('Le Van Cuong', 7500000.00),
    ('Pham Thi Dung', 12000000.00),
    ('Hoang Van Giang', 3000000.00),
    ('Vo Thi Hanh', 15000000.00),
    ('Do Van Khoa', 8000000.00),
    ('Bui Thi Linh', 4500000.00),
    ('Dang Van Minh', 20000000.00),
    ('Phan Thi Nam', 6500000.00);
    
SELECT * 
FROM accounts
WHERE account_id = 1;

START TRANSACTION;

	UPDATE accounts
    SET balance = balance + 1000000
    WHERE account_id = 1;
    
COMMIT;

SELECT * 
FROM accounts
WHERE account_id = 1;