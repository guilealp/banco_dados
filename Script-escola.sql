drop database if exists escola;

create database escola;

use escola;

create table alunos(
	id int not null auto_increment,
	nome varchar(80) not null,
	numero_identificador varchar(9)not null unique,
	data_nacimento date not null,
	endereco varchar(100) not null,
	primary key(id)
);	

create table professor(
	id int not null auto_increment,
	nome varchar(80)not null,
	numero_identificador varchar(9) not null unique,
	especialidade varchar(45) not null ,
	grau_academico varchar(45)not null,
	primary key(id)
);
create table disciplina(
	id int not null auto_increment,
	nome varchar(45) not null,
	numero_identificador varchar(45)not null unique,
	professor_id int null,
	primary key (id),
	constraint fk_professor_disciplina
		foreign key (professor_id)
		references professor(id)
);
create table notas(
	id int not null auto_increment,
	notas decimal(5,2)not null,
	alunos_id int not null,
	disciplina_id int not null,
	primary key (id),
	constraint fk_alunos_notas
		foreign key(alunos_id)
		references alunos(id),
	constraint fk_disciplina_notas
		foreign key(disciplina_id)
		references disciplina(id)
);
create table alunos_por_disciplina(
	alunos_id int not null,
	disciplina_id int not null,
	constraint fk_alunos_alunos_por_disciplinas
		foreign key(alunos_id)
		references alunos(id),
	constraint fk_disciplina_alunos_por_disciplinas
		foreign key(disciplina_id)
		references disciplina(id)
); 

INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 1', '1', '2000-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 2', '2', '2000-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 3', '3', '2001-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 4', '4', '2001-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 5', '5', '2002-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 6', '6', '2002-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 7', '7', '2003-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 8', '8', '2003-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 9', '9', '2004-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 10', '10', '2004-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 11', '11', '2005-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 12', '12', '2005-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 13', '13', '2006-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 14', '14', '2006-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 15', '15', '2007-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 16', '16', '2007-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 17', '17', '2008-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 18', '18', '2008-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 19', '19', '2009-03-04','rua mario costa');
INSERT INTO alunos (nome, numero_identificador, data_nacimento,endereco) VALUES ('aluno 20', '20', '2009-03-04','rua mario costa');

select * from alunos a;

INSERT INTO professor  (nome, numero_identificador, especialidade,grau_academico) VALUES ('professor 1', '1', 'fisica','pos-graduado');
INSERT INTO professor  (nome, numero_identificador, especialidade,grau_academico) VALUES ('professor 2', '2', 'matematica','mestrado');
INSERT INTO professor  (nome, numero_identificador, especialidade,grau_academico) VALUES ('professor 4', '4', 'portugues','doutorado');

select * from professor p ;

INSERT INTO disciplina (nome, numero_identificador,professor_id) VALUES ('fisica ', '1','1');
INSERT INTO disciplina  (nome, numero_identificador,professor_id) VALUES ('historia', '2','1');
INSERT INTO disciplina  (nome, numero_identificador,professor_id) VALUES ('portugues ', '3','3');
INSERT INTO disciplina  (nome, numero_identificador,professor_id) VALUES ('matematica ', '4','2');
INSERT INTO disciplina  (nome, numero_identificador,professor_id) VALUES ('biologia', '5','2');

select * from disciplina d;



insert into alunos_por_disciplina (alunos_id,disciplina_id)
select a.id as aluno_id ,d.id as disciplina_id from alunos a cross join  disciplina d;


select *from alunos_por_disciplina ;

select a.id, a.nome, d.nome  from alunos a 
inner join alunos_por_disciplina ad on a.id = ad.alunos_id
inner join disciplina d on d.id = ad.disciplina_id
where d.nome = 'fisica ';


select a.id, a.nome, d.nome  from alunos a 
inner join alunos_por_disciplina ad on a.id = ad.alunos_id
inner join disciplina d on d.id = ad.disciplina_id
where d.nome = 'matematica';

select a.id, a.nome, d.nome  from alunos a 
inner join alunos_por_disciplina ad on a.id = ad.alunos_id
inner join disciplina d on d.id = ad.disciplina_id
where d.nome = 'portugues  ';

select a.id, a.nome, d.nome  from alunos a 
inner join alunos_por_disciplina ad on a.id = ad.alunos_id
inner join disciplina d on d.id = ad.disciplina_id
where d.nome = 'matematica';

select a.id, a.nome, d.nome  from alunos a 
inner join alunos_por_disciplina ad on a.id = ad.alunos_id
inner join disciplina d on d.id = ad.disciplina_id
where d.nome = 'biologia ';

insert into  notas (notas,alunos_id,disciplina_id) values
(9.00,1,1),
(7.25,2,1),
(9.55,3,1),
(10.00,4,1),
(5.00,5,1),
(6.50,6,1),
(8.00,7,1),
(7.00,8,1),
(8.00,9,1),
(3.50,10,1),
(9.50,11,1),
(10.00,12,1),
(9.00,13,1),
(8.00,14,1),
(7.00,15,1),
(9.00,16,1),
(4.00,17,1),
(1.00,18,1),
(10.00,19,1),
(6.00,20,1);

insert into  notas (notas,alunos_id,disciplina_id) values
(9.00,1,2),
(7.25,2,2),
(9.55,3,2),
(10.00,4,2),
(5.00,5,2),
(6.50,6,2),
(8.00,7,2),
(7.00,8,2),
(8.00,9,2),
(3.50,10,2),
(9.50,11,2),
(10.00,12,2),
(9.00,13,2),
(8.00,14,2),
(7.00,15,2),
(9.00,16,2),
(4.00,17,2),
(1.00,18,2),
(10.00,19,2),
(6.00,20,2);

insert into  notas (notas,alunos_id,disciplina_id) values
(9.00,1,3),
(7.25,2,3),
(9.55,3,3),
(10.00,4,3),
(5.00,5,3),
(6.50,6,3),
(8.00,7,3),
(7.00,8,3),
(8.00,9,3),
(3.50,10,3),
(9.50,11,3),
(10.00,12,3),
(9.00,13,3),
(8.00,14,3),
(7.00,15,3),
(9.00,16,3),
(4.00,17,3),
(1.00,18,3),
(10.00,19,3),
(6.00,20,3);

insert into  notas (notas,alunos_id,disciplina_id) values
(9.00,1,4),
(7.25,2,4),
(9.55,3,4),
(10.00,4,4),
(5.00,5,4),
(6.50,6,4),
(8.00,7,4),
(7.00,8,4),
(8.00,9,4),
(3.50,10,4),
(9.50,11,4),
(10.00,12,4),
(9.00,13,4),
(8.00,14,4),
(7.00,15,4),
(9.00,16,4),
(4.00,17,4),
(1.00,18,4),
(10.00,19,4),
(6.00,20,4);

insert into  notas (notas,alunos_id,disciplina_id) values
(9.00,1,5),
(7.25,2,5),
(9.55,3,5),
(10.00,4,5),
(5.00,5,5),
(6.50,6,5),
(8.00,7,5),
(7.00,8,5),
(8.00,9,5),
(3.50,10,5),
(9.50,11,5),
(10.00,12,5),
(9.00,13,5),
(8.00,14,5),
(7.00,15,5),
(9.00,16,5),
(4.00,17,5),
(1.00,18,5),
(10.00,19,5),
(6.00,20,5)

-- exercicio 1
select a.id, a.nome, d.id, d.nome from alunos a cross join disciplina d; 
select disciplina_id, alunos_id from notas  i;
insert into notas (alunos_id, disciplina_id)
select a.id as alunos_id, d.id as disciplina_id from alunos a cross join disciplina d;

-- exercico 2
select a.id, a.nome, d.nome  from alunos a 
inner join notas i on a.id = i.alunos_id
inner join disciplina d on d.id = i.disciplina_id
where d.nome = 'matematica';

-- exercicio 3
select p.id, p.nome, d.nome  from professor p  
inner join disciplina d  on p.id = d.professor_id
where d.nome = 'matematica';

-- exercicio 4
select n.notas, a.nome , d.id,   d.nome  from notas n 
inner join alunos a  on a.id = n.alunos_id
inner join disciplina d on d.id = n.disciplina_id
where d.nome = 'matematica';

-- exercício 5
select n.notas, a.nome, d.nome, d.id  from notas n  
inner join alunos a on a.id = n.alunos_id 
inner join disciplina d on d.id = n.disciplina_id
where n.notas >= 7;

-- exercício 6
select n.notas, a.nome, d.nome, d.numero_identificador, d.id  from notas n  
inner join alunos a on a.id = n.alunos_id 
inner join disciplina d on d.id = n.disciplina_id
where n.notas >= 7 and d.nome = 'portugues';

-- exercício 7

select n.notas, a.nome, d.nome, d.numero_identificador, d.id  from notas n  
inner join alunos a on a.id = n.alunos_id 
inner join disciplina d on d.id = n.disciplina_id
where n.notas >2 and d.nome = 'matematica';

-- exercicio 8

select n.notas, a.nome, d.nome, d.id  from notas n  
inner join alunos a on a.id = n.alunos_id 
inner join disciplina d on d.id = n.disciplina_id
where n.notas < 7;

-- exercício 9
select a.nome, a.data_nacimento from alunos a 
where a.data_nacimento > '2005-02-09';

-- exercício 10
select a.nome as alunos, d.nome as disciplina, n.notas from notas n 
left join alunos a on a.id = n.alunos_id
left join disciplina d on d.id = n.disciplina_id where isnull(n.notas);

-- exercício 11
select a.nome as alunos, d.nome as disciplina from alunos a
inner join notas i on a.id = i.alunos_id 
inner join disciplina d on i.disciplina_id = d.id 
where d.nome = 'matematica';

-- exercício 12
select a.nome as alunos, p.nome as profressores, p.grau_academico, d.nome as disciplina 
from alunos a
inner join notas i on a.id = i.alunos_id 
inner join disciplina d on i.disciplina_id = d.id 
inner join professor p on d.professor_id = p.id 
where p.grau_academico = 'doutorado';

-- exercício 13
select d.nome as displina_nome, p.nome as professor_nome 
from disciplina d 
left join professor p on d.professor_id = p.id;

-- exercício 14
select count(*) as total_alunos_ma from alunos a 
inner join notas i on a.id = i.alunos_id
inner join disciplina d on i.disciplina_id = d.id
where d.nome = 'matematica';

-- exercicio 15
select sum(notas) as soma
from notas n
inner join disciplina d on n.disciplina_id = d.id 
where nome = 'fisica';

-- exercicio 16
select max(notas) as maior_valor 
     from notas n
     inner join disciplina d on n.disciplina_id = d.id 
     where nome = 'historia' ;
   
-- exercicio 17
select min(notas) as menor_valor 
    from notas n
    inner join disciplina d on n.disciplina_id = d.id 
    where nome = 'fisica';

-- exercico 18
select avg(notas) as nota_media 
    from notas n
    inner join disciplina d on n.disciplina_id = d.id 
    where nome = 'biologia';   

-- exercicio 19
select d.nome as disciplina, count(a.id) as numero_de_alunos
from disciplina d 
inner join notas i on d.id = i.disciplina_id
inner join alunos a on i.alunos_id = a.id
group by d.nome;

-- exercicio 20 
select sum(notas) as soma from notas;

-- exercicio 21
select max(notas) as maior_valor from notas ;

-- exercico 22
select min(notas) as menor_valor from notas;

-- exercicio 23
select avg(notas) as nota_media from notas;

-- exercicio 24
select d.nome AS Disciplina, avg(n.notas) AS Media_Notas
from disciplina d
inner join notas n ON d.id = n.disciplina_id
group by d.nome;

-- exercicio 25
select d.nome AS disciplina,a.nome as aluno,avg(n.notas) as media
from notas n
inner join alunos a on n.alunos_id = a.id
inner join disciplina d on n.disciplina_id = d.id
group by d.nome, a.nome
order by d.nome , a.nome ;

-- exercicio 26
select d.nome  AS disciplina ,a.nome as aluno,avg(n.notas) as media
from notas n
inner join alunos a on n.alunos_id = a.id
inner join disciplina d on n.disciplina_id = d.id
group by d.nome, a.nome
order by d.nome asc , media desc;

-- exercicio 27
select alunos_id, notas,a.nome  
from notas n
inner join disciplina d on n.disciplina_id = d.id 
inner join alunos a on n.alunos_id = a.id 
where d.nome = 'historia'
order by notas limit 5;

-- exercicio 28
select a.nome as aluno,avg(n.notas) as media from notas n
inner join alunos a on n.alunos_id = a.id
inner join disciplina d on n.disciplina_id = d.id
where d.nome = 'biologia'
group by a.nome
order by media desc limit 3;

-- exercicio 29 
select a.nome as aluno,avg(n.notas) as media from notas n
inner join alunos a on n.alunos_id = a.id
inner join disciplina d on n.disciplina_id = d.id
group by a.nome 
order by media desc limit 10;

-- exercicio 30
select count(distinct  a.id) AS numero_de_alunos_ativos from alunos a
inner join alunos_por_disciplina ad ON a.id = ad.alunos_id;


	





















