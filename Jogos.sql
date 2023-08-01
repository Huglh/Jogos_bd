create database Prova2BD_26;
use PROVA2BD_26;
create table time 
(
codigo int unsigned auto_increment not null,
nome varchar(45) not null,
estado char(2) not null,
sigla char(5) not null,
Presidente varchar(45) not null,
site varchar(45) not null,
cidade varchar(45) not null,
email varchar(50) not null,
primary key(codigo)
)engine=innodb;
create table Partida 
(
codigo int unsigned auto_increment not null,
data date not null, 
horario time not null,
local varchar(45) not null,
estado varchar(45) not null,
quantidade_lugares int unsigned not null,
placar_time1 int unsigned not null,
placar_time2 int unsigned not null,
time_casa int unsigned not null,
time_visitante int unsigned not null,
primary key(codigo),
foreign key(time_casa) references time(codigo),
foreign key(time_visitante) references time(codigo)
)engine=innodb;
create table jogador
(
codigo int unsigned auto_increment not null,
nome varchar(45) not null,
cpf char(15) not null,
rg char(15) not null,
telefone char(15) not null,
rua varchar(45) not null,
bairro varchar(45) not null,
cidade varchar(45) not null,
cep char(10) not null,
estado char(2) not null,
email varchar(45) not null,
time_codigo int unsigned not null,
primary key(codigo),
foreign key(time_codigo) references time(codigo)
)engine=innodb;

-- Time --
desc time;
select*from time;
insert into time(codigo,nome,estado,sigla,Presidente,site,cidade,email)
values(null,"Atletico","MG","Atle","Ricardo Moreira","www.atleticomg.com.br","Belo Horizonte","atleticomg@gmail.com.br");
-- Jogador --
desc jogador;
select*from jogador;
insert into jogador(codigo,nome,cpf,rg,telefone,rua,bairro,cidade,cep,estado,email,time_codigo)
values(null,"Hulk","256.369.750-66","44.777.666-1","40028922","Av Contorno","Centro","Belo Horizonte","30110-001","MG","Hulk@gmail.com.br",1);
insert into jogador(codigo,nome,cpf,rg,telefone,rua,bairro,cidade,cep,estado,email,time_codigo)
values(null,"Guilherme Arana","459.260.620-55","17.213.123-6","971759785","Av Contorno","Funcionários","Belo Horizonte","30110-001","MG","Arana@gmail.com.br",1);
-- Atualizações --
delete from time where estado ="MG" and codigo > 18;
update jogador set bairro ="São Lucas" where codigo = 16;
select count(codigo) as total_jogador from jogador where codigo =16;
select count(codigo) as total_jogador from jogador where estado ="PA";
select*from partida where horario between 15 and 19;