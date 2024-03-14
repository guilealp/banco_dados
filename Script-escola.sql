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
create table disciplinas(
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
	nota decimal(5,2)not null,
	alunos_id int not null,
	disciplinas_id int not null,
	primary key (id),
	constraint fk_alunos_notas
		foreign key(alunos_id)
		references alunos(id),
	constraint fk_disciplina_notas
		foreign key(disciplinas_id)
		references disciplinas(id)
);
create table alunos_por_disciplinas(
	alunos_id int not null,
	disciplinas_id int not null,
	constraint fk_alunos_alunos_por_disciplinas
		foreign key(alunos_id)
		references alunos(id),
	constraint fk_disciplina_alunos_por_disciplinas
		foreign key(disciplinas_id)
		references disciplinas(id)
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
INSERT INTO professor  (nome, numero_identificador, especialidade,grau_academico) VALUES ('professor 2', '2', 'matematica','pos-graduado');
INSERT INTO professor  (nome, numero_identificador, especialidade,grau_academico) VALUES ('professor 4', '4', 'portugues','pos-graduado');

select * from professor p ;

INSERT INTO disciplinas (nome, numero_identificador,professor_id) VALUES ('fisica 1', '1','1');
INSERT INTO disciplinas  (nome, numero_identificador,professor_id) VALUES ('fisica 2', '2','1');
INSERT INTO disciplinas  (nome, numero_identificador,professor_id) VALUES ('portugues 1', '3','3');
INSERT INTO disciplinas  (nome, numero_identificador,professor_id) VALUES ('matematica 1', '4','2');
INSERT INTO disciplinas  (nome, numero_identificador,professor_id) VALUES ('matematica 2', '5','2');

select * from disciplinas d;



insert into alunos_por_disciplinas (alunos_id,disciplinas_id)
select a.id as aluno_id ,d.id as disciplinas_id from alunos a cross join  disciplinas d;


select *from alunos_por_disciplinas ;

select a.id, a.nome, d.nome  from alunos a 
inner join alunos_por_disciplinas ad on a.id = ad.alunos_id
inner join disciplinas d on d.id = ad.disciplinas_id
where d.nome = 'matematica 1';


select a.id, a.nome, d.nome  from alunos a 
inner join alunos_por_disciplinas ad on a.id = ad.alunos_id
inner join disciplinas d on d.id = ad.disciplinas_id
where d.nome = 'matematica 2';

select a.id, a.nome, d.nome  from alunos a 
inner join alunos_por_disciplinas ad on a.id = ad.alunos_id
inner join disciplinas d on d.id = ad.disciplinas_id
where d.nome = 'fisica 1';

select a.id, a.nome, d.nome  from alunos a 
inner join alunos_por_disciplinas ad on a.id = ad.alunos_id
inner join disciplinas d on d.id = ad.disciplinas_id
where d.nome = 'fisica 2';

select a.id, a.nome, d.nome  from alunos a 
inner join alunos_por_disciplinas ad on a.id = ad.alunos_id
inner join disciplinas d on d.id = ad.disciplinas_id
where d.nome = 'portugues 1';

insert into  notas (nota,alunos_id,disciplinas_id) values
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

select n.nota, a.nome, d.nome, d.id  from notas n  
inner join alunos a on a.id = n.alunos_id 
inner join disciplinas d on d.id = n.disciplinas_id
where n.nota >= 7;




















