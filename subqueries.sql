-- subqueries
use company_constraint;
select * from employee;
select distinct Pnumber from project
	where Pnumber in
        (select distinct Pno
			from works_on, employee
            where (Essn=Ssn and Lname='Wallace')
        )or
		(select Pnumber
			from project, departament, employee
            where (Mgr_ssn=Ssn and Lname='Smith' and Dnum=Dnumber)
        );

select distinct * from works_on
	where (Pno, Hours) in (select Pno, Hours
		from works_on
			where Essn=123456789);

-- --------------------------------------------------------------            
-- Cláusulas com exists e unique

-- Quais employees possuem dependentes?
select e.Fname, e.Lname from employee as e
	where exists (select * from dependent as d
		where e.Ssn = d.Essn and Ralationship='Son');

-- Empregados que não possuem dependentes usando o NOT EXISTS
select e.Fname, e.Lname from employee as e
	where not exists (select * from dependent as d
		where e.Ssn = d.Essn);
        
select e.Fname, e.Lname from employee as e
	where exists (select * from dependent as d
		where e.Ssn = d.Essn
        )and
        (select * from departament
			where Ssn=Mgr_ssn
		);
        
select e.Fname, e.Lname from employee as e, departament d
	where (e.Ssn = d.Mgr_ssn) and exists (select * from dependent as d where e.Ssn = d.Essn);
    
select Lname, Fname from employee
	where (select count(*) from dependent
		where Ssn=Essn)>=1;
        
select distinct Essn, Pno from works_on where Pno in (1,2,3);