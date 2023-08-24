-- Criação do Banco de Dados para ocenário de E-commerce
create database ecommerce;
use ecommerce;

-- Criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(45) not null,
    Minit char(3),
    Lname varchar(20),
    CPF char(11),
    Address varchar(255) not null,
    Bdate date,
    CNPJ char(14),
    constraint unique_cpf_client unique(CPF),
    constraint unique_cnpj_client unique(CNPJ)
    );

alter table clients auto_increment=1;

-- Criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(45) not null,
    Classification_kids bool default false,
    Category varchar(45) not null,
    rating float default 0,
    size varchar(10), -- size = dimensão do produto
    productDescription varchar(255),
    price float not null
    );

-- Criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Processando','Enviado','Entregue') default 'Processando',
    orderDescription varchar(255),
    freight float default 0,
    paymentCash bool default false,
    address varchar(255) not null,
	constraint fk_orders_client foreign key(idOrderClient) references clients(idClient)
		on update cascade
    );
    
-- Criar tabela Delivery
create table delivery(
	idDelivery int auto_increment primary key,
    idDorder int,
    trackingNumber varchar(45) not null,
    deliveryStatus enum('Em trânsito','Entregue','Não enviado','Enviado') default 'Não enviado'
    );    

-- Criar tabela pagamentos
create table payments(
	idPayment int,
    idClient int,
    typePayment enum('Débito','Crédito'),
    cardNumber varchar(45),
    cardName varchar(45),
    primary key(idClient, idPayment),
    constraint fk_payment_client foreign key (idClient) references clients(idClient)
	);
    
-- Criar tabela estoque
create table stock(
	idStock int auto_increment primary key,
    Slocation varchar(255)
    );

-- Criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(14) not null,
    contact char(11) not null,
    location varchar(255) not null,
    constraint unique_supplier unique (CNPJ)
    );

-- Criar tabela vendedor-terceiro
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    TradeName varchar(255),
    CNPJ char(14),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ)    
    );

-- criar tabela produtos_vendedor(terceiro)
create table productSeller(
	idPseller int,
    idPproduct int,
    quantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
    constraint fk_product_product foreign key(idPproduct) references product(idProduct)
    );
    
-- Criar tabela productOrder
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
	primary key (idPOproduct, idPOorder),
    constraint fk_product_order_order foreign key (idPOorder) references orders(idOrder),
    constraint fk_product_order_product foreign key (idPOproduct) references product(idProduct)
    );
    
-- Criar tabela productStorage
create table productStorage(
	idPSproduct int,
    idPSstock int,
    Pquantity int default 0,
    primary key (idPSproduct, idPSstock),
    constraint fk_productStorage_product foreign key (idPSproduct) references product(idProduct),
    constraint fk_productStorage_stock foreign key (idPSstock) references stock(idStock)
    );

-- Criar tabela productSupplier
create table productSupplier(
	idPSupProduct int,
    idPSupSupplier int,
    PSupQuantity int not null,
    primary key (idPSupProduct, idPSupSupplier),
    constraint fk_productSsupplier_product foreign key (idPSupProduct) references product(idProduct),
    constraint fk_productSupplier_supplier foreign key (idPSupSupplier) references supplier(idSupplier)
    );