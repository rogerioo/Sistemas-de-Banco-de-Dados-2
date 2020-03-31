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

INSERT INTO ESTADO
  (sigla, nome)
VALUES
  ('DF', 'Distrito Federal'),
  ('AL', 'Alagoas'),
  ('PB', 'Paraíba'),
  ('RJ', 'Rio de Janeiro'),
  ('SP', 'São Paulo'),
  ('GO', 'Goiás');

INSERT INTO CIDADE
  (nome, sigla, habitantes)
VALUES
  ('Brasília', 'DF', 2974703),
  ('Maceió', 'AL', 1012387),
  ('João Pessoa', 'PB', 1099360),
  ('Taguatinga', 'DF', 221909),
  ('Gama', 'DF', 127121),
  ('Rio de Janeiro', 'RJ', 6718903),
  ('Niterói', 'RJ', 513584),
  ('Goiania', 'GO', 1516113),
  ('Niquelândia', 'GO', 46388),
  ('Luziânia', 'GO', 	208299),
  ('Angra dos Reis', 'RJ', 203785);
