-- -------------------------------------------   << Aula 04 - Extra >>   --------------------------------------------
--
--                                                 SCRIPT DE CRIAÇÃO (DDL)                                                 
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

CREATE DATABASE IF NOT EXISTS aula4extra1
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
USE aula4extra1;

CREATE TABLE ESTADO (
    sigla CHAR(2) NOT NULL,
    nome VARCHAR(20) NOT NULL,

    CONSTRAINT ESTADO_PK PRIMARY KEY (sigla)
) ENGINE = InnoDB;

CREATE TABLE CIDADE (
    codigo INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sigla CHAR(2) NOT NULL,
    habitantes INT NOT NULL,

    CONSTRAINT CIDADE_UK UNIQUE (nome, sigla),

    CONSTRAINT CIDADE_ESTADO_FK FOREIGN KEY (sigla)
        REFERENCES ESTADO (sigla)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1;
