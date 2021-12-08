-- View 2 : Display the no_of_orders per customer
USE `campus_eats_fall2020`;
CREATE  OR REPLACE VIEW `no_of_orders_per_customer` AS
SELECT person_id as customer_id, count(*) as no_of_orders
    FROM campus_eats_fall2020.order group by person_id;;
