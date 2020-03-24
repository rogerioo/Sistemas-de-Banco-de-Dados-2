-- -------------------------------------------   << Escala de Plantonistas >>   --------------------------------------------
--
--                                                 SCRIPT DE POPULAR (DML)                                                 
-- 
-- Data Criacao ...........: 23/03/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula3exer1
-- 
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
-- 
-- ------------------------------------------------------------------------------------------------------------------------

USE aula3exer1;

INSERT INTO PLANTONISTA
  (nome, sexo)
VALUES
  ('Rogério Júnior', 'M'),
  ('Lucas Fellipe', 'M'),
  ('Fabiana Ribas', 'F');

INSERT INTO ESPECIALIDADE
  (nome)
VALUES
  ('Cardiologista'),
  ('Clínico Geral'),
  ('Ortopedista');

INSERT INTO SETOR
  (nome)
VALUES
  ('Cardiologia'),
  ('Clínica Geral'),
  ('Ortopedia');

INSERT INTO alocado
  (idSetor, matriculaFuncional, saida, entrada)
VALUES
  (1, 1, '2018-09-21 19:00', '2018-09-22 07:00'),
  (2, 2, '2018-12-30 07:00', '2018-09-30 19:00'),
  (3, 3, '2019-04-03 19:00', '2018-04-04 07:00');

INSERT INTO possui
  (matriculaFuncional, idEspecialidade)
VALUES
  (1, 1),
  (2, 2),
  (3, 3);
