CREATE DATABASE sensor;

USE sensor;


CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(65),
cpf CHAR(11) NOT NULL,
email VARCHAR(50) NOT NULL,
senha VARCHAR(35) NOT NULL,
cep CHAR(8) NOT NULL,
telefone CHAR(11) NOT NULL,
cnpj CHAR(14) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT chkEmail
	CHECK(email LIKE '%@%');
    
INSERT INTO Usuario (nome, cpf, email, senha, cep, telefone, cnpj) VALUES
	('João Pedro Arruda', '12345678909', 'joao.pedro01@email.com', 'um2tresquatro', '01000000', '11912345678', '12345678000190'),
	('Celia Saint James', '98765432100', 'celia.james@email.com', 'jakdao908', '22000111', '21976543210', '98765432000110'),
	('Fernanda Silva Mendes', '32165498730', 'fernanda.mendes@email.com', 'sjauhi98', '33000222', '31998765432', '56789123000145'), 
	('Ana Maria de Andrade', '74185296350', 'anamaria.andrade@email.com', 'batatinha123', '55000444', '41965432109', '23456789000132'),
	('Celso Pereira de Oliveria', '15935748620', 'celia.oliveira@email.com', 'senhainquebravel09', '55000666', '21643210987', '87654321000167');


UPDATE Usuario SET email = 'celia.james@novoemail.com'
	WHERE nome = 'Celia Saint James'; 

SELECT nome AS 'Username', 
	cpf AS 'CPF', 
		email AS 'Email', 
			senha AS 'Senha', 
				cep AS 'CEP', 
					telefone AS 'Telefone',
						cnpj AS 'CNPJ' FROM usuario;


CREATE TABLE pedido(
	idPedido INT PRIMARY KEY AUTO_INCREMENT,
    modeloSensor VARCHAR(60),
    qtdSensor INT,
    dataPedido DATETIME,
    valorTotal FLOAT,
    valorFrete FLOAT
);

INSERT INTO pedido (modeloSensor, qtdSensor, dataPedido, valorTotal, valorFrete) VALUES
('Umidade de Solo Capacitivo', 55, '2025-03-20 11:30:00', 1554.90, 170.00), 
('Umidade de Solo Capacitivo', 28, '2025-03-20 13:45:00', 1650.50, 251.00), 
('Umidade de Solo Capacitivo', 65, '2025-03-20 10:40:00', 2890.70, 321.00),
('Umidade de Solo Capacitivo', 32, '2025-03-20 09:50:00', 3560.00, 174.00), 
('Umidade de Solo Capacitivo', 15, '2025-03-20 12:45:00', 1890.00, 190.00);
    
UPDATE pedido SET valorFrete = 120.00
	WHERE idPedido = 3;

SELECT idPedido AS 'Número do Pedido',
date_format(dataPedido, '%d/%m/%Y') AS 'Data do Pedido', 
qtdSensor AS 'Quantidade de Sensores', 
valorTotal AS 'Valor Total', 
valorFrete AS 'Valor do Frete' FROM pedido;


CREATE TABLE Empresa(
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
     cep CHAR(8) NOT NULL,
    senha VARCHAR(35) NOT NULL
);
ALTER TABLE empresa ADD CONSTRAINT chkEmail
	CHECK(email LIKE '%@%');
    


CREATE TABLE Sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(50) NOT NULL,
    dataInstalacao DATETIME,
    localInstalacao VARCHAR(60),
    tipoLeitura VARCHAR(30) NOT NULL,
    numSerie VARCHAR(25) NOT NULL UNIQUE
);

ALTER TABLE Sensor ADD CONSTRAINT chkModelo
	CHECK(modelo IN('Umidade de Solo Capacitivo'));

INSERT INTO Sensor (modelo, dataInstalacao, localInstalacao, tipoLeitura, numSerie)
VALUES 
('Umidade de Solo Capacitivo', '2025-03-13 17:30:00', 'Área Sul', 'Umidade do Solo', 'S01'),
('Umidade de Solo Capacitivo', '2025-02-28 16:49:00', 'Área Norte', 'Umidade do Solo', 'S02'),
('Umidade de Solo Capacitivo', '2025-03-06 03:45:00', 'Área Sudeste', 'Umidade do Solo', 'S03'),
('Umidade de Solo Capacitivo', '2025-03-20 15:20:00', 'Área Leste', 'Umidade do Solo', 'S04'),
('Umidade de Solo Capacitivo', '2025-03-19 19:50:00', 'Área Oeste', 'Umidade do Solo', 'S05');

UPDATE Sensor SET localInstalacao = 'Área Sul', dataInstalacao = '2025-03-22 17:00:00'
	WHERE numSerie = 'S03';


SELECT modelo AS 'Modelo do Sensor', 
	date_format(dataInstalacao, '%d/%m/%Y  %H:%m') AS 'Data do Pedido', 
		localInstalacao AS 'Local da instalação', 
			numSerie AS 'Número de Série', 
				tipoLeitura AS 'Tipo de Leitura' FROM Sensor;



CREATE TABLE dadosSensor(
	idDados INT PRIMARY KEY AUTO_INCREMENT,
	statusSensor VARCHAR(35),
    dado FLOAT,
    dtDado DATETIME
);

ALTER TABLE dadosSensor ADD CONSTRAINT chkStatusSensor 
	CHECK(statusSensor IN('Ativo','Inativo'));
    
INSERT INTO dadosSensor (dado, statusSensor, dtDado) VALUES
	(34.5, 'Inativo', '2025-03-20 10:30:00'),
	(54.3, 'Ativo', '2025-03-20 08:30:00'),
	(52.4, 'Ativo', '2025-03-20 07:45:00'),
	(36.7, 'Inativo', '2025-03-20 11:30:00'),
	(32.5, 'Inativo', '2025-03-20 10:50:00'),
	(24.9, 'Ativo', '2025-03-20 12:45:00');



UPDATE dadosSensor SET statusSensor = 'Inativo' WHERE idDado = 4;


SELECT dado AS 'Valor do Dado',
	statusSensor AS 'Status do sensor',
		dtDado AS 'Data e Hora Captada' FROM dadosSensor;





 