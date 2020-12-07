-- ------------------------------   << US Elections 2020 - Joe Bidden (Trabalho Final)  >>   ------------------------------
--
--                                                SCRIPT DE CRIAÇÃO (DDL)                                                
-- 
-- Data Criação ...........: 15/11/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior e Ivan Diniz Dobbin
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: us_election_2020
-- 
-- Últimas alterações:
--  04/12/2020  => Altera nome das tabelas para incluir dimension e fact.
--              => Altera o nome das constraints de acordo com os novos nomes das tabelas
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
-- 
-- ------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS us_election_2020
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci;
USE us_election_2020;

CREATE TABLE STATE_DIMENSION (
  state_code CHAR(5) NOT NULL,
  state_name VARCHAR(255) NOT NULL,

  CONSTRAINT STATE_DIMENSION_PK PRIMARY KEY (state_code, state_name)
) ENGINE = InnoDB;

CREATE TABLE LOCATION_DIMENSION (
  latitude DOUBLE NOT NULL,
  longitude DOUBLE NOT NULL,
  city TINYTEXT NOT NULL,
  country TINYTEXT NOT NULL,
  continent VARCHAR(200) NOT NULL,
  state_code CHAR(5) NOT NULL,
  state_name VARCHAR(255) NOT NULL,

  CONSTRAINT LOCATION_DIMENSION_PK PRIMARY KEY (latitude, longitude),

  CONSTRAINT LOCATION_DIMENSION_STATE_DIMENSION_FK FOREIGN KEY (state_code, state_name)
    REFERENCES STATE_DIMENSION (state_code, state_name)
) ENGINE = InnoDB;

CREATE TABLE USER_DIMENSION (
  user_id BIGINT NOT NULL,
  name VARCHAR(200) NOT NULL,
  screen_name VARCHAR(200) NOT NULL,
  description VARCHAR(300) NOT NULL,
  followers_count INT NOT NULL,
  location TINYTEXT NOT NULL,

  CONSTRAINT USER_DIMENSION_PK PRIMARY KEY (user_id)
) ENGINE = InnoDB;

CREATE TABLE SOURCE_DIMENSION (
  source_id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(100) NOT NULL,

  CONSTRAINT SOURCE_DIMENSION_PK PRIMARY KEY (source_id)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE FACT_TWEET (
  tweet_id BIGINT NOT NULL,
  created_at DATETIME,
  message VARCHAR(1000) NOT NULL,
  likes INT NOT NULL,
  retweet_count INT NOT NULL,
  source_id INT NOT NULL,
  user_id BIGINT NOT NULL,
  latitude DOUBLE NOT NULL,
  longitude DOUBLE NOT NULL,
  collected_at DATETIME,

  CONSTRAINT FACT_TWEET_PK PRIMARY KEY (tweet_id),

  CONSTRAINT FACT_TWEET_USER_DIMENSION_FK FOREIGN KEY (user_id)
    REFERENCES USER_DIMENSION (user_id),
  CONSTRAINT FACT_TWEET_SOURCE_DIMENSION_FK FOREIGN KEY (source_id)
    REFERENCES SOURCE_DIMENSION (source_id),
  CONSTRAINT FACT_TWEET_LOCATION_DIMENSION_FK FOREIGN KEY (latitude, longitude)
    REFERENCES LOCATION_DIMENSION (latitude, longitude)
) ENGINE = InnoDB;