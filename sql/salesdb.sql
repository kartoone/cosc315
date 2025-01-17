CREATE DATABASE salesdb; -- create the database
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

SHOW TABLES; -- show the tables that have been created (just one)
DESCRIBE customers;
