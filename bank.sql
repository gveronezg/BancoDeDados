-- explorando comandos DDL

select now() as timestamp;

create database if not exists manipulation;
use manipulation;

create table bankAccounts(
	Id_account int auto_increment primary key, -- atributo integer com autonumeração e sendo chave primária
	Ag_num int not null,
    Ac_num int not null,
    Saldo float,
    constraint identification_account_constraint unique (Ag_num, Ac_num)
);

insert into bankAccounts (Ag_num,Ac_num,Saldo)
	values(156,264358,0);
select * from bankAccounts;

-- Comando DDL para alterar uma tabela já existente!
alter table bankAccounts
 add LimiteCredito float not null default 500.00;
-- Adicionando um atributo inadequadamente!
alter table bankAccounts add email varchar(60);
-- Dropando o atributo!
alter table bankAccounts drop column email;
desc bankAccounts;
-- Também é possivel modificar uma coluna
-- alter table nome_tabela modify column nome_atributo tipo_dados condições;
-- alter table nome_tabela add constraint nome_constraint condições;


create table bankClient(
	Id_Client int auto_increment,
	ClientAccount int,
    CPF char(11) not null,
    RG char(9) not null,
    Nome varchar(50) not null,
    Endereço varchar(100) not null,
    Renda_mensal float,
    primary key (Id_Client, ClientAccount),
    constraint fk_account_client foreign key (ClientAccount) references bankAccounts(Id_account)
    on update cascade
);

insert into bankClient (ClientAccount,CPF,RG,Nome,Endereço,Renda_mensal)
	values(1,12345678913,123456789,'Fulano','rua de lá',6500.6);
select * from bankClient;
alter table bankClient add UFF char(2) not null default 'RJ';
update bankClient set UFF = 'MG' where Nome='Fulano';

create table bankTransactions(
	Id_transaction int auto_increment primary key,
	Ocorrencia datetime,
	Status_transaction varchar(20),
    Valor_transferido float,
    Source_account int,
    Destination_account int,
    constraint fk_source_transaction foreign key (Source_account) references bankAccounts(Id_account),
    constraint fk_destination_transaction foreign key (Destination_account) references bankAccounts(Id_account)
);

-- comando DDL para exluir uma tabela!
-- drop table bankClient;