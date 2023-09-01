-- Criando o Banco de Dados para o cenário de E-Commerce ----------------
create database ecommerce;
use ecommerce;
-- Criando as Tabelas ----------------

-- Clientes
create table clients(
	IdClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (CPF) -- define que o numero de cpf deve ser unico para cada registro 
);
desc clients;

-- Produtos
create table product(
	IdProduct int auto_increment primary key,
    Pnome varchar(10) not null,
    Classification_kids bool default false,
    Category enum('Eletrônicos','Vestimentas','Brinquedos','Alimentos','Móveis') not null,
    Avaliation float default 0,
    Size varchar(10) -- size equivale a dimenssão do produto
);

-- Pagamentos
-- Terminar de implementar e criar a conexão com as tabelas necessárias
-- Criar constraints relacionadas ao pagamento
create table payments(
	IdClient int primary key,
    IdPayment int,
    TypePayment enum('Boleto','Cartão','Dois Cartões'),
    LimitAvailable float,
    primary key(IdClient, Id_Payment)
);

-- Pedidos
create table orders(
	IdOrder int auto_increment primary key,
    IdOrderClient int,
    OrderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
	OrdersDescription varchar(255),
    SendValue float default 10,
    PaymentCash bool default false,
--  IdPayment...
	constraint fk_orders_client foreign key (IdOrderClient) references clients(IdClient)
);
desc orders;

-- Estoque
create table productStorage(
	IdProdStorage int auto_increment primary key,
    StorageLocation varchar(255),
    Quantity int default 0
);

-- Fornecedores
create table supplier(
	IdSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    Contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
desc supplier;

-- Vendedores
create table sellers(
	IdSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    Location varchar(255),
    Contact char(11) not null,
    constraint unique_cnpj_supplier unique (CNPJ),
    constraint unique_cpf_supplier unique (CPF)
);

create table productSeller(
	IdPSeller int,
	IdPProduct int,
    ProdQuantity int default 1,
	primary key (IdPSeller, IdPProduct),
    constraint fk_product_seller foreign key (IdPSeller) references sellers(IdSeller),
	constraint fk_product_product foreign key (IdPProduct) references product(IdProduct)
);
desc productSeller;

create table productOrder(
	IdPOProduct int,
	IdPOOrder int,
    PoQuantity int default 1,
    PoStatus enum('Disponível', 'Sem estoque') default 'Disponível',
	primary key (IdPOProduct, IdPOOrder),
    constraint fk_product_order_seller foreign key (IdPOProduct) references product(IdProduct),
	constraint fk_product_order_product foreign key (IdPOOrder) references orders(IdOrder)
);

create table storageLocation(
	IdLProduct int,
	IdLStorage int,
    Location varchar(255) not null,
	primary key (IdLProduct, IdLStorage),
    constraint fk_storage_location_product foreign key (IdLProduct) references product(IdProduct),
	constraint fk_storage_location_storage foreign key (IdLStorage) references productStorage(IdProdStorage)
);

show tables;

