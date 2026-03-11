/*  Grupo 06 - Sistema de Monitoramento de Temperatura e URA na Maturação de Queijo Minas Artesanal

Camila Nefertite Rodrigues Cardoso (01261121);    
Gabrielle Fuchs Nunes Malvásio (01261084);   
Isabella Cirino Cotinguiba (01261027);    
Julia Ayumi Yamasaki (01261081);   
Leonardo Moura De Sousa (01261090);   
Maria Eduarda Lopes Silva (01261074);   
Geovanna Cristina Paschoal (01261033);   
Paola Veloso De Paula (01261006);   
Raquel Yukari Taniwaki (01261048).  

 */
 
 
CREATE DATABASE Sensor;
USE Sensor;



-- TABELA TEMPERATURA

CREATE TABLE temperatura (
idTemp INT PRIMARY KEY AUTO_INCREMENT,
dt_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
Temperatura FLOAT,
NomeCamara VARCHAR(30));

INSERT INTO temperatura (Temperatura, NomeCamara) VALUES
('18.1', 'Camara A'), 
('16.7', 'Camara B'), 
('15.2', 'Camara C'),
('20.0', 'Camara D'), 
('21.1', 'Camara E');

SELECT * FROM temperatura;

SELECT Temperatura FROM temperatura WHERE Temperatura > 20.0;

SELECT * , CASE
WHEN temperatura BETWEEN 16 AND 20 THEN 'Temperatura ideal'
ELSE 'Temperatura inadequada' END AS Temperatura FROM temperatura;

TRUNCATE TABLE temperatura;

DROP TABLE temperatura;



-- TABELA UMIDADE

CREATE TABLE umidade (
idUmidade INT PRIMARY KEY AUTO_INCREMENT,
dt_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
Umidade VARCHAR(30),
nome_Camara VARCHAR (30));

INSERT INTO umidade (Umidade, nome_Camara) VALUES
('82%HR', 'Camara A'),
('75%HR', 'Camara B'),
('80%HR', 'Camara C'),
('83%HR', 'Camara D'),
('95%HR', 'Camara C');

SELECT * FROM umidade;

SELECT Umidade FROM umidade WHERE umidade > 80;

SELECT * , CASE
WHEN umidade BETWEEN 80 AND 92 THEN 'Umidade ideal'
ELSE 'Umidade inadequada' END AS Umidade FROM umidade;

TRUNCATE TABLE umidade;

DROP TABLE umidade;



-- TABELA CADASTRO

CREATE TABLE cadastro (
idUser INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60),
dtNasc DATE,
telefone VARCHAR(13),
cpf CHAR(11),
email VARCHAR(50),
senha VARCHAR(20),
cep CHAR(8),
numEndereco VARCHAR(5) 
);

INSERT INTO cadastro (nome, dtNasc, telefone, cpf, email, senha, cep, numEndereco) VALUES
('João Bezerra', '1971-12-09', '11943562758', '12345671802', 'joaobezerra@gmail.com', 'senha123', '20308209', '747'),
('Maria Benta', '1971-12-09', '11943562758', '12345671802', 'mariabenta@gmail.com', 'senha5754', '53835633', '747'),
('Eduarda Sousa', '1971-12-09', '11943562758', '12345671802', 'eduardasousa@gmail.com', 'piriri728782', '32256534', '747'),
('Jonas Miguel', '1971-12-09', '11943562758', '12345671802', 'jonas@gmail.com', 'senha123', '24678922', '747'),
('Pablo Brito', '1971-12-09', '11943562758', '12345671802', 'pablobrito@gmail.com', 'senha123', '23456794', '747');

SELECT * FROM cadastro;

SELECT telefone, email FROM cadastro WHERE nome = 'João Bezerra';

UPDATE cadastro SET telefone = '11951317077' WHERE idUser = 3;

TRUNCATE TABLE cadastro;

DROP TABLE cadastro;



-- TABELA LOGIN

CREATE TABLE login (
idLogin INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(50),
senha VARCHAR(20)
);

INSERT INTO login (email, senha) VALUES
('joaobezerra@gmail.com', 'senha123'),
('mariabenta@gmail.com', 'senha5754'),
('eduardasousa@gmail.com', 'piriri728782'),
('jonas@gmail.com', '83582055'),
('pablobrito@gmail.com', 'pass873783');

SELECT * FROM login;

SELECT email FROM login WHERE email LIKE 'j%';

UPDATE login SET senha = 'senhaNova123' WHERE idLogin = 5;

TRUNCATE TABLE login;

DROP TABLE login;



-- TABELA CÂMARA

CREATE TABLE camara (
idCamara INT PRIMARY KEY AUTO_INCREMENT,
nomeCamara VARCHAR(30),
cidade VARCHAR(30),
estado VARCHAR(30),
logradouro VARCHAR(30),
numLogradouro VARCHAR(5),
complemento VARCHAR(20) NULL,
bairro VARCHAR(30),
cep CHAR(8)
);

INSERT INTO camara (nomeCamara, cidade, estado, logradouro, numLogradouro, complemento, bairro, cep) VALUES
('Camara A', 'São Paulo', 'Sp', 'Rua Fernanda Pessoa', '12', 'Casa', 'Cachoeirinha', '19343859'),
('Camara B', 'São Paulo', 'Mg', 'Praça barão de studart', '1155', 'Casa', 'Ipinturuba', '23456794'),
('Camara C', 'Praia Grande', 'Sp', 'Avenida paulista', '673', 'Casa', 'Moinho Velho', '23456794'),
('Camara D', 'Santos', 'Pr', 'Rua Voluntários da pátria', '970', 'Casa', 'Morumbi', '23456794');

SELECT * FROM camara;

SELECT nomeCamara, logradouro, numLogradouro FROM camara WHERE estado = 'SP' ;

UPDATE camara SET numLogradouro = '1212' WHERE idCamara = 1;

TRUNCATE TABLE camara;

DROP TABLE camara;



-- TABELA RELATÓRIO

CREATE TABLE relatorio (
idRelatorio INT PRIMARY KEY AUTO_INCREMENT,
statuss VARCHAR(15), 
CONSTRAINT chkStatus CHECK(statuss IN( 'Concluído', 'Em andamento')),
nomeCamara VARCHAR(30),
modaTemp VARCHAR(10),
modaUmidade VARCHAR (10)
);

INSERT INTO relatorio (statuss, idCamara, nomeCamara, modaTemp, modaUmidade) VALUES
('Concluído', 'Camara A', '12.0', '82%HR'),
('Concluído', 'Camara B', '17.0', '79%HR'),
('Em andamento', 'Camara C', '20.0','75%HR'),
('Concluído', 'Camara D', '21.0', '85%HR');

SELECT * FROM relatorio;

SELECT statuss FROM relatorio WHERE nomeCamara = 'Camara C';

SELECT * , CASE
WHEN modaTemp BETWEEN 16 AND 20 THEN 'Temperatura ideal'
ELSE 'Temperatura inadequada' END AS Temperatura FROM relatorio;

SELECT * , CASE
WHEN modaUmidade BETWEEN 80 AND 92 THEN 'Umidade ideal'
ELSE 'Umidade inadequada' END AS Umidade FROM relatorio;

TRUNCATE TABLE relatorio;

DROP TABLE relatorio;