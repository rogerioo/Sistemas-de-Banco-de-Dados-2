-- ------------------------------   << US Elections 2020 - Joe Bidden (Trabalho Final)  >>   ------------------------------
--
--                                                SCRIPT DE APAGAR (DDL)                                                
-- 
-- Data Criação ...........: 07/12/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior e Ivan Diniz Dobbin
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: us_election_2020
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--         => 02 Visões
--         => 02 Usuários
--         => 02 Index
-- 
-- ------------------------------------------------------------------------------------------------------------------------

USE us_election_2020;


DROP INDEX FACT_TWEET_LIKES_IDX ON FACT_TWEET;
DROP INDEX FACT_TWEET_RETWEET_COUNT_IDX ON FACT_TWEET;

DROP TABLE IF EXISTS FACT_TWEET;
DROP TABLE IF EXISTS SOURCE_DIMENSION;
DROP TABLE IF EXISTS USER_DIMENSION;
DROP TABLE IF EXISTS LOCATION_DIMENSION;
DROP TABLE IF EXISTS STATE_DIMENSION;

DROP VIEW IF EXISTS TWEETS_BY_STATE;
DROP VIEW IF EXISTS USERS_ANALYTICS;

DROP USER IF EXISTS 'admin'@'localhost';
DROP USER IF EXISTS 'user'@'localhost';
