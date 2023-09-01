-- union, except e intersect
create database testeUniao;
use testeUniao;

create table R(
	A char(2)
);
create table S(
	A char(2)
);

insert into R(A) values ('a1'),('a2'),('a3'),('a4');
insert into S(A) values ('a1'),('a2'),('a3'),('a4'),('a5'),('a6');

select * from R;
select * from S;

-- except -> not in
select * from S where A not in (select A from R);

-- union -> retorna os elementos que aparecem pelo menos 1 vez
(select distinct R.A from R) union (select distinct S.A from S);

-- intersect
select distinct R.A from R where R.A in (select S.A from S);