-- --------            << SBD2 PR 2020-2 >>            ------------ --
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ..........: 03/11/2020
-- Autor(es) .............: Vandor Rissoli
-- Banco de Dados ........: MySQL
-- Base de Dados(nome) ...: RogerioJunior
--
-- Data Ultima Alteracao ..: 16/12/2020
--    + Ajustes nos scripts
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
--
-- ----------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS RogerioJunior;

USE RogerioJunior;

CREATE TABLE CIDADAO (
    cpf          VARCHAR(11)       NOT NULL,
    nomePessoa   VARCHAR(100) NOT NULL,
    dtNascimento DATE         NOT NULL,

    CONSTRAINT CIDADAO_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE INSTITUICAO (
    cnpj       VARCHAR(14)       NOT NULL,
    nomeIES    VARCHAR(100) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    estado     VARCHAR(2)   NOT NULL,
    cidade     VARCHAR(100) NOT NULL,
    cep        INT          NOT NULL,
    bairro     VARCHAR(100),

    CONSTRAINT INSTITUICAO_PK PRIMARY KEY(cnpj)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE DOCENTE (
    matriculaFuncional INT NOT NULL PRIMARY KEY,
    cpfCidadao                VARCHAR(11) NOT NULL,

  CONSTRAINT DOCENTE_CIDADAO_FK FOREIGN KEY (cpfCidadao)
    REFERENCES CIDADAO (cpf)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE ALUNO (
    cpfAluno               VARCHAR(11) NOT NULL,
    matriculaFuncional  INT NOT NULL,   -- Orientador
  
  CONSTRAINT ALUNO_PK PRIMARY KEY (cpfAluno),

  CONSTRAINT ALUNO_PESSOA_FK FOREIGN KEY (cpfAluno)
    REFERENCES CIDADAO (cpf)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT,
  CONSTRAINT ALUNO_DOCENTE_FK FOREIGN KEY (matriculaFuncional)
    REFERENCES DOCENTE (matriculaFuncional)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE CURSO_FORMACAO (
    idCurso       INT          NOT NULL AUTO_INCREMENT,
    nomeCurso     VARCHAR(100) NOT NULL,
    classificacao ENUM('G','E','P','X') NOT NULL,

    CONSTRAINT CURSO_FORMACAO PRIMARY KEY (idCurso)
)ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE CURSO_SUPERIOR (
    idFormacao   INT          NOT NULL AUTO_INCREMENT,
    nomeCurso VARCHAR(100) NOT NULL,

    CONSTRAINT CURSO_SUPERIOR_PK PRIMARY KEY (idFormacao)
)ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE email (
    email               VARCHAR(256) NOT NULL,
    cpfAluno varchar(11)          NOT NULL,

  CONSTRAINT email_ALUNO_FK FOREIGN KEY (cpfAluno)
    REFERENCES ALUNO (cpfAluno)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE MATRICULA (
    cpfAluno VARCHAR(11)    NOT NULL,
    CNPJ                 VARCHAR(14) NOT NULL,
    dtIngresso          DATE   NOT NULL,
    idMatricula INT NOT NULL AUTO_INCREMENT,

  CONSTRAINT MATRICULA_PK PRIMARY KEY (idMatricula),
  CONSTRAINT MATRICULA_ALUNO_FK FOREIGN KEY (cpfAluno)
    REFERENCES ALUNO (cpfAluno)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT,
  CONSTRAINT MATRICULA_ESCOLA_FK FOREIGN KEY (CNPJ)
    REFERENCES INSTITUICAO (CNPJ)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE formado (
    idCurso            INT NOT NULL,
    matriculaFuncional INT NOT NULL,
  CONSTRAINT formado_CURSO_FORMACAO_FK FOREIGN KEY (idCurso)
    REFERENCES CURSO_FORMACAO (idCurso)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT,
  CONSTRAINT formado_DOCENTE_FK FOREIGN KEY (matriculaFuncional)
    REFERENCES DOCENTE (matriculaFuncional)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE oferece (
    cnpj            VARCHAR(14) NOT NULL,
    idFormacao INT    NOT NULL,
  CONSTRAINT oferece_INSTITUICAO_FK FOREIGN KEY (cnpj)
    REFERENCES INSTITUICAO (cnpj)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT,
  CONSTRAINT oferece_CURSO_SUPERIOR_FK FOREIGN KEY (idFormacao)
    REFERENCES CURSO_SUPERIOR (idFormacao)
      ON DELETE RESTRICT
      ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE cursa (
    idMatricula INT,
    idFormacao INT,

    CONSTRAINT CURSA_MATRICULA_FK FOREIGN KEY (idMatricula)
      REFERENCES MATRICULA (idMatricula)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
    CONSTRAINT cursa_CURSO_SUPERIOR_FK FOREIGN KEY (idFormacao)
      REFERENCES CURSO_SUPERIOR (idFormacao)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);