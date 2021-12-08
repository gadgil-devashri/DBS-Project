--
-- This procedure updates order table with order_dt_tm
--
DROP PROCEDURE IF EXISTS update_orders;
DELIMITER //
CREATE PROCEDURE update_orders()
BEGIN
	DECLARE x  INT;
	SET x = 1;
	order_loop: LOOP
		IF x > 101 THEN
			LEAVE order_loop;
		END IF;
      
        UPDATE `order`
		SET order_dt_tm = CAST('2021-06-25' AS DATETIME)
		where order_id = x;
		
        UPDATE `order`
		SET order_dt_tm = DATE_ADD(`order_dt_tm` , INTERVAL x DAY),
        order_status_id = x mod 6
        where order_id = x;
		SET x = x + 1;
	END LOOP;
END //
DELIMITER ;
call update_orders();


ALTER TABLE order_rating modify id int not null AUTO_INCREMENT;

--
-- This procedure inserts data into order_rating table
--
DROP PROCEDURE IF EXISTS insert_order_rating;
DELIMITER //
CREATE PROCEDURE insert_order_rating()
BEGIN
	DECLARE x  INT;
	DECLARE rating INT;
	SET x = 1;
	order_rating_loop: LOOP
		IF x > 101 THEN
			LEAVE order_rating_loop;
		END IF;
		SET rating = x mod 5;
		IF rating = 0 THEN			
			INSERT INTO order_rating(order_id,food_rating,delivery_rating,comments,picture)
			values(x,rating,5,"bad","www.picture.com");
		ELSEIF rating = 1 THEN
			INSERT INTO order_rating(order_id,food_rating,delivery_rating,comments,picture)
			values(x,rating,5,"ok","www.picture.com");
		ELSEIF rating = 2 THEN
			INSERT INTO order_rating(order_id,food_rating,delivery_rating,comments,picture)
			values(x,rating,5,"good","www.picture.com");
		ELSEIF rating = 3 THEN
			INSERT INTO order_rating(order_id,food_rating,delivery_rating,comments,picture)
			values(x,rating,5,"very good","www.picture.com");
		ELSEIF rating = 4 THEN
			INSERT INTO order_rating(order_id,food_rating,delivery_rating,comments,picture)
			values(x,rating,5,"Excellent","www.picture.com");
		END IF;
        set x = x+1;
	END LOOP;
END //
DELIMITER ;
call insert_order_rating();

--
-- This inserts amounts into newly created payment table
--
INSERT INTO payment(customer_id,order_id,amount,delivery_charges)
SELECT person_id, order_id,total_price,delivery_charge from `order`;

SET SQL_SAFE_UPDATES = 0;
delete from order_status;
SET SQL_SAFE_UPDATES = 1;

--
-- This inserts amounts into newly created order_status table
--
insert into order_status(status_id,`status`)
values(1,'In the process of being confirmed'),
(2,'Order accepted by the restaurent'),
(3,'At the restaurant'),
(4, 'Order is on the way'),
(5,'Returned');


--
-- This procedure updates order table with order status id's
--
DROP PROCEDURE IF EXISTS update_orders_status;
DELIMITER //
CREATE PROCEDURE update_orders_status()
BEGIN
	DECLARE x  INT;
    DECLARE o_status INT;
	SET x = 1;
	order_status_loop: LOOP
		IF x > 101 THEN
			LEAVE order_status_loop;
		END IF;
		SET o_status = x mod 5;
		IF o_status = 0 THEN
			SET o_status = o_status + 1;
		END IF;
        
        UPDATE `order`
		SET order_status_id = o_status 
        where order_id = x;
        
		SET x = x + 1;
	END LOOP;
END //
DELIMITER ;
call update_orders_status();


--
-- This procedure inserts data into newly created order_items table
--
DROP PROCEDURE IF EXISTS insert_order_items;
DELIMITER //
CREATE PROCEDURE insert_order_items()
BEGIN
	DECLARE x  INT;
    DECLARE o_status INT;
	SET x = 1;
	order_status_loop: LOOP
		IF x > 101 THEN
			LEAVE order_status_loop;
		END IF;
		SET o_status = x mod 4;
		IF o_status = 0 THEN
			SET o_status = o_status + 1;
		END IF;
		INSERT INTO order_items(menu_id,order_id)
		SELECT menu_id,x FROM menu ORDER BY RAND() LIMIT o_status;
		SET x = x + 1;
	END LOOP;
END //
DELIMITER ;

call insert_order_items();
