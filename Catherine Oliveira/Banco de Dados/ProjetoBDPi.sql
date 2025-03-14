create database ProjetoPi;

use ProjetoPi;

create table sensor (
idSensor int primary key auto_increment,
Modelo VARCHAR (30),
DtInstalacao DATETIME,
LocalInstalacao VARCHAR(30),
numSerie VARCHAR(20),
StatusSensor VARCHAR (20)
);
alter table sensor add constraint chkStatus
	check(StatusSensor in('Ativo','Inativo'));
    
insert into sensor (idSensor, Modelo, DtInstalacao, LocalInstalacao, numSerie, StatusSensor)
values
(default, 'ModeloA', '2025-01-15 10:30:00', 'Sala 101', 'SN123456789', 'Ativo'),
(default, 'ModeloB', '2025-02-20 14:45:00', 'Sala 102', 'SN987654321', 'Inativo'),
(default, 'ModeloC', '2025-03-05 09:00:00', 'Sala 103', 'SN112233445', 'Ativo'),
(default, 'ModeloA', '2025-01-25 08:00:00', 'Sala 104', 'SN998877665', 'Inativo'),
(default, 'ModeloB', '2025-02-10 16:15:00', 'Sala 105', 'SN556677889', 'Ativo');

select * from sensor;

Create table Registro (
idCadastro int primary key auto_increment,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11),
    cnpj CHAR(14) NOT NULL,
    email VARCHAR(30),
    senha VARCHAR(20) NOT NULL,
    cep CHAR(8) NOT NULL,
    telefone CHAR(11)
);

alter table Registro add constraint chkEmail
check(email like '%@%');

insert into Registro (idCadastro, nome, cpf, cnpj, email, senha, cep, telefone) values
(default,'Camila Cabello', '10394562012', '12345678000195', 'camila.cabello@email.com', 'senha123', '12345678', '11987654321'),
(default,'Sabrina Carpinter', '91235435109', '98765432000182', 'sabrina_capinter@email.com', 'senha456', '98765432', '21987654321'),
(default,'Lena Luthor', '09212394284', '45678912000164', 'Lena_Luthor@email.com', 'senha789', '23456789', '31987654321'),
(default,'Ana Carolina', '10384912304', '11223344000177', 'ana.carolina@email.com', 'senha101', '34567890', '41987654321'),
(default,'Marcelo D2', '12394245358', '66778899000122', 'Marcelod2@email.com', 'senha202', '45678901', '51987654321');

select * from Registro;

Create Table pedido(
	idPedido int primary key auto_increment,
    dataPedido DATETIME,
    qtdSensor INT,
    modeloSensor VARCHAR(40),
    valorTotal FLOAT,
    valorFrete FLOAT
);

insert into pedido (idPedido, dataPedido, qtdSensor, modeloSensor, valorTotal, valorFrete) values 
    (default, '2024-02-15 09:30:00', 10, 'Umidade de Solo Capacitivo', 5000.00, 200.00),
    (default, '2024-02-20 11:00:00', 5, 'Umidade de Solo Capacitivo', 2500.00, 150.00),
    (default, '2024-02-25 14:20:00', 8, 'Umidade de Solo Capacitivo', 4000.00, 180.00),
    (default, '2024-03-01 16:40:00', 12, 'Umidade de Solo Capacitivo', 6000.00, 220.00),
    (default, '2024-03-05 18:10:00', 7, 'Umidade de Solo Capacitivo', 3500.00, 160.00);


select * from pedido;

