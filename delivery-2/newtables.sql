use campus_eats_fall2020;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `description` varchar(75) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `fk_1_restaurant_id` (`restaurant_id`),
  CONSTRAINT `fk_1_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Table structure for table `order_items`
--
DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_1_order_id` (`order_id`),
  KEY `fk_0_menu_id` (`menu_id`),
  CONSTRAINT `fk_1_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `fk_0_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Table structure for table `order_rating`
--
DROP TABLE IF EXISTS `order_rating`;
CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`order_rating` (
  `id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `food_rating` INT NULL,
  `delivery_rating` INT NULL,
  `comments` VARCHAR(200) NULL,
  `picture` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `order_id_idx` (`order_id` ASC),
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `campus_eats_fall2020`.`order` (`order_id`))
ENGINE = InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Table structure for table `payment`
--
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` FLOAT NOT NULL,
  `delivery_charges` FLOAT NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_2_order_id` (`order_id`),
  KEY `fk_2_customer_id` (`customer_id`),
  CONSTRAINT `fk_2_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `fk_2_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Table structure for table `order_status`
--
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `status_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB;

# Insert 6 restaurants into restaurant table
insert into restaurant (location, restaurant_name, `schedule`, website) values ("9201 University City Blvd.
Charlotte, North Carolina 28223","SOVI","9am - 10pm","https://dineoncampus.com/unccharlotte"),("9201 University City Blvd.
Charlotte, North Carolina 28223","CROWNS","9am - 10pm","https://dineoncampus.com/unccharlotte"),("9201 University City Blvd.
Charlotte, North Carolina 28223","Chick-fill-a","9am - 10pm","https://dineoncampus.com/unccharlotte"),("9201 University City Blvd.
Charlotte, North Carolina 28223","CONE","9am - 10pm","https://dineoncampus.com/unccharlotte"),("9201 University City Blvd.
Charlotte, North Carolina 28223","Wendys","9am - 10pm","https://dineoncampus.com/unccharlotte"),("9201 University City Blvd.
Charlotte, North Carolina 28223","Boja","9am - 10pm","https://dineoncampus.com/unccharlotte");


--
-- Create a procedure for inserting items in the menu
--

DROP PROCEDURE IF EXISTS insert_menu;
DELIMITER //
CREATE PROCEDURE insert_menu(IN rest_name varchar(10),IN rest_id INT,IN price INT)
BEGIN
     INSERT INTO menu (`name`, description,price,restaurant_id) 
      values 
	   (CONCAT("Scrambled Eggs ", rest_name),"Cooked to perfection.",price,rest_id),
	   (CONCAT("Peas and Carrots ", rest_name),"Lightly seasoned",price,rest_id),
       (CONCAT("Roasted Yellow Squash ", rest_name),"Roasted Squash",price,rest_id),
       (CONCAT("Scrambled Eggs ", rest_name),"Cooked to perfection.",price,rest_id),
       (CONCAT("Hard Boiled Eggs ", rest_name),"Hard Boiled Eggs",price,rest_id),
       (CONCAT("Tater Tots ",rest_name),"Crispy tater puffs",price,rest_id),
       (CONCAT("Pork Sausage Link ", rest_name),"Pork Sausage Link",price,rest_id),
       (CONCAT("French Toast Sticks ", rest_name),"French Toast Sticks",price,rest_id),
       (CONCAT("Oatmeal ", rest_name),"Oatmeal",price,rest_id),
       (CONCAT("Vegan Chipotle Black Bean Patty ", rest_name),"Vegan Spicy Chipotle Black Bean Patty",price,rest_id);
 

END //

DELIMITER ;

# Insert items to the menu table
#insert_menu(restaurant_name, restaurant_id, price)
CALL insert_menu("SOVI",101,10);
CALL insert_menu("CROWNS",102,10);
CALL insert_menu("Chick",103,10);
CALL insert_menu("CONE",104,10);
CALL insert_menu("Wendys",104,10);
CALL insert_menu("Boja",121,10);



# Alter order table to include date time
ALTER TABLE `order`
ADD COLUMN order_dt_tm DATETIME NOT NULL,
ADD COLUMN order_status_id INT(11), ADD CONSTRAINT `fk_0_order_status_id` FOREIGN KEY(`order_status_id`) REFERENCES `order_status` (`status_id`);

