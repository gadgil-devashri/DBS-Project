DROP FUNCTION IF EXISTS driver_rating_func;
DELIMITER //
CREATE FUNCTION driver_rating_func
(
 rating INT
)
RETURNS varchar(100) 
DETERMINISTIC
BEGIN
    DECLARE rating_text varchar(100);
    IF rating = 1 THEN
		SET rating_text = "Bad driver";
	ELSEIF rating = 2 THEN
		SET rating_text = "Average driver";
	ELSEIF rating = 3 THEN
		SET rating_text = "Moderate driver";
	ELSEIF rating = 4 THEN
		SET rating_text = "Good driver";
	ELSEIF rating = 5 THEN
		SET rating_text = "Expert driver";
	END IF;
    RETURN rating_text; 
END//
DELIMITER ; 

select driver_id, driver_rating_func(rating) from driver;
