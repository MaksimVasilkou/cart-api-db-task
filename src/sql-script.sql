create table carts (
	id uuid Primary key default uuid_generate_v4(),
   user_id uuid not null,
   created_at date not null,
   updated_at date not null,
   status status_enum DEFAULT 'OPEN'
);

create table cart_items (
	cart_id uuid,
   Foreign key ("cart_id") references "carts" ("id"),
   product_id uuid,
   count int
);

create type status_enum as ENUM ('OPEN', 'ORDERED');

create extension if not exists "uuid-ossp";

insert into carts (user_id, created_at, updated_at) values 
	(uuid_generate_v4(), NOW(), now()),
	(uuid_generate_v4(), TO_DATE('17/12/2022', 'DD/MM/YYYY'), TO_DATE('17/12/2022', 'DD/MM/YYYY')),
	(uuid_generate_v4(), TO_DATE('09/03/2023', 'DD/MM/YYYY'), TO_DATE('09/03/2023', 'DD/MM/YYYY'))

insert into cart_items (cart_id, product_id, count) values
	('b363ec3b-a497-4f29-9cda-fb368c020929', uuid_generate_v4(), 1),
	('08235207-1417-4ee7-a452-079795aedafd', uuid_generate_v4(), 2),
	('d283eafa-0c60-451c-a583-b0668145e74a', uuid_generate_v4(), 1),
	('1f44c2a4-90ee-4a68-9d37-b49cf1066cb3', uuid_generate_v4(), 1)