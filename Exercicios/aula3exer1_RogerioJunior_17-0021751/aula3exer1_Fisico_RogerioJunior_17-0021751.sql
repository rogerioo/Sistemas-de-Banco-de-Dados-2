-- -------------------------------------------   << Escala de Plantonistas >>   --------------------------------------------
--
--                                                 SCRIPT DE CRIAÇÃO (DDL)                                                 
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

CREATE DATABASE IF NOT EXISTS aula3exer1
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
USE aula3exer1;

CREATE TABLE SETOR (
    idSetor INT(4) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL,

    CONSTRAINT SETOR_PK PRIMARY KEY (idSetor)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE PLANTONISTA (
    matriculaFuncional INT(4) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    sexo ENUM('F','M') NOT NULL,

    CONSTRAINT PLANTONISTA_PK PRIMARY KEY (matriculaFuncional)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE ESPECIALIDADE (
    idEspecialidade INT(4) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(80) NOT NULL,

    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY (idEspecialidade)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE alocado (
    idSetor INT(4) NOT NULL,
    matriculaFuncional INT(4) NOT NULL,
    saida DATETIME NOT NULL,
    entrada DATETIME NOT NULL,

    CONSTRAINT alocado_UK UNIQUE (matriculaFuncional, saida, entrada),

    CONSTRAINT alocado_AREA_FK FOREIGN KEY (idSetor)
        REFERENCES SETOR (idSetor),
    CONSTRAINT alocado_PLANTONISTA_FK FOREIGN KEY (matriculaFuncional)
        REFERENCES PLANTONISTA (matriculaFuncional)
) ENGINE = InnoDB;

CREATE TABLE possui (
    matriculaFuncional INT(4) NOT NULL,
    idEspecialidade INT(4) NOT NULL,

    CONSTRAINT possui_PLANTONISTA_FK FOREIGN KEY (matriculaFuncional)
        REFERENCES PLANTONISTA (matriculaFuncional),
    CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade)
        REFERENCES ESPECIALIDADE (idEspecialidade)
) ENGINE = InnoDB;
