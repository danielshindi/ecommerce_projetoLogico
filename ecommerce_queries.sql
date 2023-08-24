-- Recupera o número de clientes cadastrados
select count(*) from clients;

-- Recupera os pedidos realizados pelos clientes
-- Ocorre um problema no retorno do nome caso o cliente seja pessoa jurídica, retornando NULL
select c.idClient, concat(Fname,' ',Minit,' ', Lname) as Client, CPF, CNPJ, o.idOrder, o.orderStatus, o.orderDescription, o.address
	from clients c, orders o where c.idClient = idOrderClient;

-- Recupera o status dos pedidos dos clientes
-- Ocorre um problema no retorno do nome caso o cliente seja pessoa jurídica, retornando NULL
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;


-- Recupera a quantidade de pedidos                            
select count(*) from clients c, orders o 
			where c.idClient = idOrderClient;

select * from orders;

-- Recupera os dados de todos os clientes e seus pedidos
select * from clients
	left outer join orders on idClient = idOrderClient;

-- Recupera os dados dos clientes que realizaram pedidos e seus pedidos
select * from clients inner join orders on idClient = idOrderClient;

-- recuperação de pedido com produto associado
select * from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder p on p.idPOorder = o.idOrder; 
        
-- Recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by c.idClient;
        
select * from product;
select * from productorder;

-- Recupera o valor total de cada pedido associado a seu cliente, ordenado por id do cliente
select c.idClient, Fname, CPF, CNPJ, o.idOrder, round((freight + price * poQuantity),2) as Total_value from clients c inner join orders o on c.idClient = o.idOrderClient
	inner join productOrder po on po.idPOorder = o.idOrder
    inner join product p on po.idPOproduct = p.idProduct
    order by c.idClient;
    
-- Recupera o valor total de cada pedido associado a seu cliente para pedidos com valor acima de 400, ordenado por valor total de forma descendente
select c.idClient, Fname, CPF, CNPJ, o.idOrder, round((freight + price * poQuantity),2) as Total_value from (clients c inner join orders o on c.idClient = o.idOrderClient
	inner join productOrder po on po.idPOorder = o.idOrder
    inner join product p on po.idPOproduct = p.idProduct)
    where (freight + price * poQuantity) > 400
    order by Total_value desc;
    
-- Recupar clientes que possuem mais de um pedido
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by c.idClient
        having Number_of_orders > 1;