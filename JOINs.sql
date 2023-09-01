-- JOIN Statement

-- JOIN
desc employee;
desc works_on;

-- sem JOIN
select * from employee, works_on where Ssn=Essn;
-- com JOIN
select * from employee JOIN works_on;

-- JOIN ON -> INNER JOIN ON
select * from employee JOIN works_on on Ssn=Essn;
select * from employee JOIN departament on Ssn=Mgr_ssn;
-- 
select Fname, Lname, Address
	from (employee join departament on Dno=Dnumber)
		where Dname = 'Research';
--
select * from dept_locations;	-- address e Dnumber
select * from departament;		-- Dname, Dept_create_date
--
select Dname as Department, Dept_create_date as Start_Date, Dlocation as Location
	from departament join dept_locations using (Dnumber) -- {using (Dnumber)} = é igual = {on d1.Dnumber = d2.Dnumber}
    order by Start_Date;

-- CROSS JOIN - produto cartesiano
select * from employee cross join dependent;

-- JOIN com 3 ou mais tabelas ------------------------------------------------------------------------------------------------------------------------------

-- project, works_on, employee
select concat(Fname,' ',Lname) as Complete_name, Dno as DeptNumber,
	Pname as ProjectName, Pno as ProjectNumber, Plocation as Location from employee
	inner join works_on on Ssn = Essn
    inner join project on Pno = Pnumber
    where Pname like 'Product%'
    order by Pnumber;

-- departament, dept_location, employee
select Dnumber, Dname, concat(Fname,' ',Lname),
	Salary, round(Salary*0.05,2) as Bonus from departament
	inner join dept_locations using(Dnumber)
    inner join (dependent inner join employee on Ssn = Essn) on Ssn = Mgr_ssn
    group by Dnumber
--  having count(*)>1
	;

-- departament, project, employee

-- OUTER JOIN -------------------------------------------------------------------------------------------------------------------------------------------------

use company_constraint;
select * from employee;
select * from dependent;

select * from employee inner join dependent on Ssn = Essn;
select * from employee left join dependent on Ssn = Essn;
