CREATE TABLE users (
	user_id INT PRIMARY KEY,
    user_name VARCHAR(50) UNIQUE,
    pass_word VARCHAR(255) NOT NULL,
    status_ VARCHAR(50) DEFAULT 'ACTIVE' CHECK (status_ in ('ACTIVE', 'INACTIVE'))
);