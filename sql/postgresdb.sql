CREATE TABLE public.adtypes (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	maxduration int4 NULL,
	maxsize int4 NULL,
	CONSTRAINT adtypes_pk PRIMARY KEY (id)
);

CREATE TABLE public.ads (
	id serial4 NOT NULL,
	title varchar NOT NULL,
	adtype_id int4 NOT NULL,
	CONSTRAINT ads_pk PRIMARY KEY (id)
);

ALTER TABLE public.ads ADD CONSTRAINT ads_adtypes_fk FOREIGN KEY (adtype_id) REFERENCES public.adtypes(id) ON DELETE RESTRICT;
