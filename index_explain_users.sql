-- 1) Revisão índices
-- a) Ex1: Na tabela canções liste todos os índices criados.

SHOW INDEX FROM `cancoes`;

-- b) Caso exista um índice criado na coluna nome,
-- exclua-o.

DROP INDEX ``
ON ``;

-- c) Agora, crie um índice para a coluna nome.

CREATE INDEX `nome_das_cancoes` ON `cancoes`(`nome`);

-- 2) Explain
-- a) Use o comando Explain para fazer uma pesquisa
-- (select) na tabela canções que retorne o tamanho
-- da música chamada “Be Yourself”. E verifique o
-- número de rows percorridas (deve ser 1);

EXPLAIN SELECT `nome` FROM `cancoes`
WHERE `nome` = "Be Yourself";

-- 3) Priority
-- a) Selecione todos os campos da tabela canções com
-- alta prioridade.

SELECT HIGH_PRIORITY * FROM `cancoes`;

-- b) Atualize o nome da canção “Crazy” para “I am
-- Crazy” com baixa prioridade.

UPDATE LOW_PRIORITY `cancoes` 
SET `nome` = 'I am Crazy'
WHERE `nome` = 'Crazy';

-- 4) Benchmark
-- a) Faça o benchmark de uma consulta que retorne o
-- compositor da canção “I am Crazy” limitado a 1
-- registro realizada 100 milhões de vezes.

SELECT BENCHMARK(100000000, (SELECT `compositor` FROM `cancoes` WHERE `nome` = 'I am Crazy' LIMIT 1));

-- 5) Permissões
-- a) Exiba todos os usuários dos bancos de dados.

SELECT * FROM `mysql`.`user`;

-- b) Crie três usuários, um com o seu primeiro nome e
-- outros dois com nomes fictícios.

CREATE USER 'tulio'@'localhost'
IDENTIFIED BY 'digitalhouse';

CREATE USER 'pereira'@'localhost'
IDENTIFIED BY 'digitalhouse';

CREATE USER 'xavier'@'localhost'
IDENTIFIED BY 'digitalhouse';

-- c) Exiba novamente os usuários dos bancos de dados
-- para se certificar de que foram criados.

SELECT * FROM `mysql`.`user`;

-- d) Conceda todos os privilégios, em todos os bancos e
-- tabelas para o usuário com o seu nome.

GRANT ALL PRIVILEGES ON *.* TO 'tulio'@'localhost';

-- e) Para o segundo usuário criado conceda a permissão
-- de inserir dados em todos os bancos e tabelas.

GRANT INSERT ON *.* TO 'pereira'@'localhost';

-- f) Para o terceiro usuário conceda apenas a
-- permissão de selecionar dados da tabela canções
-- do banco musimundos_v2.

GRANT SELECT ON `db_musimundosV2`.`cancoes` TO 'xavier'@'localhost';

-- g) Exiba os privilégios do usuário com o seu nome.

SHOW GRANTS FOR 'tulio'@'localhost';

-- h) Revogue a permissão de atualizar dados (update)
-- do usuário com o seu nome, para todos os bancos
-- de dados e tabelas.

REVOKE UPDATE ON *.* FROM 'tulio'@'localhost';

-- i) Exiba novamente os privilégios do usuário com o
-- seu nome.

SHOW GRANTS FOR 'tulio'@'localhost';

-- j) Exclua o usuário com o seu nome e exiba
-- novamente os usuários.

DROP USER 'tulio'@'localhost';
SELECT * FROM `mysql`.`user`;
