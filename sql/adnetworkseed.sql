-- Insert more data into adtypes
INSERT INTO public.adtypes (name, maxduration, maxsize) VALUES
('Sidebar', 20, 300),
('Skyscraper', 40, 900),
('Native', 60, 600),
('Floating', 15, 250),
('Audio', 120, 500),
('Carousel', 50, 750);

-- Insert more data into businesscustomers
INSERT INTO public.businesscustomers (name, description, size_employees, size_revenue, mail_addr1, mail_addr2, mail_city, mail_zip, mail_state, mail_country, contact_name, contact_email, contact_phone) VALUES
('GadgetWorld', 'Online retailer for electronics', 200, 300.2, '456 Tech Street', 'Building 5', 'Austin', '73301', 'TX', 'USA', 'Tom Walker', 'twalker@gadgetworld.com', '+1-512-555-2222'),
('FitLife', 'Fitness & wellness services', 150, 120.6, '101 Gym Road', '', 'San Diego', '92101', 'CA', 'USA', 'Emma Lee', 'elee@fitlife.com', '+1-619-555-3333'),
('SmartHomes', 'Smart home automation company', 100, 250.4, '987 Innovation Dr', '', 'Boston', '02108', 'MA', 'USA', 'Robert King', 'rking@smarthomes.com', '+1-617-555-4444'),
('Wendys', 'Fast food chain', 400, 500.9, '205 Knowledge Blvd', '', 'Seattle', '98101', 'WA', 'USA', 'Sophia Clark', 'sclark@wendys.com', '+1-206-555-5555');

-- Insert more data into visitors
INSERT INTO public.visitors (unique_visitor_id, country, state, zip) VALUES
('vis001', 'USA', 'TX', '73301'),
('vis002', 'Canada', 'BC', 'V5K0A1'),
('vis003', 'UK', 'London', 'SW1A 1AA'),
('vis004', 'Germany', 'Berlin', '10115'),
('vis005', 'France', 'Paris', '75001'),
('vis006', 'USA', 'FL', '33101'),
('vis007', 'USA', 'IL', '60601'),
('vis008', 'Japan', 'Tokyo', '100-0001'),
('vis009', 'Australia', 'NSW', '2000'),
('vis010', 'India', 'MH', '400001');

-- Insert more data into websiteowners
INSERT INTO public.websiteowners (name, description, mail_addr1, mail_addr2, mail_city, mail_zip, mail_state, mail_country, contact_name, contact_email, contact_phone) VALUES
('ShopExpress', 'Multi-category online shopping', '876 Market St', '', 'San Jose', '95113', 'CA', 'USA', 'Daniel Young', 'daniel@shopexpress.com', '+1-408-555-7777'),
('MovieZone', 'Online movie streaming', '345 Cinema Rd', '', 'Orlando', '32801', 'FL', 'USA', 'Laura Kim', 'laura@moviezone.com', '+1-407-555-8888'),
('AutoDeals', 'Car sales and rentals', '999 Motorway Dr', '', 'Detroit', '48201', 'MI', 'USA', 'James Carter', 'jcarter@autodeals.com', '+1-313-555-9999'),
('GlobalNews', '24/7 news portal', '111 News Lane', '', 'New York', '10036', 'NY', 'USA', 'Anna White', 'awhite@globalnews.com', '+1-212-555-1010');

INSERT INTO public.ads
(title, adtype_id, businesscustomer_id)
VALUES('GadgetWorld Tech Sale', 1, 1);
INSERT INTO public.ads
(id, title, adtype_id, businesscustomer_id)
VALUES('FitLife Gym Discount', 2, 2);
INSERT INTO public.ads
(id, title, adtype_id, businesscustomer_id)
VALUES('Clean and fresh', 3, 3);
INSERT INTO public.ads
(id, title, adtype_id, businesscustomer_id)
VALUES('Good old fashioned burgers', 4, 3);
INSERT INTO public.ads
(id, title, adtype_id, businesscustomer_id)
VALUES('Superbowl "superbuns" commercial', 5, 3);
INSERT INTO public.ads
(id, title, adtype_id, businesscustomer_id)
VALUES('New homemade buns', 6, 3);
INSERT INTO public.ads
(id, title, adtype_id, businesscustomer_id)
VALUES('Our fries are the best', 3, 3);
INSERT INTO public.ads
(id, title, adtype_id, businesscustomer_id)
VALUES('Where''s the beef promotion', 4, 3);
INSERT INTO public.ads
(id, title, adtype_id, businesscustomer_id)
VALUES('New chicken meal promo', 1, 3);

-- Insert more data into websites with domain and reputation
INSERT INTO public.websites (websiteowner_id, domain, reputation) VALUES
(1, 'shopexpress.com', 0.85),
(2, 'moviezone.com', 0.90),
(3, 'autodeals.com', 0.75),
(4, 'globalnews.com', 0.95),
(1, 'fastbuy.com', 0.80),
(2, 'streamflix.com', 0.92),
(3, 'carznow.com', 0.78),
(4, 'worlddailynews.com', 0.88);

INSERT INTO public.categories (name, description) VALUES
('Technology', 'Websites related to technology news, trends, and advancements'),
('E-Commerce', 'Online shopping and retail platforms'),
('Education', 'Websites offering learning resources and courses'),
('Entertainment', 'Websites related to movies, music, and games');

INSERT INTO public.websitecategories (website_id, category_id, priority) VALUES
(1, 1, 1), -- Website 1 in Technology
(1, 3, 2), -- Website 1 also in Education
(2, 2, 1), -- Website 2 in E-Commerce
(2, 4, 2), -- Website 2 also in Entertainment
(3, 3, 1), -- Website 3 in Education
(3, 1, 2), -- Website 3 also in Technology
(4, 4, 1), -- Website 4 in Entertainment
(4, 2, 2); -- Website 4 also in E-Commerce

-- Insert more data into engagements
INSERT INTO public.engagements (visitor_id, ad_id, website_id, datevisited, dateclicked, useragent) VALUES
(1, 1, 1, '2024-02-19 14:00:00+00', '2024-02-19 14:01:30+00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/92.0.4515.159'),
(2, 2, 2, '2024-02-19 15:10:00+00', '2024-02-19 15:12:00+00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_4) Safari/537.36'),
(3, 3, 3, '2024-02-19 16:20:00+00', '2024-02-19 16:22:15+00', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/537.36'),
(4, 4, 4, '2024-02-20 10:30:00+00', '2024-02-20 10:31:45+00', 'Mozilla/5.0 (Linux; Android 11) Mobile Safari/537.36'),
(5, 5, 5, '2024-02-20 11:45:00+00', '2024-02-20 11:46:50+00', 'Mozilla/5.0 (Windows NT 10.0) Edge/92.0.902.78'),
(6, 6, 6, '2024-02-20 12:50:00+00', '2024-02-20 12:52:05+00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/93.0.4577.63'),
(7, 7, 7, '2024-02-21 14:00:00+00', '2024-02-21 14:01:55+00', 'Mozilla/5.0 (iPad; CPU OS 14_6 like Mac OS X) AppleWebKit/537.36'),
(8, 8, 8, '2024-02-21 15:10:00+00', '2024-02-21 15:12:20+00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Firefox/90.0'),
(1, 2, 3, '2024-02-22 09:15:00+00', '2024-02-22 09:16:45+00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/92.0.4515.159'),
(2, 3, 1, '2024-02-22 10:30:00+00', '2024-02-22 10:32:10+00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_4) Safari/537.36'),
(3, 4, 2, '2024-02-22 11:45:00+00', '2024-02-22 11:47:30+00', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/537.36'),
(4, 5, 5, '2024-02-23 08:00:00+00', '2024-02-23 08:01:20+00', 'Mozilla/5.0 (Linux; Android 11) Mobile Safari/537.36'),
(5, 6, 4, '2024-02-23 09:10:00+00', '2024-02-23 09:12:05+00', 'Mozilla/5.0 (Windows NT 10.0) Edge/92.0.902.78'),
(6, 7, 7, '2024-02-23 12:20:00+00', '2024-02-23 12:22:15+00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/93.0.4577.63'),
(7, 8, 6, '2024-02-24 14:05:00+00', '2024-02-24 14:06:50+00', 'Mozilla/5.0 (iPad; CPU OS 14_6 like Mac OS X) AppleWebKit/537.36'),
(8, 1, 8, '2024-02-24 15:30:00+00', '2024-02-24 15:32:10+00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Firefox/90.0'),
(1, 5, 2, '2024-02-25 10:40:00+00', '2024-02-25 10:42:30+00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/92.0.4515.159'),
(2, 6, 3, '2024-02-25 11:55:00+00', '2024-02-25 11:57:20+00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_4) Safari/537.36'),
(3, 7, 4, '2024-02-26 13:05:00+00', '2024-02-26 13:07:45+00', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/537.36'),
(4, 8, 1, '2024-02-26 14:20:00+00', '2024-02-26 14:22:15+00', 'Mozilla/5.0 (Linux; Android 11) Mobile Safari/537.36'),
(5, 1, 6, '2024-02-26 15:35:00+00', '2024-02-26 15:37:00+00', 'Mozilla/5.0 (Windows NT 10.0) Edge/92.0.902.78'),
(6, 2, 5, '2024-02-27 08:45:00+00', '2024-02-27 08:47:10+00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/93.0.4577.63'),
(7, 3, 7, '2024-02-27 09:55:00+00', '2024-02-27 09:57:25+00', 'Mozilla/5.0 (iPad; CPU OS 14_6 like Mac OS X) AppleWebKit/537.36'),
(8, 4, 8, '2024-02-27 11:10:00+00', '2024-02-27 11:12:50+00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) Firefox/90.0');

-- ad campaigns
INSERT INTO public.adcampaigns (id, ad_id, date_start, date_stop) VALUES
(1, 1, '2025-01-01 08:00:00+00', '2025-01-10 23:59:59+00'),
(2, 2, '2025-01-05 09:00:00+00', '2025-01-15 22:00:00+00'),
(3, 3, '2025-01-10 00:00:00+00', '2025-01-20 23:59:59+00'),
(4, 4, '2025-01-12 08:00:00+00', NULL), -- still running
(5, 5, '2025-01-15 07:30:00+00', '2025-01-25 18:00:00+00'),
(6, 6, '2025-01-18 10:00:00+00', '2025-01-28 20:00:00+00'),
(7, 7, '2025-01-20 06:00:00+00', NULL), -- still running
(8, 8, '2025-01-22 09:00:00+00', '2025-01-29 23:00:00+00');

-- ad campaign categories
INSERT INTO public.adcampaigncategories (id, adcampaign_id, category_id, negotiatedprice) VALUES
(1, 1, 1, 150.00),
(2, 1, 2, 100.00),
(3, 2, 2, 120.50),
(4, 2, 3, 110.75),
(5, 3, 1, 95.00),
(6, 3, 4, NULL),
(7, 4, 3, 130.00),
(8, 5, 1, 160.00),
(9, 5, 2, 155.00),
(10, 5, 3, NULL),
(11, 6, 4, 200.00),
(12, 7, 2, 175.50),
(13, 8, 1, NULL),
(14, 8, 3, 180.00),
(15, 8, 4, 190.00);

insert into roles (name) values ('admin'), ('sales'), ('businesscustomer');
insert into users (role_id, username, "password") values (1,'admin',crypt('test3333', gen_salt('bf')));
insert into users (role_id, username, "password") values (2,'willie',crypt('test2222', gen_salt('bf')));
insert into users (role_id, businesscustomer_id, username, "password") values (3,3,'sally',crypt('test4444', gen_salt('bf')));
insert into users (role_id, businesscustomer_id, username, "password") values (3,3,'wendys',crypt('test1111', gen_salt('bf')));
