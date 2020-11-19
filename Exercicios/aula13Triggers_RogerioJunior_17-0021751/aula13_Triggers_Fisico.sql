-- -----------------------------------  << Programação do SGBD (TRIGGERS) >>  -----------------------------------
--
--                                            SCRIPT DE CRIAÇÃO (DDL)                                            
--
-- Data Criacao ...........: 18/11/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0.22
-- Base de Dados (nome) ...: aula13Triggers
--
-- Alteracoes no Script
--   06/06/2020 - ajustes na organizacao do script
--   18/11/2020 - mudança de cliente_id e produto_id de DEFAULT NULL PARA NOT NULL na tabela tbl_compra
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 Triggers
--
-- --------------------------------------------------------------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
 IF NOT EXISTS aula13Triggers;

USE aula13Triggers;


-- TABELAS
CREATE TABLE `tbl_cliente` (
   `cliente_id`    INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `cliente_nome`  VARCHAR(80)      NOT NULL,
   `cliente_email` VARCHAR(80)      NOT NULL,
   `dt_cadastro`   TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT tbl_cliente_PK PRIMARY KEY (cliente_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



CREATE TABLE `tbl_produto` (
   `produto_id`   INT(10)     UNSIGNED NOT NULL AUTO_INCREMENT,
   `produto_nome` VARCHAR(80)          NOT NULL,
  CONSTRAINT tbl_produto_PK PRIMARY KEY (`produto_id`)
) ENGINE=InnoDB  AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



CREATE TABLE `tbl_compra` (
   `dt_cadastro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `cliente_id`  INT(11) UNSIGNED NOT NULL,
   `produto_id`  INT(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE `tbl_newsletter` (
   `news_id`    INT(11)     NOT NULL AUTO_INCREMENT,
   `news_email` VARCHAR(80) NOT NULL,
  CONSTRAINT tbl_newsletter_PK PRIMARY KEY (`news_id`,`news_email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;









