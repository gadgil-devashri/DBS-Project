-- Purpose : Display total price of the orders by each customer (distinct) for a specified date range
USE campus_eats_fall2020;
DROP PROCEDURE IF EXISTS get_total_order_price_for_all_customers;
DELIMITER //
CREATE PROCEDURE get_total_order_price_for_all_customers (IN start_date DATETIME, IN end_date DATETIME)
BEGIN
    SELECT DISTINCT person_id as customer_id,
    ROUND(total_price + delivery_charge, 2) AS order_total
    FROM campus_eats_fall2020.order 
    GROUP BY person_id;
END //
DELIMITER ;
CALL get_total_order_price_for_all_customers('0000-00-00 00:00:00','2021-06-25 00:00:00');