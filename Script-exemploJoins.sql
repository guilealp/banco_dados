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

INSERT INTO tipos_joins.frutas(frutas)VALUES('maçã'),('banana'),('maracuja'),('jaca'),('limão');

select * from  frutas f ;