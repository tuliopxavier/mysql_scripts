-- ================ CRIANDO BANCO DE DADOS ================

CREATE SCHEMA `db_transervice`;


-- ================ CRIANDO TABELAS ================

CREATE TABLE `db_transervice`.`motoristas` (
	`motorista_id` INT NOT NULL AUTO_INCREMENT,
	`motorista_nome` VARCHAR(100) NOT NULL,
    `motorista_imagem` VARCHAR(100) NOT NULL,
    `motorista_endereco` VARCHAR(100) NOT NULL,
    `motorista_telefone` VARCHAR(15) NOT NULL,
    `motorista_categoria` VARCHAR(4) NOT NULL,
	PRIMARY KEY (`motorista_id`)
);

CREATE TABLE `db_transervice`.`empresa` (
	`empresa_id` INT NOT NULL AUTO_INCREMENT,
	`empresa_nome` VARCHAR(100) NOT NULL,
    `empresa_endereco` VARCHAR(100) NOT NULL,
    `empresa_telefone` VARCHAR(15) NOT NULL,
	PRIMARY KEY (`empresa_id`)
);

CREATE TABLE `db_transervice`.`corridas` (
	`corrida_id` INT NOT NULL AUTO_INCREMENT,
	`corrida_partida` VARCHAR(100) NOT NULL,
    `corrida_chegada` VARCHAR(100) NOT NULL,
    `corrida_inicio` DATETIME NOT NULL,
    `corrida_fim` DATETIME NOT NULL,
    `corrida_valor` DECIMAL(5,2) NOT NULL,
    `corrida_descricao` TEXT NULL,
    `motorista_id` INT NOT NULL,
    `empresa_id` INT NOT NULL,
	PRIMARY KEY (`corrida_id`),
    CONSTRAINT `FKmotorista`
		FOREIGN KEY (`motorista_id`)
		REFERENCES `db_transervice`.`motoristas` (`motorista_id`),
	CONSTRAINT `FKempresa`
		FOREIGN KEY (`empresa_id`)
		REFERENCES `db_transervice`.`empresa` (`empresa_id`)
);


-- ================ INSERINDO DADOS NA TABELA MOTORISTAS ================

INSERT INTO `motoristas` (
	`motorista_nome`,
    `motorista_imagem`,
    `motorista_endereco`,
    `motorista_telefone`,
    `motorista_categoria`)
VALUES (
	'José Matheus',
    'example.com/repository/user/image.png',
    'Rua Almeida Sande, 30 - Barris - Salvador-BA', 
    71991234567, 
    'AB'
);

INSERT INTO `motoristas` (
	`motorista_nome`,
    `motorista_imagem`,
    `motorista_endereco`,
    `motorista_telefone`,
    `motorista_categoria`
)
VALUES (
	'Mário Aleluia',
    'example.com/repository/user/image.png',
    'Rua Theodoro Sampaio, 12 - Barris - Salvador-BA',
    71993456789,
    'ABC'
);


-- ================ INSERINDO DADOS NA TABELA EMPRESA ================

INSERT INTO `empresa` (
	`empresa_nome`,
    `empresa_endereco`,
    `empresa_telefone`
)
VALUES (
	'Dow Química Camaçari',
    'Estrada CIA-Aeroporto, S/N, Camaçari',
    '7131234567'
);

INSERT INTO `empresa` (
	`empresa_nome`,
    `empresa_endereco`,
    `empresa_telefone`
)
VALUES (
	'Dow Química Simões Filho',
    'Avenida dos Estados, 5500, Simões Filho',
    '7131234567'
);
    

-- ================ INSERINDO DADOS NA TABELA CORRIDAS ================

INSERT INTO `corridas` (
	`corrida_partida`,
    `corrida_chegada`,
    `corrida_inicio`,
    `corrida_fim`,
    `corrida_valor`,
    `corrida_descricao`,
    `motorista_id`,
    `empresa_id`
)
VALUES (
	'Dow Química Camaçari',
	'Salvador',
    '2021-02-01 18:34:02',
    '2021-02-01 19:20:48',
    77.30,
    'Troca de turno',
    '1',
    '1'
);
    
INSERT INTO `corridas` (
	`corrida_partida`,
    `corrida_chegada`,
    `corrida_inicio`,
    `corrida_fim`,
    `corrida_valor`,
    `corrida_descricao`,
    `motorista_id`,
    `empresa_id`
)
VALUES (
	'Salvador',
	'Dow Química Camaçari',
    '2021-02-02 07:02:33',
    '2021-02-02 07:47:12',
    77.30,
    'Troca de turno',
    '2',
    '1'
);

INSERT INTO `corridas` (
	`corrida_partida`,
    `corrida_chegada`,
    `corrida_inicio`,
    `corrida_fim`,
    `corrida_valor`,
    `corrida_descricao`,
    `motorista_id`,
    `empresa_id`
)
VALUES (
	'Simões Filho',
	'Dow Química Simões Filho',
    '2021-02-02 18:25:45',
    '2021-02-02 19:10:49',
    43.70,
    'Troca de turno',
    '2',
    '2'
);
    
INSERT INTO `corridas` (
	`corrida_partida`,
    `corrida_chegada`,
    `corrida_inicio`,
    `corrida_fim`,
    `corrida_valor`,
    `corrida_descricao`,
    `motorista_id`,
    `empresa_id`
)
VALUES (
	'Dow Química Simões Filho',
	'Simões Filho',
    '2021-02-02 06:59:41',
    '2021-02-02 07:31:13',
    43.70,
    'Troca de turno',
    '1',
    '2'
);

-- ================ MUDANDO O SAFE MODE PARA LIBERAR ALTERAÇÕES NAS TABELAS ================

SET SQL_SAFE_UPDATES = 0;


-- ================ ATUALIZAÇÃO DE DADOS NA TABELA MOTORISTAS ================

UPDATE `motoristas`
SET `motorista_telefone` = '71988112233'
WHERE `motorista_telefone` = '71993456789';


-- ================ DELETANDO DADOS NA TABELA CORRIDAS ================

DELETE FROM `db_transervice`.`corridas`
WHERE `corrida_id` =  4;


-- ================ SELECIONANDO DADOS DAS TABELAS ================

SELECT * FROM `db_transervice`.`corridas`;
SELECT * FROM `db_transervice`.`empresa`;
SELECT * FROM `db_transervice`.`motoristas`;


-- ================ SELECIONANDO DADOS NA TABELA MOTORISTAS ================

SELECT 
	`motorista_nome` AS `nome`, 
    `motorista_telefone` AS `telefone` 
FROM `motoristas`;

