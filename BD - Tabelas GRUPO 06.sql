/*  Grupo 06 - Sistema de Monitoramento de Temperatura e URA na Maturação de Queijo Minas Padrão Artesanal

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

CREATE TABLE temperatura (
idTemp INT PRIMARY KEY AUTO_INCREMENT,
dt date,
hora TIME,
Temperatura DECIMAL (4,2),
idCamara int);

INSERT INTO temperatura (dt, hora, Temperatura, idCamara) VALUES
('2026-07-09', '11:31', '32.1', 1), 
('2026-07-09', '11:32', '35.7', 2), 
('2026-07-09', '11:33', '40.1', 3), 
('2026-07-09', '11:34', '28.4', 4), 
('2026-07-09', '11:35', '21.1', 5);

SELECT * FROM temperatura;

CREATE TABLE umidade (
idUmidade INT PRIMARY KEY AUTO_INCREMENT,
dtUmidade date,
horaUmidade TIME,
Umidade VARCHAR(30),
idCamara int);

INSERT INTO umidade (dtUmidade, horaUmidade, Umidade, IdCamara) VALUES
('2026-01-30', '15:30', '82%HR', 1),
('2026-01-30', '15:40', '85%HR', 2),
('2026-01-30', '15:50', '80%HR', 3),
('2026-01-30', '14:00', '83%HR', 4),
('2026-01-30', '14:10', '81%HR', 5);

SELECT * FROM umidade;


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
('João Bezerra', '1971-12-09', '11943562758', '12345671802', 'mariabenta@gmail.com', 'senha5754', '53835633', '747'),
('João Bezerra', '1971-12-09', '11943562758', '12345671802', 'eduardasousa@gmail.com', 'piriri728782', '32256534', '747'),
('João Bezerra', '1971-12-09', '11943562758', '12345671802', 'jonas@gmail.com', 'senha123', '24678922', '747'),
('João Bezerra', '1971-12-09', '11943562758', '12345671802', 'pablobrito@gmail.com', 'senha123', '23456794', '747');

SELECT * FROM cadastro;

CREATE TABLE login (
email VARCHAR(50),
senha VARCHAR(20)
);

INSERT INTO login VALUES
('joaobezerra@gmail.com', 'senha123'),
('mariabenta@gmail.com', 'senha5754'),
('eduardasousa@gmail.com', 'piriri728782'),
('jonas@gmail.com', '83582055'),
('pablobrito@gmail.com', 'pass873783');

SELECT * FROM login;


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
('Camara A', 'São Paulo', 'Sp', 'Rua', '673', 'Casa', 'Cachoeirinha', '19343859'),
('Camara B', 'São Paulo', 'Mg', 'Praça', '673', 'Casa', 'Ipinturuba', '23456794'),
('Camara C', 'Praia Grande', 'Sp', 'Avenida', '673', 'Casa', 'Moinho Velho', '23456794'),
('Camara D', 'Santos', 'Pr', 'Rua', '673', 'Casa', 'Morumbi', '23456794');

SELECT * FROM camara;

CREATE TABLE relatorio (
idRelatorio INT PRIMARY KEY AUTO_INCREMENT,
statuss VARCHAR(15), 
CONSTRAINT chkStatus CHECK(statuss IN( 'Concluído', 'Em andamento')),
idCamara INT, 
nomeCamara VARCHAR(30),
modaTemp VARCHAR(15),
idTemp INT,
idUmidade INT
);

INSERT INTO relatorio (statuss, idCamara, nomeCamara, modaTemp, idTemp, idUmidade) VALUES
('Concluído', 1, 'Camara A', '35.0', 1, 1),
('Concluído', 2, 'Camara B', '32.0', 2, 2),
('Em andamento', 3, 'Camara C', '37.0', 3, 3),
('Concluído', 4, 'Camara D', '34.0', 4, 4);

SELECT * FROM relatorio;


