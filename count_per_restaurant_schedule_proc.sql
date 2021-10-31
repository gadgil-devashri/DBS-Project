-- Purpose : This procedure intends to find out count of restaurants available during input schedule
-- Total Restaurants field is printed to verify the results by summation of restaurants available in each schedule. 

USE campus_eats_fall2020;
DROP PROCEDURE IF EXISTS count_per_restaurant_schedule;
DELIMITER //
CREATE PROCEDURE count_per_restaurant_schedule (IN schedule1 VARCHAR(50), IN schedule2 VARCHAR(50), IN schedule3 VARCHAR(50), OUT count_schedule1 INT, OUT count_schedule2 INT, OUT count_schedule3 INT, OUT total_restaurants INT)
BEGIN
    SET total_restaurants = 0;
	SET count_schedule1 = 0;
    SET count_schedule2 = 0;
    SET count_schedule3 = 0;
    SELECT COUNT(*) INTO total_restaurants FROM restaurant;
    SELECT COUNT(*) INTO count_schedule1 FROM restaurant WHERE schedule = schedule1;
    SELECT COUNT(*) INTO count_schedule2 FROM restaurant WHERE schedule = schedule2;
    SELECT COUNT(*) INTO count_schedule3 FROM restaurant WHERE schedule = schedule3;
END //
DELIMITER ;
CALL count_per_restaurant_schedule('9am -10pm','10am - 9pm','11am - 11pm',@Restaurants_Available_9AM_10PM, @Restaurants_Available_10AM_9PM, @Restaurants_Available_11AM_11PM, @Total_Restaurants);
SELECT @Restaurants_Available_9AM_10PM, @Restaurants_Available_10AM_9PM, @Restaurants_Available_11AM_11PM, @Total_Restaurants
