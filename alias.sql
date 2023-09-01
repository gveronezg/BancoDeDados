show databases;

use company_constraint;

-- Dnumber: department
desc dapartament;
desc dept_locations;

select * from departament;
select * from dept_locations;

-- retirando a ambiguidade através do alias ou AS Statement
select Dname, l.Dlocation as Department_name
	from departament as d, dept_locations as l
    where d.Dnumber = l.Dnumber;

-- concatenando o nome dos empregados
select concat(Fname, ' ', Lname) as Employee from employee;

-- Expressões e alias...

-- aqui vamos calcular o inss do funcionário utilizando esta função que faz a multiplicação do devido valor, atribui o nome de INSS para a coluna temporária e arredonda para 2 casas decimais
select Fname, Lname, Salary, round(Salary*0.011,2) as INSS from employee;

-- definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
select * from employee as e, works_on as w, project as p
	where (e.Ssn = w.Essn and w.Pno=Pnumber and p.Pname='ProductX');
    
select concat(Fname,' ',Lname) as Complete_name, Salary, round(Salary*1.1,2) as increased_salary
from employee as e, works_on as w, project as p
	where (e.Ssn = w.Essn and w.Pno=Pnumber and p.Pname='ProductX');