CREATE DATABASE projeto_pi;

USE projeto_pi;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50) NOT NULL,
cpf CHAR(11) NOT NULL,
cnpj CHAR(14) NOT NULL,
email VARCHAR(50) NOT NULL CONSTRAINT chkEmail CHECK (email LIKE '%@%'),
senha VARCHAR(20) NOT NULL,
cep CHAR(8) NOT NULL,
telefone CHAR(11) NOT NULL
);

INSERT INTO usuario (nome, cpf, cnpj, email, senha, cep, telefone) VALUES
('João Silva', '12345678901', '12345678000199', 'joao.silva@email.com', 'senha123', '01001000', '11987654321'),
('Maria Oliveira', '23456789012', '23456789000288', 'maria.oliveira@email.com', 'segura456', '02002000', '11976543210'),
('Carlos Souza', '34567890123', '34567890000377', 'carlos.souza@email.com', 'forte789', '03003000', '11965432109'),
('Ana Lima', '45678901234', '45678912000466', 'ana.lima@email.com', 'senha321', '04004000', '11954321098'),
('Pedro Santos', '56789012345', '56789012300555', 'pedro.santos@email.com', 'minha987', '05005000', '11943210987'),
('Juliana Costa', '67890123456', '67890123400644', 'juliana.costa@email.com', 'juliana123', '06006000', '11932109876'),
('Ricardo Almeida', '78901234567', '78901234500733', 'ricardo.almeida@email.com', 'ricardo2024', '07007000', '11921098765'),
('Fernanda Rocha', '89012345678', '89012345600822', 'fernanda.rocha@email.com', 'fernanda777', '08008000', '11910987654'),
('Gustavo Nunes', '90123456789', '90123456700911', 'gustavo.nunes@email.com', 'guga888', '09009000', '11909876543'),
('Camila Ribeiro', '01234567890', '01234567801000', 'camila.ribeiro@email.com', 'camila999', '10010000', '11908765432');

SELECT nome AS 'Nome Usuário', 
cpf AS 'CPF', 
cnpj AS 'CNPJ', 
email AS 'Email', 
senha AS 'Senha', 
cep AS 'CEP', 
telefone AS 'Telefone' FROM usuario;

CREATE TABLE pedido (
idPedido INT PRIMARY KEY AUTO_INCREMENT,
dtPedido VARCHAR (50) NOT NULL,
qtdSensor INT NOT NULL,
valorTotal DECIMAL(7,2),
valorFrete DECIMAL(7,2)
);


INSERT INTO pedido (dtPedido, qtdSensor, valorTotal, valorFrete) VALUES
('2024-03-01', 2, 150.00, 20.00),
('2024-03-02', 5, 375.00, 25.00),
('2024-03-03', 3, 225.00, 18.00),
('2024-03-04', 1, 75.00, 15.00),
('2024-03-05', 4, 300.00, 22.00),
('2024-03-06', 6, 450.00, 30.00),
('2024-03-07', 2, 150.00, 20.00),
('2024-03-08', 8, 600.00, 35.00),
('2024-03-09', 10, 750.00, 40.00),
('2024-03-10', 7, 525.00, 28.00);

SELECT date_format(dtPedido, '%d-%m-%Y') AS 'Data do Pedido', 
qtdSensor AS 'Quantidade de Sensores', 
valorTotal AS 'Valor Total', 
valorFrete AS 'Valor do Frete' FROM pedido;

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR (30) NOT NULL DEFAULT 'Umidade de solo capacitivo',
dtInstalacao DATETIME NOT NULL,
localInstalacao VARCHAR(50) NOT NULL,
numSerie VARCHAR(20) NOT NULL UNIQUE,
dadosSensor DECIMAL(5,2) NOT NULL,
status VARCHAR(15) NOT NULL CONSTRAINT chkStatus CHECK (status IN('Ativo','Inativo'))
);

INSERT INTO sensor (modelo, dtInstalacao, localInstalacao, numSerie, dadosSensor, status) VALUES
('Umidade de solo capacitivo', '2024-03-01 10:15:00', 'Fazenda A - Lote 1', 'SN123456', 23.50, 'Ativo'),
('Umidade de solo capacitivo', '2024-03-02 11:30:00', 'Fazenda B - Setor 3', 'SN123457', 19.80, 'Inativo'),
('Umidade de solo capacitivo', '2024-03-03 12:45:00', 'Fazenda C - Pátio 2', 'SN123458', 30.20, 'Ativo'),
('Umidade de solo capacitivo', '2024-03-04 14:00:00', 'Fazenda D - Galpão 5', 'SN123459', 25.75, 'Inativo'),
('Umidade de solo capacitivo', '2024-03-05 15:15:00', 'Fazenda E - Área Externa', 'SN123460', 18.60, 'Ativo'),
('Umidade de solo capacitivo', '2024-03-06 16:30:00', 'Fazenda F - Estufa 7', 'SN123461', 22.40, 'Inativo'),
('Umidade de solo capacitivo', '2024-03-07 17:45:00', 'Fazenda G - Lote 4', 'SN123462', 27.90, 'Inativo'),
('Umidade de solo capacitivo', '2024-03-08 19:00:00', 'Fazenda H - Campo 6', 'SN123463', 20.10, 'Ativo'),
('Umidade de solo capacitivo', '2024-03-09 20:15:00', 'Fazenda I - Setor 2', 'SN123464', 24.30, 'Ativo'),
('Umidade de solo capacitivo', '2024-03-10 21:30:00', 'Fazenda J - Área Norte', 'SN123465', 29.50, 'Ativo');

SELECT modelo AS 'Modelo do Sensor',
date_format(dtInstalacao, '%d-%m-%Y  %H:%m') AS 'Data do Pedido', 
localInstalacao AS 'Local de instalação', 
numSerie AS 'Número de Série', 
dadosSensor AS 'Dados do Sensor',
status AS 'Status' FROM sensor;