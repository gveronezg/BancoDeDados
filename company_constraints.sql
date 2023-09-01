create schema if not exists company_constraint;

-- restrição atribuida a um domínio
# create domain D_num as int check (D_num > 0 and D_num < 21);

create table company_constraint.employee(
	Fname varchar(15) not null,
    Minit char,
	Lname varchar(15) not null,
    Ssn char(9) not null,
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int not null,
    constraint chk_salary_employee check (Salary > 2000.0),
    constraint pk_employee primary key (Ssn)
);

alter table employee
	add constraint fk_employee
    foreign key(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;

desc employee;

use company_constraint;
create table departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9) not null,
    Mgr_start_date date,
    Dept_create_date date,
    constraint chk_date_dept check (Dept_create_date < Mgr_start_date),
    constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn)
);

-- 'def', 'company_constraint', 'departament_ibfk_1', 'company_constraint', 'departament', 'FOREIGN KEY', 'YES'
alter table departament drop constraint departament_ibfk_1;
alter table departament
	add constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn)
    on update cascade;

desc departament;
create table dept_locations(
	Dnumber int not null,
    Dlocation varchar(15) not null,
    constraint pk_dept_locations primary key (Dnumber, Dlocation),
    constraint fk_dept_locations foreign key (Dnumber) references departament (Dnumber)
);

alter table dept_locations drop constraint fk_dept_locations;
alter table dept_locations
	add constraint fk_dept_locations foreign key(Dnumber) references departament (Dnumber)
    on delete cascade
    on update cascade;

create table project(
	Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    constraint unique_project unique (Pname),
    constraint fk_project foreign key (Dnum) references departament(Dnumber)
);
create table works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    primary key (Essn, Pno),
    constraint fk_works_on foreign key (Essn) references employee(Ssn),
    constraint fk_works_on_proj foreign key (Pno) references project(Pnumber)
);
create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char, -- F ou M
    Bdate date,
    Ralationship varchar(8),
    Age int not null,
    constraint chk_age_dependent check (Age < 22),
    primary key (Essn, Dependent_name),
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
);

alter table dept_locations drop constraint fk_dept_locations;
alter table dept_locations
	add constraint fk_dept_locations foreign key(Dnumber) references departament (Dnumber)
    on delete cascade
    on update cascade;

show tables;
desc dependent;

select * from information_schema.table_constraints
	where constraint_schema = 'company_constraint';
    
select * from information_schema.referential_constraints
	where constraint_schema = 'company_constraint';