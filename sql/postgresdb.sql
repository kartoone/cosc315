-- public.ads definition
-- Drop table
DROP TABLE IF EXISTS public.ads;
CREATE TABLE public.ads (
	id serial4 NOT NULL,
	title varchar NOT NULL,
	adtype_id int4 NOT NULL,
	CONSTRAINT ads_pk PRIMARY KEY (id)
);

-- Drop table
DROP TABLE IF EXISTS public.adtypes;
CREATE TABLE public.adtypes (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	maxduration int4 NULL,
	maxsize int4 NULL,
	CONSTRAINT adtypes_pk PRIMARY KEY (id)
);

-- public.ads foreign keys
ALTER TABLE public.ads ADD CONSTRAINT ads_adtypes_fk FOREIGN KEY (adtype_id) REFERENCES public.adtypes(id) ON DELETE RESTRICT;

-- public.adtypes definition


-- public.businesscustomers definition

-- Drop table
DROP TABLE if exists public.businesscustomers;
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

-- public.websitecustomers definition

-- Drop table
DROP TABLE if exists public.websitecustomers;
CREATE TABLE public.websitecustomers (
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
	"domain" varchar NULL
);
