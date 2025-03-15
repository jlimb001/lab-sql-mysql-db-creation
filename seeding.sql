SELECT * 
FROM lab_mysql.cars;

INSERT INTO lab_mysql.cars (car_id, VIN, manufacturer, model, year, color)
VALUES (1, '3K096I98581DHSNUP', 'Volkswagen',' Tiguan', 2019, 'Blue'),
       (2, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
       (3, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
       (4, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAVA', 2018, 'Silver'),
       (5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
       (6, 'DAM41UDN3CHU2WVF6', 'Volvo', 'Cross Country', 2019, 'Gray');
       
select *
FROM cars;SELECT * 
FROM lab_mysql.cars;

INSERT INTO lab_mysql.cars (car_id, VIN, manufacturer, model, year, color)
VALUES (1, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
       (2, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
       (3, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
       (4, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
       (5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
       (6, 'DAM41UDN3CHU2WVF6', 'Volvo', 'Cross Country', 2019, 'Gray');
       
SELECT *
FROM cars
LIMIT 2;

DESCRIBE customers;
SET sql_mode = '';
INSERT INTO lab_mysql.customers (customer_id, customer_name, phone, email, address, city, state, country)
VALUES ('10001', 'Pablo Picasso', '+34636176382', 'popicasso@gmail.com', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain'),
       ('20001', 'Ralf Mercedes', '+1985743218', 'ralf_mercedes00@gmail.com', '120 SW 8th St', 'Miami', 'Florida', 'USA'),
       ('30001', 'Lauren Atom', '+33458328349', 'atom_lauren@gmail.com', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France'),
       ('40001', 'Ruma Randol', '+351214359486', 'rumarando1@gmail.com', 'Rua Barbadosa', 'Avenida', 'Lisboa', 'Portugal');

SELECT *
FROM customers
LIMIT 2;

INSERT INTO lab_mysql.salesperson (staff_id, staff_name, store)
VALUES (00001, 'Peter Cruiser', 'Madrid'),
       (00002, 'Anna Sthesia', 'Barcelona'),
       (00003, 'Paul Molive', 'Berlin'),
       (00004, 'Gail Forcewind', 'Paris'),
       (00005, 'Paige Turner', 'Mimia'),
       (00006, 'Bob Frapples', 'Mexico City'),
       (00007, 'Walter Melon', 'Amsterdam'),
       (00008, 'Shonda Leer', 'Sao Paulo'),
       (00009, 'Chris Santos', 'Lisbon');
       
SELECT *
FROM salesperson
LIMIT 3;
 
SELECT * FROM lab_mysql.invoices WHERE invoice_number = 852399038;

SET foreign_key_checks = 0;
INSERT INTO lab_mysql.invoices (invoice_number, Date, car_id, customer_id, staff_id)
VALUES (852399038, '2018-08-22', 1, 1, 3),
       (731166526, '2018-12-31', 3, 3, 5),
       (271135104, '2019-01-22', 2, 2, 7)
ON DUPLICATE KEY UPDATE
	Date = VALUES(Date),
    car_id = VALUES(car_id),
    customer_id = VALUES(customer_id),
    staff_id = VALUES(staff_id);

-- Ensure the new values exist in referenced tables before updating
SELECT * FROM cars WHERE car_id = 5;
SELECT * FROM customers WHERE customer_id = 10;
SELECT * FROM staff WHERE staff_id = 3;

UPDATE invoices
SET 
    car_id = 5, 
    customer_id = 10, 
    staff_id = 3
WHERE invoice_number = 852399038;  -- Replace with actual condition

SET foreign_key_checks = 1;

SELECT *
FROM invoices;

