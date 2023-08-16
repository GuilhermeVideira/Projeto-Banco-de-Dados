create database bd_escola;
use bd_escola;

create table tb_aluno(
cd_aluno int not null, 
nm_aluno varchar(45) not null, 
dt_nascimento date not null, 
ds_enderco longtext not null,
Primary Key(cd_aluno)
);

create table tb_boletim(
cd_boletim int not null, 
nr_nota01 decimal(2,2) not null, 
nr_nota02 decimal(2,2) not null, 
nr_nota03 decimal(2,2) not null, 
fk_cd_aluno int not null, 
primary key(cd_boletim), 
foreign key(fk_cd_aluno) references tb_aluno(cd_aluno)
);

alter table tb_aluno
change cd_aluno rm_aluno int not null;

alter table tb_boletim 
add nm_materia varchar(15) not null, 
add nr_classe int not null;

alter table tb_boletim 
modify nr_classe decimal(2,2) not null; 

alter table tb_boletim 
drop column nr_classe;

alter table tb_boletim 
rename tb_mencoes; 

alter table tb_mencoes 
rename tb_boletim; 

insert into tb_aluno
values (1, 'Guilherme', '2007-04-07', 'Mongaguá'),
(2, 'Francisco', '2008-04-07', 'Praia Grande'),
(3, 'Guizin', '2010-04-07', 'Santos');

update tb_aluno 
set nm_aluno = 'Guiizin'
where rm_aluno = 3;

select *
from tb_aluno; 

select rm_aluno as 'RM', nm_aluno as 'Aluno', dt_nascimento as 'Data de Nascimento'
from tb_aluno 
where dt_nascimento between '2007-04-07' and '2008-08-10'; 

select rm_aluno as 'RM', nm_aluno as 'Aluno', dt_nascimento as 'Data de Nascimento'
from tb_aluno 
where nm_aluno like'G%';

select rm_aluno as 'RM', nm_aluno as 'Aluno', dt_nascimento as 'Data de Nascimento'
from tb_aluno 
where nm_aluno like'Gui%';
 
select rm_aluno as 'RM', nm_aluno as 'Aluno', dt_nascimento as 'Data de Nascimento'
from tb_aluno 
where rm_aluno in (1, 3);

select nm_aluno
from tb_aluno 
group by nm_aluno;

select nm_aluno
from tb_aluno 
order by nm_aluno asc;

select nm_aluno
from tb_aluno 
order by nm_aluno desc;

select a.nm_aluno, b.cd_boletim 
from tb_aluno as a
join tb_boletim as b 
on a.rm_aluno = b.cd_boletim;