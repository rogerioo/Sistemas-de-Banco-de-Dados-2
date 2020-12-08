-- ------------------------------   << US Elections 2020 - Joe Bidden (Trabalho Final)  >>   ------------------------------
--
--                                                SCRIPT DE CONTROLE (DDL)                                                
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

CREATE USER 'admin'@'localhost' IDENTIFIED BY '@dmin2020';
GRANT ALL PRIVILEGES ON  us_election_2020.* TO 'admin'@'localhost';

CREATE USER 'user'@'localhost' IDENTIFIED BY 'uso2020';
GRANT SELECT ON  us_election_2020.* TO 'user'@'localhost';

FLUSH PRIVILEGES;