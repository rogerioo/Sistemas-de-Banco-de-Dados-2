-- -------------------------------------------   << Escala de Plantonistas >>   --------------------------------------------
--
--                                                 SCRIPT DE CONTROLE (DDL)                                                 
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

CREATE USER 'administrador'@'localhost' IDENTIFIED BY '12345678';

GRANT ALL PRIVILEGES ON aula3exer1Evolucao2.* TO 'administrador'@'localhost';


CREATE USER 'usuario'@'localhost' IDENTIFIED BY '12345678';

GRANT SELECT ON aula3exer1Evolucao2.* TO 'usuario'@'localhost';


CREATE USER 'gestor'@'localhost' IDENTIFIED BY '12345678';

GRANT SELECT ON aula3exer1Evolucao2.* TO 'gestor'@'localhost';

GRANT SELECT ON aula3exer1Evolucao2.* TO 'gestor'@'localhost';

GRANT INSERT, UPDATE ON aula3exer1Evolucao2.PLANTONISTA TO 'gestor'@'localhost';

GRANT INSERT, UPDATE ON aula3exer1Evolucao2.SETOR TO 'gestor'@'localhost';


FLUSH PRIVILEGES;
