-- Operadores lógicos

select Bdate, Address from employee where Fname='John' and Minit='B' and Lname='Smith';

select * from departament where Dname='Research' or Dname='Administration';

select concat(Fname,' ',Lname) as Complete_Name from employee, departament where Dname='Research' and Dnumber=Dno;