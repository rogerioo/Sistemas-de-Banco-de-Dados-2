-- ----------------------------------------  << Programação do SGBD >>  ----------------------------------------
--
--                                        SCRIPT PROCEDURAL (DML E DDL)                                        
--
-- Data Criacao ...........: 09/11/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0.22
-- Base de Dados (nome) ...: agenda
--
--
-- PROJETO => 01 Base de Dados
--            04 Tabelas
--            03 Funções
--            01 Procedimento
--
-- --------------------------------------------------------------------------------------------------------------

-- Utiliza a base 'scriptFisico_20181026' da área de compartilhamento
USE agenda;


-- Apaga previamente para evitar erros
DROP FUNCTION IF EXISTS PEOPLECOUNTER;
DROP PROCEDURE IF EXISTS PHONESCOUNTER;
DROP FUNCTION IF EXISTS QTDPRODUTOS;
DROP FUNCTION IF EXISTS TOTFINANCEIRO;


DELIMITER $$

-- 1) Crie uma função que conte quantas tuplas tem na tabela PESSOA;
CREATE FUNCTION PEOPLECOUNTER() RETURNS INT
READS SQL DATA
BEGIN
  DECLARE 
    total INT;
  
  SELECT COUNT(*) INTO total FROM pessoa;

  RETURN total;
END$$

-- 2) Elabore um procedimento que conte quantos telefones tem uma pessoa específica (atividade a ser realizada 
--    com instrução que apresente o valor do parâmetro de saída);
CREATE PROCEDURE PHONESCOUNTER(idPessoa INT)
READS SQL DATA
BEGIN
  DECLARE 
    total INT;

  SELECT COUNT(*) INTO total FROM telefone t WHERE idPessoa = t.idPessoa;

  SELECT total as `Total de Telefones`;
END$$

-- 3) Crie uma função que mostre a quantidade de produtos específicos que será solicitado pelo nome do produto;
CREATE FUNCTION QTDPRODUTOS(name VARCHAR(80)) RETURNS INT
READS SQL DATA
BEGIN
DECLARE
  total INT;

  SELECT qtde INTO total FROM produtos WHERE nome = name;

  RETURN total;
END$$

-- 4) Faça uma função que calcule para um produto específico a quantidade financeira em estoque que está armazenada
--    nessa base de dados (total em valor financeiro R$).
CREATE FUNCTION TOTFINANCEIRO(name VARCHAR(80)) RETURNS FLOAT
READS SQL DATA
BEGIN
DECLARE
  total FLOAT;

  SELECT qtde * preco INTO total FROM produtos WHERE nome = name;

  RETURN total;
END$$

DELIMITER ;

-- Testando os procedimento e funções

SELECT PEOPLECOUNTER();
CALL PHONESCOUNTER(2);
SELECT QTDPRODUTOS('Sabonete');
SELECT TOTFINANCEIRO('Cerveja');