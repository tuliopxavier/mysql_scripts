CREATE SCHEMA `meusistema`;

CREATE TABLE `meusistema`.`usuarios`(
	`usuario_id` INT NOT NULL AUTO_INCREMENT,
    `usuario_nome` VARCHAR(100) NOT NULL,
    `usuario_login` VARCHAR(50) NOT NULL,
    `usuario_senha` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`usuario_id`)
);

INSERT INTO `meusistema`.`usuarios` (`usuario_nome`, `usuario_login`, `usuario_senha`)
VALUES ('Felipe Melo', 'felipe001', 'felipe123'),
('Gustavo Bitencourt', 'gus001', 'gus123'),
('Lucas Neiva', 'lucas001', 'lucas123'),
('Diego Rodrigues', 'diego001', 'diego123'),
('Túlio Xavier', 'tulio001', 'tulio123');

SELECT * FROM `meusistema`.`usuarios`;

UPDATE `meusistema`.`usuarios` SET `usuario_nome` = 'Felipe de Melo'
WHERE `usuario_nome` = 'Felipe Melo';

SET SQL_SAFE_UPDATES = 0;

DELETE FROM `meusistema`.`usuarios` 
WHERE `usuario_nome` = 'Gustavo Bitencourt';

