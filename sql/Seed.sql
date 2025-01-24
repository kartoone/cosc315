USE salesdb;
INSERT INTO customers (fname, lname, email, phone, b_addr1, b_addr2, b_zip, b_city, b_state) 
VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', '', '12345', 'Springfield', 'IL');

INSERT INTO customers (fname, lname, email, phone, b_addr1, b_addr2, b_zip, b_city, b_state) 
VALUES ('Jane', 'Smith', 'jane.smith@example.com', '2345678901', '456 Oak St', 'Apt 2B', '54321', 'Shelbyville', 'IN');

INSERT INTO customers (fname, lname, email, phone, b_addr1, b_addr2, b_zip, b_city, b_state) 
VALUES ('Robert', 'Johnson', 'robert.j@example.com', '3456789012', '789 Pine St', '', '67890', 'Metropolis', 'OH');

INSERT INTO customers (fname, lname, email, phone, b_addr1, b_addr2, b_zip, b_city, b_state) 
VALUES ('Emily', 'Davis', 'emily.d@example.com', '4567890123', '321 Maple Ave', 'Suite 5', '98765', 'Smallville', 'KS');

INSERT INTO customers (fname, lname, email, phone, b_addr1, b_addr2, b_zip, b_city, b_state) 
VALUES ('Michael', 'Brown', 'michael.b@example.com', '5678901234', '654 Cedar Blvd', '', '54321', 'Riverdale', 'CA');

INSERT INTO customers (fname, lname, email, phone, b_addr1, b_addr2, b_zip, b_city, b_state) 
VALUES ('Sarah', 'Williams', 'sarah.w@example.com', '6789012345', '987 Birch Rd', 'Building 3', '12345', 'Hill Valley', 'CO');

INSERT INTO customers (fname, lname, email, phone, b_addr1, b_addr2, b_zip, b_city, b_state) 
VALUES ('David', 'Jones', 'david.j@example.com', '7890123456', '159 Spruce Ln', '', '45678', 'Star City', 'NY');

INSERT INTO customers (fname, lname, email, phone, b_addr1, b_addr2, b_zip, b_city, b_state) 
VALUES ('Laura', 'Garcia', 'laura.g@example.com', '8901234567', '753 Aspen Way', 'Unit 101', '98765', 'Central City', 'TX');

INSERT INTO customers (fname, lname, email, phone, b_addr1, b_addr2, b_zip, b_city, b_state) 
VALUES ('James', 'Martinez', 'james.m@example.com', '9012345678', '456 Cypress Ave', '', '87654', 'Coast City', 'FL');

INSERT INTO customers (fname, lname, email, phone, b_addr1, b_addr2, b_zip, b_city, b_state) 
VALUES ('Sophia', 'Rodriguez', 'sophia.r@example.com', '0123456789', '789 Redwood St', 'Floor 2', '34567', 'Gotham', 'NJ');

-- Insert realistic data into the products table
INSERT INTO products (product_name, description, category, purchase_price, retail_price, qty_in_stock, reorder_level, supplier)
VALUES
    ('Wireless Mouse', 'Ergonomic wireless mouse with long battery life.', 'Electronics', 12.50, 25.99, 150, 50, 'TechSupplies Inc.'),
    ('USB-C Charging Cable', 'Durable 1-meter USB-C to USB-C cable.', 'Electronics', 5.00, 12.99, 200, 75, 'Gadget World'),
    ('Office Chair', 'Adjustable office chair with lumbar support.', 'Furniture', 45.00, 89.99, 50, 10, 'Home & Office Supplies'),
    ('Standing Desk', 'Electric adjustable standing desk.', 'Furniture', 150.00, 299.99, 20, 5, 'Home & Office Supplies'),
    ('Notebook', 'A5 size, 200 pages, hardcover notebook.', 'Stationery', 2.50, 5.99, 500, 100, 'Stationery Mart'),
    ('Ballpoint Pen Set', 'Set of 10 black ink ballpoint pens.', 'Stationery', 1.00, 3.99, 300, 50, 'Stationery Mart'),
    ('Bluetooth Speaker', 'Portable Bluetooth speaker with 10-hour battery life.', 'Electronics', 20.00, 49.99, 100, 30, 'TechSupplies Inc.'),
    ('Gaming Keyboard', 'Mechanical gaming keyboard with RGB backlighting.', 'Electronics', 50.00, 119.99, 25, 10, 'Gadget World'),
    ('Desk Lamp', 'LED desk lamp with adjustable brightness.', 'Furniture', 15.00, 29.99, 100, 20, 'Home & Office Supplies'),
    ('Whiteboard Markers', 'Set of 4 colored whiteboard markers.', 'Stationery', 3.00, 9.99, 200, 40, 'Stationery Mart');

-- Insert realistic data into the orders table
INSERT INTO orders (order_date, customer_id)
VALUES
    ('2025-01-01', 1),
    ('2025-01-02', 2),
    ('2025-01-03', 3),
    ('2025-01-04', 4),
    ('2025-01-04', 4),
    ('2025-01-05', 5),
    ('2025-01-06', 6),
    ('2025-01-07', 7),
    ('2025-01-08', 8),
    ('2025-01-08', 6),
    ('2025-01-09', 9),
    ('2025-01-10', 10);

-- Insert realistic data into the orderdetails table
INSERT INTO orderdetails (order_id, product_id, quantity_ordered, unit_price, status)
VALUES
    (1, 1, 2, 25.99, 'Shipped'),
    (1, 2, 1, 12.99, 'Shipped'),
    (2, 3, 1, 89.99, 'Delivered'),
    (2, 4, 1, 299.99, 'Delivered'),
    (3, 5, 5, 5.99, 'Pending'),
    (4, 6, 10, 3.99, 'Pending'),
    (5, 7, 1, 49.99, 'Cancelled'),
    (6, 8, 1, 119.99, 'Shipped'),
    (7, 9, 2, 29.99, 'Delivered'),
    (8, 10, 4, 9.99, 'Pending');