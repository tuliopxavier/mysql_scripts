-- ROOM 2
-- Gaspar Sousa, Gustavo Bitencourt, Nathalia Vieira, Guilherme Anzolin Iaquinto, Reginaldo Guimarães

-- Exercício 1 - Ordem de processamento e boas práticas.

-- GRUPO 2
SELECT `artistas`.`nome` as `NomeArtista`,
		`albuns`.`titulo` as `NomeAlbum` 
FROM `artistas`
INNER JOIN `albuns`
on `artistas`.`id` = `albuns`.`id_artista`
WHERE `artistas`.`nome` LIKE "%kiss%"
order by `artistas`.`id`;

-- Neste exercício em grupo, analise a query designada ao seu grupo
-- observando se foram empregadas boas práticas e onde elas podem ser
-- melhoradas em relação a isso.

-- É indicado que o comando LIKE possua pelo menos três caracteres no começo da string.
-- Colocar os comandos em maiúsculo (não vai melhorar a performance mas melhora a legibilidade).


-- Analise a mesma query em relação a ordem de processamento. Faça uma
-- lista com a ordem de execução.

-- FROM - ON - INNER JOIN - WHERE - SELECT - ORDER BY



-- Exercicio 2 - Índices (tabela cancoes)

-- Exiba os índices da tabela. (Show Index).

SHOW INDEX FROM `cancoes`;

-- Execute um explain select selecionando o campo
-- nome da canção “Hero” e observe quantas rows foram
-- percorridas para chegar ao resultado.

EXPLAIN SELECT `nome` FROM `cancoes`
WHERE `nome` = "Hero";

-- Crie um índice chamado `I_cancoes_nome` para a
-- tabela pelo campo nome.

CREATE INDEX `i_cancoes_nome`
ON `cancoes`(`nome`);

-- Execute o explain novamente e veja quantas rows
-- foram percorridas agora.

-- Exclua este índice.

DROP INDEX `i_cancoes_nome`
ON `cancoes`;
