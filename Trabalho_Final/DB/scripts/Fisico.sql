-- ------------------------------   << US Elections 2020 - Joe Bidden (Trabalho Final)  >>   ------------------------------
--
--                                                SCRIPT DE CRIAÇÃO (DDL)                                                
-- 
-- Data Criação ...........: 15/11/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: us_election_2020
-- 
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
-- 
-- ------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS us_election_2020
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci;
USE us_election_2020;

CREATE TABLE STATE (
  state_code CHAR(5) NOT NULL,
  state_name VARCHAR(255) NOT NULL,

  CONSTRAINT STATE_PK PRIMARY KEY (state_code, state_name)
) ENGINE = InnoDB;

CREATE TABLE LOCATION (
  latitude DOUBLE NOT NULL,
  longitude DOUBLE NOT NULL,
  city TINYTEXT NOT NULL,
  country TINYTEXT NOT NULL,
  continent VARCHAR(200) NOT NULL,
  state_code CHAR(5) NOT NULL,
  state_name VARCHAR(255) NOT NULL,

  CONSTRAINT LOCATION_PK PRIMARY KEY (latitude, longitude),

  CONSTRAINT LOCATION_STATE_FK FOREIGN KEY (state_code, state_name)
    REFERENCES STATE (state_code, state_name)
) ENGINE = InnoDB;

CREATE TABLE USER (
  user_id BIGINT NOT NULL,
  name VARCHAR(200) NOT NULL,
  screen_name VARCHAR(200) NOT NULL,
  description VARCHAR(300) NOT NULL,
  followers_count INT NOT NULL,
  location TINYTEXT NOT NULL,

  CONSTRAINT USER_PK PRIMARY KEY (user_id)
) ENGINE = InnoDB;

CREATE TABLE SOURCE (
  source_id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(100) NOT NULL,

  CONSTRAINT SOURCE_PK PRIMARY KEY (source_id)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE TWEET (
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

  CONSTRAINT TWEET_PK PRIMARY KEY (tweet_id),

  CONSTRAINT TWEET_USER_FK FOREIGN KEY (user_id)
    REFERENCES USER (user_id),
  CONSTRAINT TWEET_SOURCE_FK FOREIGN KEY (source_id)
    REFERENCES SOURCE (source_id),
  CONSTRAINT TWEET_LOCATION_FK FOREIGN KEY (latitude, longitude)
    REFERENCES LOCATION (latitude, longitude)
) ENGINE = InnoDB;