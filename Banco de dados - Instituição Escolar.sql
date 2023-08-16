/* Criação da base de dados */ 
create database bd_escola;
use bd_escola;

create table tb_aluno(
cd_aluno int auto_increment, 
nm_aluno varchar(45) not null, 
dt_nascimento date not null, 
nr_rg char(11) not null, 
primary key(cd_aluno)
);

create table tb_boletim(
cd_boletim int auto_increment,
nr_nota int not null,
materia varchar(20) not null,
fk_cd_aluno int, 
primary key(cd_boletim), 
foreign key (fk_cd_aluno) references tb_aluno (cd_aluno)
);

create table tb_cantina(
cd_cantina int auto_increment,
nm_produto varchar(60) not null, 
vl_produto int not null,
primary key(cd_cantina)
);

create table tb_venda(
cd_venda int auto_increment, 
nm_vendedor varchar(45) not null, 
qt_produto int not null, 
nm_cidade varchar(45) not null, 
fk_cd_cantina int, 
primary key(cd_venda), 
foreign key(fk_cd_cantina) references tb_cantina (cd_produto)
);

/* Alteração de tabela */ 

/* Adicionar */ 
alter table tb_aluno
add nr_cpf char(11) not null; 

/* Modificar Coluna */ 
alter table tb_boletim
change materia nm_materia varchar(20) not null;

alter table tb_cantina 
change cd_cantina cd_produto int not null;

/* Renomear Tabela */ 
alter table tb_aluno
rename tb_estudante;

/* Alterar Tipo de dado da Coluna */ 
alter table tb_boletim
modify nm_materia varchar(25);

/*Excluir linha*/
alter table tb_estudante 
drop column  nr_cpf;

/*Iserção de dados*/
insert into tb_estudante(cd_aluno, nm_aluno, dt_nascimento, nr_rg) values
(null, 'Guilherme', '2007-04-07', '50965957810'),
(null, 'Gui', '2009-04-07', '50965957810'),
(null, 'Francisco', '2020-04-07', '50965957810'),
(null, 'Videira', '1907-04-07', '50965957810');

insert into tb_cantina(cd_cantina, nm_produto, vl_produto) values
(null, 'Coxinha', '6'),
(null, 'Coca-Cola', '3'),
(null, 'Salgadinho', '2'),
(null, 'Pirulito', '1');

insert into tb_venda(cd_venda, nm_vendedor, qt_produto, nm_cidade, fk_cd_cantina) values
(null, 'Guilherme', '7', 'Ilha Cumprida', '1'),
(null, 'Gui', '8', 'Iguape', '3'),
(null, 'Francisco', '9', 'Praia Grande', '1'),
(null, 'Videira', '10', 'Santos', '2');

select * from tb_venda;
select * from tb_estudante;

/*Atualização de dados*/
update tb_estudante
set nm_aluno = 'Guilhermo'
where cd_aluno = 1;

/*Deletar Tabela
delete from tb_estudante*/

/* Selecionar Coluna */
select cd_aluno as 'Código', nm_aluno as 'Nome'
from tb_estudante; 

/* Com condição */
select *
from tb_estudante 
where cd_aluno = 2;

/* Operadores lógicpos */

/* is null */
select *
from tb_estudante 
where cd_aluno is null;

/* is not null */
select *
from tb_estudante 
where cd_aluno is not null;

/* between */
select *
from tb_estudante 
where dt_nascimento between '2007-04-07' and '2020-04-07';

/* not between */
select *
from tb_estudante 
where dt_nascimento not between '2007-04-07' and '2020-04-07';

/* Like */
select *
from tb_estudante 
where nm_aluno like 'V%';

select *
from tb_estudante 
where nm_aluno like '%Guilhermo%';

select *
from tb_estudante 
where nm_aluno like '%a';

select *
from tb_estudante 
where nm_aluno like '%a';

select *
from tb_estudante 
where nm_aluno like '_r%';

/* Função matématica */

select vl_produto * 5 as 'Valor do produto'
from tb_cantina 
where cd_produto = 2;

select ceiling(qt_produto) as 'Quantidade'
from tb_venda
where cd_venda = 1;

/* Função de texto */

/* Length - Retorna a quantidade de caracteres */
select cd_aluno as 'Código do aluno', length(nm_aluno) as 'Nome' 
from tb_estudante
where nm_aluno like '_u%';

select cd_aluno as 'Código do aluno', length(nm_aluno) as 'Nome' 
from tb_estudante
where cd_aluno = 2 and nm_aluno like '_u%';

/* Upper - Retorna os valores na letra maiuscula */
select upper(nm_aluno) as 'Nome'
from tb_estudante
where cd_aluno = 1;

/* lower - Retorna os valores na letra minusculo  */
select lower(nm_aluno) as 'Nome'
from tb_estudante
where cd_aluno = 1;

/* Concat - Junta os registros  */
select concat('O nome do produto é:', ' ', nm_produto, ' ', 'e seu valor é de:',' ',  vl_produto, ' ', 'reais.') as 'Pesquisa'
from tb_cantina
where cd_produto = 1;

/* Substring - Junta os registros  */
select substring(nm_aluno from 1 for 3) as 'Apelido'
from tb_estudante; 

/* Group by */
select nm_cidade as 'Cidade', sum(qt_produto) as 'Quantidade'
from tb_venda
group by nm_cidade;

select nm_cidade, count(*) as 'Total' 
from tb_venda 
group by nm_cidade;

/* Order by */

/* ASC - Ordem Crescente */
select nm_vendedor as 'Vendedor' 
from tb_venda
order by nm_vendedor asc;

/* DESC - Ordem decrescente */
select nm_vendedor as 'Vendedor' 
from tb_venda
order by nm_vendedor desc;

/* Join */

/* Inner Join - Junta todos os registros de todas as tabelas */
select * from tb_venda as v 
inner join tb_cantina as c on (v.cd_venda = c.cd_produto);

/* Left Join - Junta todos os registros da tabela esquerda e os correspondentes da direita */
select c.nm_produto as 'Produto' , v.qt_produto as 'Quantidade'
from tb_venda as v 
left join tb_cantina as c on (v.cd_venda = c.cd_produto);

/* Right Join - Junta todos os registros da tabela direita e os correspondentes da direita */
select *
from tb_venda as v 
right join tb_cantina as c on (v.cd_venda = c.cd_produto);