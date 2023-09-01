-- inserção de dados no bd company

use company_constraint;
show tables;

-- load data infile 'path' into table employee
-- fields terminated by ','
-- lines terminated by ';'
-- ;

insert into employee values(
	'John','B','Smith',123456789,'1965-01-09','731-Fondren-Houston-TX','M',30000,null,5),
	('Franklin','T','Wong',333445555,'1955-12-08','638-Voss-Houston-TX','M',40000,123456789,5),
    ('Alicia','J','Zelaya',999887777,'1968-01-19','3321-Castle-Spring-TX','F',25000,333445555,4),
    ('Jennifer','S','Wallace',987654321,'1941-06-20','291-Berry-Bellaire-TX','F',43000,null,4),
    ('Ramesh','K','Narayan',666884444,'1962-09-15','975-Fire-Oak-Humble-TX','M',38000,987654321,5),
    ('Joyce','A','English',453453453,'1972-07-31','5631-Rice-Houston-TX','F',25000,987654321,5),
    ('Ahmad','V','Jabbar',987987987,'1969-03-29','980-Dallas-Houston-TX','M',25000,123456789,4),
    ('James','E','Borg',888665555,'1937-11-10','450-Stone-Houston-TX','M',55000,333445555,1
);

insert into dependent values (
	'333445555','Alice','F','1986-04-05','Daughter',21),
    ('333445555','Theodore','M','1983-10-25','Son',21),
    ('333445555','Joy','F','1958-05-03','Spouse',21),
    ('987654321','Abner','M','1942-02-28','Spouse',21),
    ('123456789','Michael','M','1988-01-04','Son',21),
    ('123456789','Alice','F','1988-12-30','Daughter',21),
    ('123456789','Elizabeth','F','1967-05-05','Spouse',21
);

insert into departament values(
	'Research',5,333445555,'1988-05-22','1986-05-22'),
    ('Administration',4,987654321,'1995-01-01','1994-01-01'),
    ('Headquarters',1,888665555,'1981-06-19','1980-06-19'
);

insert into dept_locations values(
	1,'Houston'),
    (4,'Stafford'),
    (5,'Bellaire'),
    (5,'Sugarland'),
    (5,'Houston'
);

insert into project values (
	'ProductX',1,'Bellaire',5),
    ('ProductY',2,'Sugarland',5),
    ('ProductZ',3,'Houston',5),
    ('Computerization',10,'Stafford',4),
    ('Reorganization',20,'Houston',1),
    ('Newbenefits',30,'Stafford',4
);

insert into works_on values(
	123456789,1,32.5),
    (123456789,2,7.5),
    (666884444,3,40.0),
    (453453453,1,20.0),
    (453453453,2,20.0),
    (333445555,2,10.0),
    (333445555,3,10.0),
    (333445555,10,10.0),
    (333445555,20,10.0),
    (999887777,30,30.0),
    (999887777,10,10.0),
    (987987987,10,35.0),
    (987987987,30,5.0),
    (987654321,30,20.0),
    (987654321,20,15.0),
    (888665555,20,0.5
);

select * from employee;

-- gerentes e seus departamentos
select Ssn, Fname, Dname from employee e, departament d where (e.Ssn = d.Mgr_ssn);

-- recuperando os dependentes dos empregados
select Fname, Ralationship, Dependent_name from employee, dependent where Essn = Ssn;

-- buscando por nomes
select Bdate, Address from employee
	where Fname='John' and Minit='B' and Lname='Smith';

-- recuperando departamento específico
select * from departament where Dname='Research';

-- recuperando os empregados do setor de Research e mostrando seus endereços
select Fname, Lname, Address from employee, departament
	where Dname='Research' and Dnumber=Dno;
    
-- recuperando 3 tables pelos dados que são iguais entre elas
select Pname, Essn, Fname, Hours
	from project, works_on, employee
    where Pnumber = Pno and Essn = Ssn;

select * from dependent;
select * from departament;
select * from dept_locations;
select * from project;
select * from works_on;

