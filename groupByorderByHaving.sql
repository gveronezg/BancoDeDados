-- funções e cláusulas de agrupamento
select * from employee;
select count(*) from employee;
select count(*) from employee, departament
	where Dno=Dnumber and Dname='Research';
    
select Dno, count(*) as Number_of_employees, round(avg(Salary),2) as Salary_avg from employee
	group by Dno;
    
select Pnumber, Pname, count(*)
	from project, works_on
    where Pnumber = Pno
    group by Pnumber, Pname;

select count(distinct Salary) from employee;

select sum(Salary) as Total_sal, max(Salary) as Max_sal, min(Salary) as Min_sal, avg(Salary) as Media_sal from employee;

select sum(Salary), max(Salary), min(Salary), avg(Salary)
	from (employee join departament on Dno=Dnumber)
    where Dname='Research';

-- group by --------------------------------------------------------

select Pnumber, Pname, count(*) as Number_of_register, round(avg(Salary),2) as AVG_Salary
	from project, works_on, employee
	where Pnumber = Pno and Ssn = Essn
    group by Pnumber
    order by Pnumber asc, avg(Salary) desc;

-- having --------------------------------------------------------

select Pnumber, Pname, count(*)
	from project, works_on
	where Pnumber = Pno
    group by Pnumber, Pname
    having count(*) > 2;
    
select Dno, count(*)
	from employee
    where Salary > 30000
    group by Dno
    having count(*)>=2;
    
select Dno as Departament, count(*) as Number_Of_Employees from employee
	where (Salary > 20000)
		and Dno in (select Dno from employee
			group by Dno
			having count(*)>2)
	group by Dno;