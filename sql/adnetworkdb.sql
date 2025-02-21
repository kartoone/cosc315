-- public.adtypes definition

-- Drop table

DROP TABLE if exists public.engagements;
DROP TABLE if exists public.websites;
DROP table if exists public.ads;
DROP TABLE if exists public.websitecustomers;
DROP TABLE if exists public.websiteowners;
DROP TABLE if exists public.visitors;
DROP TABLE if exists public.businesscustomers;
DROP TABLE if exists public.adtypes;

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

-- public.engagements definition

-- Drop table


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
