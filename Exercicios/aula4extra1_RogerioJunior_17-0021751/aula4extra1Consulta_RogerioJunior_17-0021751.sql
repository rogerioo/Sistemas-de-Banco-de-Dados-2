-- -------------------------------------------   << Aula 04 - Extra 01 >>   --------------------------------------------
--
--                                                 SCRIPT DE APAGAR (DDL)                                                 
-- 
-- Data Criação ...........: 30/03/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula4extra1
-- 
-- PROJETO => 01 Base de Dados
--         => 02 Tabelas
-- 
-- ------------------------------------------------------------------------------------------------------------------------

USE aula4extra1;

-- A) Projeção de sigla e nome do estado de sigla SP e DF;

SELECT * 
  FROM ESTADO AS E 
  WHERE E.sigla IN ('SP', 'DF');

-- B) Selecione somente o nome e a sigla das cidades que são dos estados RJ, DF e GO;

SELECT C.nome, C.sigla 
  FROM CIDADE AS C 
  WHERE C.sigla IN ('RJ', 'DF', 'GO')
ORDER BY C.sigla, C.nome;

-- C) Selecione todas as cidades do primeiro estado que você cadastrou mostrando somente o nome da cidade,
--    o nome do estado e sua sigla;

SELECT C.nome, E.nome, C.sigla 
  FROM CIDADE AS C
    INNER JOIN ESTADO AS E
      ON E.sigla = C.sigla
  WHERE E.sigla = 'DF'
ORDER BY C.nome;

-- D) Selecione somente o nome e a sigla do estado que você cadastrou por último e todas as cidades
--    cadastradas nele, mostrando o seu nome e a quantidade de habitantes em ordem crescente de nome
--    de estado e nome de cidade.

SELECT E.nome, E.sigla, C.nome, C.habitantes
  FROM ESTADO AS E
    INNER JOIN CIDADE AS C
      ON E.sigla = C.sigla
  WHERE E.sigla = 'GO'
ORDER BY E.nome, C.nome;
