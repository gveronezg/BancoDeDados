# show databases;
# create database if not exists firstExample;
use firstExample;
/*CREATE TABLE person(
	person_id smallint unsigned,
	fname varchar(20),
	lname varchar(20),
	gender enum('M','F', 'Others'),
	birth_date DATE,
	street varchar(30),
	city varchar(20),
	state varchar(20),
	postal_code varchar(20),
    constraint pk_person primary key (person_id)
);*/
# desc person;
/*create table favorite_food(
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_favorite_food_person_id foreign key (person_id)
    references person(person_id)
);*/
# desc favorite_food;
# show databases;
# select * from information_schema.table_constraints
# where constraint_schema = 'firstExample';
# desc information_schema.table_constraints;
# select constraint_name from information_schema.table_constraints;
# where table_name = 'person';

# desc person;
insert into person values(
	'6',
    'Chama',
    'NoBigode',
    'M',
    '2000-12-21',
    'rua Dos Bobos',
    'Cidade Teyba',
    'AC',
    'Brasil',
    '26054-98'
);
select * from person;
# delete from person where person_id = 1 or person_id = 2;
# ALTER TABLE person ADD Column country varchar(20) after state;
# ALTER TABLE person drop Column country;
# rollback;

insert into favorite_food values
	(1,'lasanha'),
    (2,'carna assada'),
    (6,'peixe');
select * from favorite_food;