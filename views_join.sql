-- 1 - Quantos registros foram retornados em cada consulta?
-- A) Selecione os nomes dos artistas (tabela artistas) que tem albuns, e o nome de
-- seus albuns (tabelas albuns) ordenado por id do artista (Order by). [Inner] 347 rows

SELECT `artistas`.`nome`, `albuns`.`titulo`
FROM `artistas`
INNER JOIN `albuns`
ON `artistas`.`id` = `albuns`.`id_artista`
ORDER BY `artistas`.`id`;

-- B) Agora selecione os nomes dos artistas (tabela artistas) que tem, e que não
-- tem albuns, e o nome de seus albuns quando houver (tabelas albuns) ordenado por id
-- do artista (Order by). [left] 418 rows

SELECT `artistas`.`nome`, `albuns`.`titulo`
FROM `artistas`
LEFT JOIN `albuns`
ON `artistas`.`id` = `albuns`.`id_artista`
ORDER BY `artistas`.`id`;

-- 2 - Quantos registros foram retornados em cada consulta?

-- A) Selecione o id e o nome dos cliente (clientes) e o valor suas faturas (faturas)
-- [inner]. 350 rows

SELECT `clientes`.`id`, `clientes`.`nome`, `faturas`.`valor_total`
FROM `clientes`
INNER JOIN `faturas`
ON `clientes`.`id` = `faturas`.`id_cliente`;

-- B) Agora selecione o id e o nome dos cliente (clientes) e o valor suas faturas
-- (faturas). E selecione também as faturas que não tem clientes. [right]. 412 rows

SELECT `clientes`.`id`, `clientes`.`nome`, `faturas`.`valor_total`
FROM `clientes`
RIGHT JOIN `faturas`
ON `clientes`.`id` = `faturas`.`id_cliente`;

-- 3 - Quantos registros foram retornados em cada consulta?

-- A) Selecione o nome da canção (cancoes) e o tipo e arquivo delas [inner]. 850 rows

SELECT `cancoes`.`nome`, `tipos_de_arquivo`.`nome`
FROM `cancoes`
INNER JOIN `tipos_de_arquivo`
ON `cancoes`.`id_tipo_de_arquivo` = `tipos_de_arquivo`.`id`;

-- B) Agora selecione o nome da canção (cancoes) e o tipo e arquivo delas. E
-- selecione também os tipos de arquivo que não tem musicas. [right]. 853 rows

SELECT `cancoes`.`nome`, `tipos_de_arquivo`.`nome`
FROM `cancoes`
RIGHT JOIN `tipos_de_arquivo`
ON `cancoes`.`id_tipo_de_arquivo` = `tipos_de_arquivo`.`id`;

-- C) Agora selecione o nome da canção (cancoes) e o tipo e arquivo delas. E
-- selecione também as musicas que não tem tipo de arquivo. [left]. 3503 rows

SELECT `cancoes`.`nome`, `tipos_de_arquivo`.`nome`
FROM `cancoes`
LEFT JOIN `tipos_de_arquivo`
ON `cancoes`.`id_tipo_de_arquivo` = `tipos_de_arquivo`.`id`;


-- Transforme todas as consultas feitas nos exercícios anteriores (A - JOINS) em
-- views. E salve-as.

CREATE VIEW `artistas_albuns` AS
SELECT `artistas`.`nome`, `albuns`.`titulo`
FROM `artistas`
INNER JOIN `albuns`
ON `artistas`.`id` = `albuns`.`id_artista`
ORDER BY `artistas`.`id`;

-- Crie Views para as seguintes consultas:

-- Consultar todas as canções;

CREATE VIEW `todas_as_cancoes` AS
SELECT `cancoes`.`nome` FROM `cancoes`;

-- Consultar todas as faturas com valor maior que 5.

CREATE VIEW `faturas_maior_5` AS
SELECT `faturas`.`id_cliente`, `faturas`.`valor_total` FROM `faturas`
HAVING `faturas`.`valor_total` > 5;

-- Consultar todos artistas cujo o nome começa com a letra B.

CREATE VIEW `artista_com_b` AS
SELECT `artistas`.`nome` FROM `artistas`
WHERE `artistas`.`nome` LIKE "B%";
