-- public.users definition

-- Drop table
-- public.roles definition

-- Drop table

-- DROP TABLE public.roles;

CREATE TABLE public.roles (
	id serial4 NOT NULL,
	"name" varchar NULL,
	CONSTRAINT roles_pk PRIMARY KEY (id)
);
-- DROP TABLE public.users;

CREATE TABLE public.users (
	id serial4 NOT NULL,
	role_id int4 NULL,
	username varchar NULL,
	"password" varchar NULL,
	CONSTRAINT users_pk PRIMARY KEY (id),
	CONSTRAINT users_unique UNIQUE (username)
);


-- public.users foreign keys

ALTER TABLE public.users ADD CONSTRAINT users_roles_fk FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE SET NULL ON UPDATE CASCADE;

