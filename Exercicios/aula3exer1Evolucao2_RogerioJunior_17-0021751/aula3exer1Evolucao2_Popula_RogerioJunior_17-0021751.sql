-- -------------------------------------------   << Escala de Plantonistas >>   --------------------------------------------
--
--                                                 SCRIPT DE POPULAR (DML)                                                 
-- 
-- Data Criacao ...........: 23/03/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula3exer1Evolucao2
-- 
-- Data Ultima Alteracao ..: 30/03/2020
--   => Atualização dos dados com os scripts da área de compartilhamento
-- 
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
-- 
-- ------------------------------------------------------------------------------------------------------------------------

USE aula3exer1Evolucao2;

INSERT INTO PLANTONISTA
  (nome, sexo)
VALUES
  ('Mario da Silva',     'M'),
  ('Isabelle Rogrigues', 'F'),
  ('Maria de Lima',      'F'),
  ('Francisco Chagas',   'M'),
  ('Rogério Junior', 'M');


INSERT INTO SETOR
  (nome)
VALUES
  ('Emergência'),
  ('Clinica Médica'),
  ('Triagem'),
  ('Cirurgia'),
  ('Radiologia');

INSERT INTO ESPECIALIDADE
  (nome)
VALUES
  ('Enfermeiro Geral'),
  ('Cardiologia'),
  ('Pediatria'),
  ('Ortopedia'),
  ('Radiologista');

INSERT INTO alocado
  (matriculaFuncional, idSetor, entrada, saida)
VALUES
  (1, 1, '2017-07-12 16:38:19', '2017-08-12 05:00:20'),
  (2, 3, '2017-06-09 13:31:04', '2017-07-09 02:10:34'),
  (3, 4, '2017-02-28 12:50:39', '2017-03-28 01:07:56'),
  (4, 2, '2017-10-24 21:26:19', '2017-11-24 10:15:19'),
  (5, 2, '2017-07-14 08:00:00', '2017-07-14 20:07:46');

INSERT INTO possui
  (matriculaFuncional, idEspecialidade)
VALUES
  (1, 2),
	(2, 2),
	(1, 3),
	(3, 1),
  (4, 5);
