-- inserção de dados e queries
use ecommerce;

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address, Bdate
insert into clients (Fname, Minit, Lname, CPF, Address, Bdate, CNPJ) 
	   values('Maria','M','Silva', 12346789, 'rua silva de prata 29, Carangola - Cidade das flores','1990-12-01',null),
		     ('Matheus','O','Pimentel', 987654321,'rua alemeda 289, Centro - Cidade das flores','1994-07-01',null),
			 ('Ricardo','F','Silva', 45678913,'avenida alemeda vinha 1009, Centro - Cidade das flores','1991-09-12',null),
			 ('Julia','S','França', 789123456,'rua lareijras 861, Centro - Cidade das flores','1995-03-28',null),
			 ('Roberta','G','Assis', 98745631,'avenidade koller 19, Centro - Cidade das flores','1999-09-15',null),
			 ('Isabela','M','Cruz', 654789123,'rua alemeda das flores 28, Centro - Cidade das flores','1989-11-21',null),
             ('Mercado Bella', null, null, null,'rua da Glória 168, Centro - Cidade das rosas', null, 61334567900012),
             ('Fundação Aleluia', null, null, null,'rua da Paz 1288, Centro - Cidade das rosas', null, 51133967800012),
             ('Academia Gymneos', null, null, null,'rua alemeda das flores 28, Centro - Cidade das flores', null, 71134567800012);

select *  from clients;

-- idProduct, Pname, classification_kids boolean, category, rating, productDescription, price, size
insert into product (Pname, classification_kids, category, rating, productDescription, price, size) values
							  ('Fone de ouvido',false,'Eletrônico','4','Descrição produto', 201.90, null),
                              ('Barbie Elsa',true,'Brinquedos','3','Descrição produto', 109.99, null),
                              ('Body Carters',true,'Vestimenta','5','Descrição produto', 201.90, null),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4','Descrição produto', 300.90,null),
                              ('Sofá retrátil',False,'Móveis','3','Descrição produto', 708.50,'3x57x80'),
                              ('Farinha de arroz',False,'Alimentos','2','Descrição produto', 10.90,null),
                              ('Fire Stick Amazon',False,'Eletrônico','3','Descrição produto', 157.90, null);

select * from clients;
select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash


insert into orders (idOrderClient, orderStatus, orderDescription, freight, paymentCash, address) values 
							 (1,default,'compra via aplicativo',default,1,'rua silva de prata 29, Carangola - Cidade das flores'),
                             (2,default,'compra via aplicativo',50,0,'rua silva de prata 29, Carangola - Cidade das flores'),
                             (3,'Confirmado',null,default,1,'rua silva de prata 29, Carangola - Cidade das flores'),
                             (4,default,'compra via web site',150,0,'rua silva de prata 29, Carangola - Cidade das flores'),
                             (5,default,'compra via web site',150,0,'rua silva de prata 29, Carangola - Cidade das flores'),
                             (6,default,'compra via web site',150,0,'rua silva de prata 29, Carangola - Cidade das flores'),
                             (9,default,'compra via web site',150,0,'rua silva de prata 29, Carangola - Cidade das flores'),
                             (3,default,'compra via web site',150,0,'rua silva de prata 29, Carangola - Cidade das flores')
                             ;

-- idPOproduct, idPOorder, poQuantity, poStatus
select * from orders;

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1,1,2,default),
                         (2,2,1,default),
                         (3,3,1,default),
                         (3,4,1,default),
                         (7,5,1,default),
                         (5,6,1,default),
                         (6,7,10,default),
                         (4,8,1,default);

-- storageLocation,quantity
insert into stock (Slocation) values 
				('Rio de Janeiro - RJ'),
				('São Paulo - SP'),
				('Brasília - DF');
select * from stock;
-- idLproduct, idLstorage, location
insert into productStorage (idPSproduct, idPSstock, Pquantity) values
						 (1,2,500),
                         (2,3,60),
                         (3,2,700),
                         (4,2,500),
                         (5,1,400),
                         (6,1,200),
                         (7,3,350);
select * from productStorage;

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact, location) values 
							('Almeida e filhos', 12345678912345,'21985474', 'Rua Tal, 139, Uberaba - Curitiba/PR'),
                            ('Eletrônicos Silva',85451964914345,'21985484','Rua Etc, 1594, Guaíra - Goiânia/GO'),
                            ('Eletrônicos Valma', 93456789393465,'21975474','Rua Fulano, 1055, Jardim Botânico - São Paulo/SP');
                            
select * from supplier;
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPSupProduct, idPSupSupplier, PSupQuantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,3,633),
                         (3,1,50),
                         (2,1,100),
                         (4,1,50),
                         (5,1,5),
                         (6,1,5000),
                         (7,1,200);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, TradeName, CNPJ, location, contact) values 
						('Tech eletronics', 'Tech eletronics', 12345678945632,'Rio de Janeiro', 219946287),
					    ('Botique Durgas','Botique Durgas',45689012365485,'Rio de Janeiro', 219567895),
						('Kids World','Kids World', 45678912365485,'São Paulo', 1198657484);

select * from seller;
-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, quantity) values 
						 (1,4,10),
                         (2,6,50),
                         (3,2,10);
