-- -------------------------------------------   << Escala de Plantonistas >>   --------------------------------------------
--
--                                                 SCRIPT DE APAGAR (DDL)                                                 
-- 
-- Data Criação ...........: 23/03/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula3exer1Evolucao2
-- 
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
-- 
-- ------------------------------------------------------------------------------------------------------------------------

USE aula3exer1Evolucao2;

-- Consulta que lista facilmente todos os plantonistas que são Cardiologistas

CREATE VIEW PLAN_CARDIOLOGIA 
  (name, matricula, sexo) 
AS
  SELECT P.nome, P. matriculaFuncional, P.sexo
    FROM PLANTONISTA AS P
      INNER JOIN possui AS A
        ON A.matriculaFuncional = P.matriculaFuncional
      INNER JOIN ESPECIALIDADE AS E
        ON E.idEspecialidade = A.idEspecialidade
    WHERE E.nome = 'Cardiologia'
  ORDER BY P.nome;
