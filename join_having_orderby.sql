SELECT * FROM `db_musimundosV2`.`clientes`;

SELECT `clientes`.`id`, `clientes`.`nome`, `faturas`.`valor_total`
FROM `clientes`
INNER JOIN `faturas`
ON `clientes`.`id` = `faturas`.`id_cliente`
HAVING `faturas`.`valor_total` > 10
ORDER BY `clientes`.`nome` DESC;

SELECT `c`.`id`, `c`.`nome`, `f`.`valor_total`
FROM `clientes` AS `c`
INNER JOIN `faturas` AS `f`
ON `c`.`id` = `f`.`id_cliente`
HAVING `f`.`valor_total` > 10
ORDER BY `c`.`nome` DESC;

SELECT 
	`c`.`id` AS `id_cliente`, 
	`c`.`nome` AS `nome_cliente`, 
	`f`.`valor_total` AS `valor_fatura`
FROM `clientes` AS `c`	
INNER JOIN `faturas` AS `f`
ON `c`.`id` = `f`.`id_cliente`
HAVING `f`.`valor_total` > 10
ORDER BY `c`.`nome` DESC;


-- Exercícios

-- Usando a base musimundos_V2, execute as seguintes consultas:

-- -- 1 - Selecione o nome dos artistas(tabela artistas) com o nome de seus albuns (tabela albuns)
-- ordenado por id do artista (Order by).

SELECT `artistas`.`nome`, `albuns`.`titulo`, `cancoes`.`nome`
FROM `artistas`
INNER JOIN `albuns`
ON `artistas`.`id` = `albuns`.`id_artista`
INNER JOIN `cancoes`
ON `albuns`.`id` = `cancoes`.`id_album`
ORDER BY `artistas`.`id`;

-- -- 2 - Selecione o nome do cliente (clientes) e suas faturas (faturas), porém somente as faturas com
-- valor maior de 5 ordenados pelo valor da fatura decrescente.

SELECT `clientes`.`nome`, `faturas`.`valor_total`
FROM `clientes`
INNER JOIN `faturas`
ON `clientes`.`id` = `faturas`.`id_cliente`
HAVING `faturas`.`valor_total` > 5
ORDER BY `faturas`.`valor_total` DESC;

-- -- 3 Selecione o nome das cancoes (tabela cancoes) e o tipo de arquivo (tabela tipos_de_arquivos) e
-- exiba o nome da canção e o tipo ordenado pelo id da canção.

SELECT `cancoes`.`nome`, `tipos_de_arquivo`.`nome`
FROM `cancoes`
INNER JOIN `tipos_de_arquivo`
ON `tipos_de_arquivo`.`id` = `cancoes`.`id_tipo_de_arquivo`
ORDER BY `cancoes`.`id`;
