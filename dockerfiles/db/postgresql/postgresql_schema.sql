-- Sample table creation schema

create table configuration(
id serial primary key,
key varchar(255),
status int,
value varchar(255),
version int);
