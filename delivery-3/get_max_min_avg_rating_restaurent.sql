-- Display the max, min and average ratings for each feature when given a restaurant ID for all orders for that restaurant

USE campus_eats_fall2020;
DROP PROCEDURE IF EXISTS get_min_max_avg_rating_for_restaurant;
DELIMITER //
CREATE PROCEDURE get_min_max_avg_rating_for_restaurant (IN restaurant_id INT(50), OUT max_food INT, OUT min_food INT, OUT avg_food INT, OUT max_del INT, OUT min_del INT, OUT avg_del INT)
BEGIN
    SET max_food = 0;
	SET min_food = 0;
    SET avg_food = 0;
    SET max_del = 0;
    SET min_del = 0;
    SET avg_del = 0;
    
    SELECT MAX(food_rating) 
    INTO max_food 
    FROM order_rating 
    LEFT JOIN campus_eats_fall2020.order 
    ON order_rating.order_id = campus_eats_fall2020.order.order_id
    where campus_eats_fall2020.order.restaurant_id = restaurant_id;
    
    SELECT MIN(food_rating) 
    INTO min_food 
    FROM order_rating 
    LEFT JOIN campus_eats_fall2020.order 
    ON order_rating.order_id = campus_eats_fall2020.order.order_id
    where campus_eats_fall2020.order.restaurant_id = restaurant_id;
    
    SELECT AVG(food_rating) 
    INTO avg_food 
    FROM order_rating 
    LEFT JOIN campus_eats_fall2020.order 
    ON order_rating.order_id = campus_eats_fall2020.order.order_id
    where campus_eats_fall2020.order.restaurant_id = restaurant_id;
    
    SELECT MAX(delivery_rating) 
    INTO max_del 
    FROM order_rating 
    LEFT JOIN campus_eats_fall2020.order 
    ON order_rating.order_id = campus_eats_fall2020.order.order_id
    where campus_eats_fall2020.order.restaurant_id = restaurant_id;
    
    SELECT MIN(delivery_rating) 
    INTO min_del 
    FROM order_rating 
    LEFT JOIN campus_eats_fall2020.order 
    ON order_rating.order_id = campus_eats_fall2020.order.order_id
    where campus_eats_fall2020.order.restaurant_id = restaurant_id;
    
    SELECT AVG(delivery_rating) 
    INTO avg_del 
    FROM order_rating 
    LEFT JOIN campus_eats_fall2020.order 
    ON order_rating.order_id = campus_eats_fall2020.order.order_id
    where campus_eats_fall2020.order.restaurant_id = restaurant_id;
    
END //
DELIMITER ;
CALL get_min_max_avg_rating_for_restaurant(9,@Max_Food_Rating,@Min_Food_Rating, @Avg_Food_Rating, @Max_Del_Rating, @Min_Del_Rating, @Avg_Del_Rating);
SELECT @Max_Food_Rating, @Min_Food_Rating, @Avg_Food_Rating, @Max_Del_Rating, @Min_Del_Rating, @Avg_Del_Rating ;