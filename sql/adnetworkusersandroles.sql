-- public.users definition

-- Drop table
-- public.roles definition

-- Drop table

DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.roles;

CREATE TABLE public.roles (
	id serial4 NOT NULL,
	"name" varchar NULL,
	CONSTRAINT roles_pk PRIMARY KEY (id)
);

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

insert into roles (name) values ('admin'), ('sales'), ('marketing');
insert into users (role_id, username, "password") values (1,'admin',crypt('test3333', gen_salt('bf')));
insert into users (role_id, username, "password") values (2,'salesguy',crypt('test2222', gen_salt('bf')));
insert into users (role_id, username, "password") values (3,'marketer',crypt('test1111', gen_salt('bf')));
