drop database if exists tipos_joins;

create  database tipos_joins;

use tipos_joins;

create table cores( 
	id int auto_increment,
	cor varchar(50),
	primary key(id)
);
 create table frutas(
 	id int auto_increment,
 	frutas varchar(50),
 	primary key(id)
);

create table cores_frutas(
	frutas_id int not null,
	cores_id int not null,
	primary key(frutas_id,cores_id),
	constraint fk_cores_frutas_cores
		foreign key(cores_id)
		references cores(id),
	constraint fk_frutas_frutas_cores
		foreign key(frutas_id)
		references frutas(id)
);
INSERT INTO tipos_joins.cores(cor)VALUES('vermelho'),('verde'),('azul');

select * from cores c ;

INSERT INTO tipos_joins.frutas(frutas)VALUES('maçã'),('banana'),('maracuja'),('jaca'),('limão')
select * from  frutas f ;
/*
 CROSS JOIN é um tipo especial de juntar em casa linha de uma tabela é combinada com todas de outra tabela.Issoa resulta emum produto
 cartesiano entre as duas tabelas , ou seja, todas as combinações possiveis de linhas são produzidas.
 Por exemplo: temos duas tabelas, uma chamada cors e outra chamada frutas, e quremos encontrar todas as combinações possiveis de cores
 e frutas .
 */
select  c.id, c.cor,f.id ,f.frutas  from cores c cross join frutas f ;
select frutas_id,cores_id from  cores_frutas cf ;

insert  into cores_frutas (cores_id,frutas_id)
select c.id as cores_id, f.id as frutas_id from cores c cross join frutas f;

create table clientes (
	id int,
	nome varchar(50),
	primary key(id)
);
create table pedidos(
	id int,
	clientes_id int,
	data_pedido date,
	primary key(id),
	constraint fk_pedidos_clientes
		foreign key(clientes_id)
		references clientes(id)
);

insert into clientes (id,nome) values 
(1, 'joao'),
(2,'maria'),
(3,'pedro'),
(4,'juvenal'),
(5,'carlos'),
(6,'marcos');

insert  into pedidos (id, clientes_id, data_pedido)values
(101, 1, '2024-03-01'),
(102, 2 ,'2024-03-05'),
(103, 3 ,'2024-03-02'),
(104, 4 ,'2024-03-03'),
(105, 5 ,'2024-03-07'),
(106, 6 ,'2024-03-06'),
(107, 5 ,'2024-03-08'),
(108, 4 ,'2024-03-09'),
(109, 3 ,'2024-03-10');

insert into pedidos (id, data_pedido) values (110,'2024-03-11');

select * from clientes c ;
select * from pedidos ;

/*
 * inner join : retorna registro quando há pelo menos correspodencia em ambas as tabelas
 */

select c.id , c.nome, p.id , p.data_pedido, p.clientes_id from clientes c inner join pedidos p on c.id = p.clientes_id;

/*
 * neste exemplo, estamos selecionado todas as colunas das tabelas (clientes e pedidos) onde há uma correspondecia
 * entre o id na tabela clientes e o cliente_id na tabela pedido */

/*left join: retorna todos os registros da tabela da esquerda (primeira tabela mensionada) e os registros correspodentes
 * da tabela da direita*/

select c.id , c.nome, p.id, p.data_pedido, p.clientes_id from clientes c left join pedidos p on c.id = p.clientes_id;
/*aqui estamos selecionando todos os registros da tabela clientes e os resgistros correspondentes da tabela pedidos, se houver , com base
 * na correspondencia de id e cliente_id*/

/*rigth join etorna todos os registros da tabela da direita (segunda tabela mensionada) e os registros correspodentes
 * da tabela da esquerda*/

select c.id , c.nome, p.id, p.data_pedido, p.clientes_id from clientes c right join pedidos p on c.id = p.clientes_id;

/* este comando retorna todos os registros da tabela pedidos e os registros correspondentes da tabela clientes ,se houver , com base
 * na correspondencia de id e cliente_id */






















