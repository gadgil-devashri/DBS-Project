CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`order_rating` (
  `id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `food_rating` INT NULL,
  `delivery_rating` INT NULL,
  `comments` VARCHAR(200) NULL,
  `picture` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `campus_eats_fall2020`.`order` (`order_id`))
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`payment` (
  `payment_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `amount` FLOAT NOT NULL,
  `delivery_charges` FLOAT NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `campus_eats_fall2020`.`order` (`order_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `campus_eats_fall2020`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `campus_eats_fall2020`.`order_status` (
  `status_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB
