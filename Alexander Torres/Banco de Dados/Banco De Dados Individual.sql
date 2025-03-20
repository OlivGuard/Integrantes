CREATE DATABASE OlivGuard;
USE OlivGuard;
CREATE TABLE SensorDesc(
	idDescSensor INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(35) NOT NULL,
    dtInstalacao DATETIME,
    localInstalacao VARCHAR(40),
    tipoLeitura VARCHAR(30) NOT NULL,
    nSerie VARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT chkModelo
	CHECK(modelo IN('Umidade de Solo Capacitivo'))
);

INSERT INTO SensorDesc (modelo, dtInstalacao, localInstalacao, tipoLeitura, nSerie) VALUES 
('Umidade de Solo Capacitivo', '2025-03-20 10:00:00', 'Estufa A', 'Umidade do Solo', 'SN001'),
('Umidade de Solo Capacitivo', '2025-03-19 09:30:00', 'Estufa B', 'Umidade do Solo', 'SN002'),
('Umidade de Solo Capacitivo', '2025-03-18 08:45:00', 'Estufa Central', 'Umidade do Solo', 'SN003'),
('Umidade de Solo Capacitivo', '2025-03-17 14:00:00', 'Laboratório 1', 'Umidade do Solo', 'SN004'),
('Umidade de Solo Capacitivo', '2025-03-16 16:30:00', 'Laboratório 2', 'Umidade do Solo', 'SN005');

CREATE TABLE dadoSensor(
	idDado INT PRIMARY KEY AUTO_INCREMENT,
    dado FLOAT,
    statusSensor VARCHAR(15),
    dtDado DATETIME
	CONSTRAINT chkStatusSensor 
	CHECK(statusSensor IN('Ativo','Inativo'))
);

INSERT INTO dadoSensor (dado, statusSensor, dtDado) VALUES
	(23.5, 'Ativo', '2025-03-20 08:00:00'),
	(45.7, 'Ativo', '2025-03-20 08:30:00'),
	(12.3, 'Inativo', '2025-03-20 09:00:00'),
	(33.1, 'Ativo', '2025-03-20 09:30:00'),
	(56.8, 'Ativo', '2025-03-20 10:00:00'),
	(19.4, 'Inativo', '2025-03-20 10:30:00'),
	(40.2, 'Ativo', '2025-03-20 11:00:00'),
	(27.6, 'Inativo', '2025-03-20 11:30:00');
    
CREATE TABLE pedido(
	idPedido INT PRIMARY KEY AUTO_INCREMENT,
    dataPedido DATETIME,
    qtdSensor INT,
    modeloSensor VARCHAR(40),
    valorTotal FLOAT,
    valorFrete FLOAT
);

INSERT INTO pedido (dataPedido, qtdSensor, modeloSensor, valorTotal, valorFrete) VALUES
('2025-03-20 10:00:00', 15, 'Umidade de Solo Capacitivo', 1200.00, 100.00), 
('2025-03-21 11:30:00', 20, 'Temperatura de Solo', 1600.00, 150.00), 
('2025-03-22 14:15:00', 30, 'Umidade de Solo Capacitivo', 2400.00, 200.00),
('2025-03-23 09:00:00', 25, 'Pressão de Água', 2000.00, 180.00), 
('2025-03-24 16:45:00', 18, 'Temperatura de Solo', 1440.00, 120.00);
    
CREATE TABLE Usuario(
	idusuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) UNIQUE,
	email VARCHAR(30),
    senha VARCHAR(20) NOT NULL,
    cep CHAR(8) NOT NULL,
    telefone CHAR(11)
    CONSTRAINT chkEmail
	CHECK(email LIKE '%@%')
);

INSERT INTO Usuario (nome, cpf, email, senha, cep, telefone) VALUES
	('Ana Beatriz Rocha', '99887766554', 'ana.rocha@email.com', 'abc123456', '80010234', '21987654321'),
	('Rafael Martins', '11223344556', 'rafael.martins@email.com', 'qwerty789', '90020345', '21976543210'),
	('Beatriz Almeida', '22334455667', 'beatriz.almeida@email.com', 'senha654321', '70030456', '21865432109'),
	('Eduardo Santos', '33445566778', 'eduardo.santos@email.com', '123qweasd', '60040567', '21754321098'),
	('Juliana Pereira', '44556677889', 'juliana.pereira@email.com', '789pass321', '50050678', '21643210987'),
	('Felipe Oliveira', '55667788990', 'felipe.oliveira@email.com', 'senha@1234', '40060789', '21532109876'),
	('Carla Mendes', '66778899001', 'carla.mendes@email.com', 'mendes@2025', '30070890', '21421098765'); 

SELECT dado AS 'Valor do Dado',
	statusSensor AS 'Status do sensor',
	dtDado AS 'Data e Hora Captada' FROM dadosSensor;

SELECT idPedido AS 'Número do Pedido',
	date_format(dataPedido, '%d/%m/%Y') AS 'Data do Pedido', 
	qtdSensor AS 'Quantidade de Sensores', 
	valorTotal AS 'Valor Total', 
	valorFrete AS 'Valor Fretado' FROM pedido;

SELECT nome AS 'Username', 
	cpf AS 'CPF', 
	cnpj AS 'CNPJ', 
	email AS 'Email', 
	senha AS 'Senha', 
	cep AS 'CEP', 
	telefone AS 'Telefone' FROM cadastro;
                        
SELECT modelo AS 'Modelo do Sensor', 
	date_format(dtInstalacao, '%d/%m/%Y  %H:%m') AS 'Data do Pedido', 
	localInstalacao AS 'Local da instalação', 
	nSerie AS 'Número de Série', 
	tipoLeitura AS 'Tipo de Leitura' FROM SensorDesc;
    
UPDATE pedido SET valorFrete = 120.00
	WHERE idPedido = 3;
    
UPDATE SensorDesc SET localInstalacao = 'Estufa A', dtInstalacao = '2025-03-22 10:00:00'
	WHERE nSerie = 'SN003';
    
UPDATE Usuario SET email = 'ana.rocha@novoemail.com'
	WHERE nome = 'Ana Beatriz Rocha';
    
UPDATE dadoSensor SET statusSensor = 'Inativo' WHERE idDado = 4;

