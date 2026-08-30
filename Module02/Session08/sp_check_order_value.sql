DROP PROCEDURE IF EXISTS sp_check_order_value;

DELIMITER //

CREATE PROCEDURE sp_check_order_value(
	IN p_total DECIMAL(12, 2)
)
BEGIN
	IF p_total >= 5000000 THEN
		SELECT 'Đơn hàng giá trị cao' AS message;
	ELSE 
		SELECT 'Đơn hàng bình thường' AS message;
        END IF;
END //

DELIMITER ;

CALL sp_check_order_value(1000000);
