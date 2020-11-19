-- -----------------------------------  << Programação do SGBD (TRIGGERS) >>  -----------------------------------
--
--                                              SCRIPT APAGA (DDL)                                              
--
-- Data Criacao ...........: 18/11/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0.22
-- Base de Dados (nome) ...: aula13Triggers
--
-- Alteracoes no Script
--   06/06/2020 - ajustes na organizacao do script
--   18/10/2020 - adiciona triggers
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 Triggers (serao implementadas por VOCE)
--
-- --------------------------------------------------------------------------------------------------------------

-- BASE DE DADOS
USE aula13Triggers;


-- TABELAS
DROP TABLE tbl_newsletter;
DROP TABLE tbl_compra;
DROP TABLE tbl_produto;
DROP TABLE tbl_cliente;


-- TRIGGERS

DROP TRIGGER IF EXISTS SET_CLIENTE_NULL;
DROP TRIGGER IF EXISTS SET_USER_NEWSLETTER;
DROP TRIGGER IF EXISTS CHECK_COMPRA_INTEGRITY;