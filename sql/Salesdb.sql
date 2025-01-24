DROP DATABASE salesdb;
CREATE DATABASE IF NOT EXISTS salesdb; -- create the database
USE salesdb; -- use the database for future commands

-- create a basic customers table, it's not the most robust in the world, but it'll do
CREATE TABLE IF NOT EXISTS customers (
    id int not null auto_increment,
    fname VARCHAR(50),
    lname VARCHAR(50),
    email VARCHAR(128),
    phone CHAR(10),
    b_addr1 VARCHAR(128),
    b_addr2 VARCHAR(128),
    b_zip VARCHAR(10),
    b_city VARCHAR(50),
    b_state VARCHAR(3),
    PRIMARY KEY (id)
);

-- Create the products table
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50) NOT NULL,
    purchase_price DECIMAL(10, 2) NOT NULL,
    retail_price DECIMAL(10, 2) NOT NULL,
    qty_in_stock INT NOT NULL,
    reorder_level INT NOT NULL,
    supplier VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create the orders table
CREATE TABLE IF NOT EXISTS `orders` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Create the orderdetails table
CREATE TABLE IF NOT EXISTS orderdetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity_ordered INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total DECIMAL(10, 2) AS (quantity_ordered * unit_price) STORED,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

SHOW TABLES; -- show the tables that have been created (just one)
