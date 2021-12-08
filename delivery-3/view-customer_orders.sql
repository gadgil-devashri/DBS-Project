-- View 1 : Display the total price of the orders by each customer
USE `campus_eats_fall2020`;
CREATE  OR REPLACE VIEW `customer_orders` AS
SELECT DISTINCT person_id as customer_id,
    ROUND(total_price + delivery_charge, 2) AS order_total
    FROM campus_eats_fall2020.order 
    GROUP BY person_id;;
