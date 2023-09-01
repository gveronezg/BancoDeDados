use company_constraint;
-- Expressões e concatenação de strings

-- recuperando informações dos departamentos presentes em Stanfford
select Dname as Department_Name, concat(Fname,' ',Lname) as Manager from departament d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation='Stafford' and Mgr_ssn = e.Ssn;
    
select Pnumber, Dnum, Lname, Address, Bdate, p.Plocation from departament d, project p, employee e
	where d.Dnumber = p.Dnum and p.Plocation='Stafford' and Mgr_ssn = e.Ssn;
    
select * from project;

select concat(Fname,' ', Lname) Complete_Name, Dname, Address as Department_Name from employee, departament
	where (Dno=Dnumber and Address like '%Houston%'); -- aqui trazemos tudo o que tem Houston em algum lugar da string
    
select concat(Fname,' ', Lname) Complete_Name, Address from employee
	where (Address like '%Houston%');
    
select concat(Fname,' ', Lname), Salary from employee
	where (Salary > 30000 and Salary < 40000);
    
select Fname, Lname from employee where (Salary between 20000 and 40000);