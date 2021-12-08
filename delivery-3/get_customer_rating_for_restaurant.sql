-- Purpose : Display a particular customer’s rating for a restaurant

USE campus_eats_fall2020;
DROP PROCEDURE IF EXISTS get_customer_rating_for_restaurant;
DELIMITER //
CREATE PROCEDURE get_customer_rating_for_restaurant (IN restaurant_id INT, IN customer_id INT)
BEGIN
    SELECT person_id as customer_id,
    restaurant_id as restaurant_id,
    ROUND(AVG(food_rating),2) AS Food_Rating,
    ROUND(AVG(delivery_rating),2) AS Delivery_Rating,
    ROUND(Food_Rating + Delivery_Rating,0) AS Overall_Rating
    FROM order_rating 
    LEFT JOIN
    campus_eats_fall2020.order 
    ON order_rating.order_id = campus_eats_fall2020.order.order_id
    where campus_eats_fall2020.order.restaurant_id = restaurant_id AND campus_eats_fall2020.order.person_id = customer_id
    GROUP BY customer_id,restaurant_id;
END //
DELIMITER ;

CALL get_customer_rating_for_restaurant(94,94);