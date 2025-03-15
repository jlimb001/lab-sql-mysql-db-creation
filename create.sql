CREATE DATABASE IF NOT EXISTS lab_mysql;
USE lab_mysql;

DROP TABLE IF EXISTS cars;
-- Car details
CREATE TABLE cars (
car_id int AUTO_INCREMENT PRIMARY KEY,
VIN VARCHAR(17) NOT NULL,
manufacturer VARCHAR(20) NOT NULL,
model VARCHAR(20) NOT NULL,
Year DATE NOT NULL,
color VARCHAR(10) NOT NULL
);

SELECT *
FROM cars;

DROP TABLE IF EXISTS customers;

/*Customer details */
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(17) UNIQUE NOT NULL,
    phone INT NOT NULL,
    email VARCHAR(20) NOT NULL,
    address VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state CHAR(20),
    country CHAR(20)
);

DROP TABLE IF EXISTS salesperson;
/*Salesperson details */
CREATE TABLE salesperson(
staff_id int AUTO_INCREMENT PRIMARY KEY,
staff_name VARCHAR(17) UNIQUE NOT NULL,
store VARCHAR(20)
);

DROP TABLE IF EXISTS invoices;
/*Invoices details */
CREATE TABLE invoices (
    invoice_number INT AUTO_INCREMENT PRIMARY KEY, -- Primary key for the invoice table
    Date DATE NOT NULL,
    car_id INT NOT NULL, -- Foreign key referencing cars table
    customer_id INT NOT NULL, -- Foreign key referencing customers table
    staff_id INT NOT NULL, -- Foreign key referencing salespersons table
    FOREIGN KEY (car_id) REFERENCES cars(car_id) ON DELETE CASCADE, -- Links to cars table
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE, -- Links to customers table
    FOREIGN KEY (staff_id) REFERENCES salesperson(staff_id) ON DELETE CASCADE -- Links to salespersons table
);
SELECT *
FROM invoices;