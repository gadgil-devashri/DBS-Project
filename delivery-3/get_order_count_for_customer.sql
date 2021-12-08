-- Purpose: Display a count of the orders made by a customer for a specified date range when given a customer id
USE campus_eats_fall2020;
DROP PROCEDURE IF EXISTS get_order_count_for_customer;
DELIMITER //
CREATE PROCEDURE get_order_count_for_customer (IN customer_id INT, IN start_date DATETIME, IN end_date DATETIME, OUT order_count INT)
BEGIN
    SET order_count = 0;
    SELECT COUNT(*)
    INTO order_count 
    FROM campus_eats_fall2020.order 
    WHERE campus_eats_fall2020.order.person_id = customer_id AND campus_eats_fall2020.order.order_dt_tm BETWEEN start_date AND end_date;
END //
DELIMITER ;
CALL get_order_count_for_customer(1,'0000-00-00 00:00:00','2021-06-25 00:00:00',@Order_Count);
SELECT @Order_Count ;