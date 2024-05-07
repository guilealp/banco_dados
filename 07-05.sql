drop database if exists escola;

create database if not exists escola;

use escola;

create table alunos(
	id int auto_increment,
	nome varchar(50),
	idade int ,
	primary key(id)
);

insert into alunos (nome,idade) values
('joão',20),
('maria',22),
('carlos',19);

select * from alunos a;

-- VIEW
-- view é uma representação virtual de uma tabela baseada em uma comsulta sql.
-- ela permite simplificar consultas complexas e reutilizar a logica de consulta
-- create view <nome> as <pesquisa>;

create view alunosMaioresDe20 as 
select nome, idade from alunos where idade > 20;

alter view alunosMaioresDe20 as 
select nome, idade, year(now()) - idade as ano_nacimento from alunos where idade > 20;

select * from alunosMaioresDe20;

-- function
-- São blocos de codigo reutilizaveis que realizam uma tarefa especifica.
-- pode-se usa-las para simplificar consultas , calculos ou manipulação de dados
delimiter // 
create  function calculaMediaIdade()
returns decimal(5,2)
begin
		declare media decimal(5,2);
		select avg(idade) into media from alunos a; 
		return media;
end // 
delimiter ; 
select calculaMediaIdade() as media_idade

delimiter //
create function calcular_idade(data_nascimento date)
returns int 
begin
		declare idade int ;
		declare data_atual date;
		set data_atual = curdate();
		set idade = year(data_atual) - year(data_nascimento);
		if month(data_atual) < month(data_nascimento) or(
		month(data_atual) = month(data_nascimento) and
		day(data_atual) < day(data_nascimento)
		)then
		set idade = idade - 1;
		end if;
	return idade;
end//
delimiter ; 
select  calcular_idade('2007-04-09');

-- procedure
-- procedimentos são conjuntos de instruções sql armazenados no banco de dados.
-- eles podem aceitar paramentros e executar uma serie de comandos.

delimiter //
create procedure adicionarAluno(x_nome varchar(50), x_idade int)
begin
	insert into alunos (nome, idade) values (x_nome, x_idade);
end//
delimiter ;

call adicionarAluno('Ana',30);

-- diferença entre Function e procedure
-- function -> retorna um valor
-- procedure -> retorna não valor.









































