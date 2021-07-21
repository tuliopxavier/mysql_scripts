-- Exemplo da aula

SELECT * FROM `clientes`;
SELECT * FROM `faturas`;

SELECT `c`.`pais` AS `pais`,
COUNT(`c`.`id`) AS `qtd_clientes`,
AVG(`f`.`valor_total`) AS `media_faturas`
FROM `clientes` AS `c`
INNER JOIN `faturas` AS `f`
ON `c`.`id`= `f`.`id_cliente`
GROUP BY `c`.`pais`
HAVING `qtd_clientes` > 3
ORDER BY `qtd_clientes` DESC
LIMIT 7;


-- Exercícios de fixação
-- Utilizando o banco de dados musmundos_v2 execute:

-- 1) Liste a quantidade de canções existem para cada gênero musical, agrupando a consulta por gênero e ordenando da maior quantidade para a menor.

SELECT `generos`.`nome`,
COUNT(`cancoes`.`id`) AS `qtd_cancoes`
FROM `cancoes`
INNER JOIN `generos`
ON `generos`.`id` = `cancoes`.`id_genero` 
GROUP BY `generos`.`id`
ORDER BY `qtd_cancoes` DESC;

-- 2) Liste a quantidade de canções existentes para cada gênero musical, agrupando por gênero. Exiba apenas os genêros que tem mais de 10 canções.

SELECT `g`.`nome`,
COUNT(`c`.`id`) AS `qtd_cancoes`
FROM `cancoes` AS `c`
INNER JOIN `generos` AS `g`
ON `g`.`id` = `c`.`id_genero` 
GROUP BY `g`.`id`
HAVING `qtd_cancoes` > 10
ORDER BY `qtd_cancoes` DESC;

-- 3) Utilizando as tabelas clientes e faturas, liste os países, a quantidade de clientes e a soma das faturas por país,ordenando do maior para o menor, limitando a consulta a 7 registros.

SELECT `clientes`.`pais` AS `pais`,
COUNT(`clientes`.`id`) AS `qtd_clientes`,
SUM(`faturas`.`valor_total`) AS `soma_faturas`
FROM `clientes`
INNER JOIN `faturas`
ON `clientes`.`id`= `faturas`.`id_cliente`
GROUP BY `clientes`.`pais`
ORDER BY `soma_faturas` DESC
LIMIT 7;

SELECT `entidade01`.`atributo`, `entidade02`.`atributo`
FROM `entidade01`
INNER JOIN `entidade02`
ON `PK da entidade01` = `FK da entidade02`
GROUP BY `entidade01`.`atributo`
ORDER BY `entidade`.`atributo`
LIMIT num;
