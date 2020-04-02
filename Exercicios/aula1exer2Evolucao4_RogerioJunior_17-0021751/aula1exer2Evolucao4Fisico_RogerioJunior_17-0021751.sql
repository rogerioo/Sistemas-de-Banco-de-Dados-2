-- ------------------------------------------   << Empresa de Vendas (V4)  >>   ------------------------------------------
--
--                                                SCRIPT DE CRIAÇÃO (DDL)                                                
-- 
-- Data Criação ...........: 11/03/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula1exer2Evolucao4
-- 
-- Data Ultima Alteração ..: 18/03/2020
--   => Adição do chave estrangeira idArea a tabela PRODUTO 
--   => Remoção da tabela inserido
--   => Remoção da tabela supervisiona
--   => Remoção do campo idGerente da tabela Gerente
--   => Adição de chave primária a chave cpf de Gerente
-- 
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- ------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2Evolucao4
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
USE aula1exer2Evolucao4;

CREATE TABLE PESSOA (
    cpf BIGINT(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(50) NOT NULL,

    CONSTRAINT PESSOA_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;

CREATE TABLE GERENTE (
    cpfGerente BIGINT(11) NOT NULL,
    formacao VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,

    CONSTRAINT GERENTE_PK PRIMARY KEY (cpfGerente),

    CONSTRAINT GERENTE_PESSOA_FK FOREIGN KEY (cpfGerente)
        REFERENCES PESSOA (cpf)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE EMPREGADO (
    matriculaEmpregado INT(4) AUTO_INCREMENT NOT NULL,
    rua VARCHAR(20) NOT NULL,
    numero INT(5) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    complemento VARCHAR(50),
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep INT(7) NOT NULL,
    cpf BIGINT(11) NOT NULL,

    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matriculaEmpregado),

    CONSTRAINT EMPREGADO_PESSOA_FK FOREIGN KEY (cpf)
        REFERENCES PESSOA (cpf)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE VENDA (
    idVenda INT(4) AUTO_INCREMENT NOT NULL,
    data DATETIME NOT NULL,
    matriculaEmpregado INT(4) NOT NULL,

    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
    
    CONSTRAINT VENDA_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado)
        REFERENCES EMPREGADO (matriculaEmpregado)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE AREA (
    idArea INT(4) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    cpfGerente BIGINT(11) NOT NULL,

    CONSTRAINT AREA_PK PRIMARY KEY (idArea),

    CONSTRAINT AREA_GERENTE_FK FOREIGN KEY (cpfGerente)
        REFERENCES GERENTE (cpfGerente)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE PRODUTO (
    idProduto INT(4) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    precoUnitario FLOAT(7,2) NOT NULL,
    idArea INT(4) NOT NULL,

    CONSTRAINT PRODUTO_PK PRIMARY KEY (idProduto),

    CONSTRAINT PRODUTO_AREA_FK FOREIGN KEY (idArea)
        REFERENCES AREA (idArea)
) ENGINE = InnoDB  AUTO_INCREMENT = 1;

CREATE TABLE telefone (
    matriculaEmpregado INT(4) NOT NULL,
    telefone BIGINT(12) NOT NULL,

    CONSTRAINT telefone_UK UNIQUE (matriculaEmpregado, telefone),

    CONSTRAINT telefone_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado)
        REFERENCES EMPREGADO(matriculaEmpregado)
) ENGINE = InnoDB;

CREATE TABLE contem (
    idVenda INT(4) NOT NULL,
    idProduto INT(4) NOT NULL,
    quantidade INT(3) NOT NULL,

    CONSTRAINT contem_VENDA_FK FOREIGN KEY (idVenda)
        REFERENCES VENDA (idVenda),
    CONSTRAINT contem_PRODUTO_FK FOREIGN KEY (idProduto)
        REFERENCES PRODUTO (idProduto)
) ENGINE = InnoDB;
