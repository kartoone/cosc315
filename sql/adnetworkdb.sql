-- public.adtypes definition

-- Drop table

DROP TABLE if exists public.adcampaigncategories;
DROP TABLE if exists public.adcampaigns;
DROP TABLE if exists public.engagements;
DROP TABLE if exists public.websitecategories;
DROP TABLE if exists public.websites;
DROP table if exists public.ads;
DROP TABLE if exists public.websitecustomers;
DROP TABLE if exists public.websiteowners;
DROP TABLE if exists public.visitors;
DROP TABLE if exists public.businesscustomers;
DROP TABLE if exists public.adtypes;
DROP TABLE if exists public.categories;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.roles;

CREATE TABLE public.roles (
	id serial4 NOT NULL,
	"name" varchar NULL,
	CONSTRAINT roles_pk PRIMARY KEY (id)
);

CREATE TABLE public.categories (
	id serial4 NOT NULL,
	"name" varchar NULL,
	description text NULL,
	CONSTRAINT categories_pk PRIMARY KEY (id)
);

CREATE TABLE public.adtypes (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	maxduration int4 NULL,
	maxsize int4 NULL,
	CONSTRAINT adtypes_pk PRIMARY KEY (id)
);


-- public.businesscustomers definition

-- Drop table


CREATE TABLE public.businesscustomers (
	id serial4 NOT NULL,
	"name" varchar NULL,
	description text NULL,
	size_employees int4 NULL,
	size_revenue float4 NULL,
	mail_addr1 varchar NULL,
	mail_addr2 varchar NULL,
	mail_city varchar NULL,
	mail_zip varchar NULL,
	mail_state varchar NULL,
	mail_country varchar NULL,
	contact_name varchar NULL,
	contact_email varchar NULL,
	contact_phone varchar NULL,
	CONSTRAINT businesscustomers_pk PRIMARY KEY (id)
);

CREATE TABLE public.users (
	id serial4 NOT NULL,
	role_id int4 NULL,
	businesscustomer_id int4 NULL,
	username varchar NULL,
	"password" varchar NULL,
	CONSTRAINT users_pk PRIMARY KEY (id),
	CONSTRAINT users_unique UNIQUE (username)
);

-- public.users foreign keys

ALTER TABLE public.users ADD CONSTRAINT users_roles_fk FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE public.users ADD CONSTRAINT bc_fk FOREIGN KEY (businesscustomer_id) REFERENCES public.businesscustomers(id) ON DELETE SET NULL ON UPDATE CASCADE;

-- public.visitors definition

-- Drop table


CREATE TABLE public.visitors (
	id serial4 NOT NULL,
	unique_visitor_id varchar NULL,
	country varchar NULL,
	state varchar NULL,
	zip varchar NULL,
	CONSTRAINT visitors_pk PRIMARY KEY (id)
);


-- public.websitecustomers definition

-- Drop table


CREATE TABLE public.websiteowners (
	id serial4 NOT NULL,
	"name" varchar NULL,
	description text NULL,
	mail_addr1 varchar NULL,
	mail_addr2 varchar NULL,
	mail_city varchar NULL,
	mail_zip varchar NULL,
	mail_state varchar NULL,
	mail_country varchar NULL,
	contact_name varchar NULL,
	contact_email varchar NULL,
	contact_phone varchar NULL,
	CONSTRAINT websiteowners_pk PRIMARY KEY (id)
);


-- public.ads definition

-- Drop table


CREATE TABLE public.ads (
	id serial4 NOT NULL,
	title varchar NOT NULL,
	adtype_id int4 NOT NULL,
	businesscustomer_id int4 NULL,
	CONSTRAINT ads_pk PRIMARY KEY (id),
	CONSTRAINT ads_adtypes_fk FOREIGN KEY (adtype_id) REFERENCES public.adtypes(id) ON DELETE RESTRICT,
	CONSTRAINT ads_businesscustomers_fk FOREIGN KEY (businesscustomer_id) REFERENCES public.businesscustomers(id) ON DELETE SET NULL ON UPDATE CASCADE
);


-- public.websites definition

-- Drop table


-- public.websites definition

-- Drop table

-- DROP TABLE public.websites;

CREATE TABLE public.websites (
	id serial4 NOT NULL,
	websiteowner_id int4 NOT NULL,
	"domain" varchar NULL,
	reputation varchar NULL, -- a number between 0 and 1 where 0 is worst and 1 is better reputation ... determined at signup by evaluating the website in the most effective way possible
	CONSTRAINT websites_pk PRIMARY KEY (id)
);

-- Column comments

COMMENT ON COLUMN public.websites.reputation IS 'a number between 0 and 1 where 0 is worst and 1 is better reputation ... determined at signup by evaluating the website in the most effective way possible';

-- public.websites foreign keys

ALTER TABLE public.websites ADD CONSTRAINT websites_websitecustomers_fk FOREIGN KEY (websiteowner_id) REFERENCES public.websiteowners(id) ON DELETE SET NULL ON UPDATE CASCADE;

-- public.websitecategories definition

-- Drop table

-- DROP TABLE public.websitecategories;

CREATE TABLE public.websitecategories (
	id serial4 NOT NULL,
	website_id int4 NOT NULL,
	category_id int4 NOT NULL,
	priority int4 NULL,
	CONSTRAINT websitecategories_pk PRIMARY KEY (id),
	CONSTRAINT websitecategories_categories_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT websitecategories_websites_fk FOREIGN KEY (website_id) REFERENCES public.websites(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE public.engagements (
	id serial4 NOT NULL,
	visitor_id int4 NULL,
	ad_id int4 NULL,
	website_id int4 NULL,
	datevisited timestamptz NOT NULL,
	dateclicked timestamptz NOT NULL,
	useragent varchar NULL,
	CONSTRAINT engagements_pk PRIMARY KEY (id),
	CONSTRAINT engagements_ads_fk FOREIGN KEY (ad_id) REFERENCES public.ads(id) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT engagements_visitors_fk FOREIGN KEY (visitor_id) REFERENCES public.visitors(id) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT engagements_websites_fk FOREIGN KEY (website_id) REFERENCES public.websites(id) ON DELETE SET NULL ON UPDATE CASCADE
);
