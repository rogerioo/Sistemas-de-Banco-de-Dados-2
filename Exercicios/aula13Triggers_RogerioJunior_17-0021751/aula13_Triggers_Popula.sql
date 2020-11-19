-- -----------------------------------  << Programação do SGBD (TRIGGERS) >>  -----------------------------------
--
--                                              SCRIPT POPULA (DML)                                              
--
-- Data Criacao ...........: 18/11/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0.22
-- Base de Dados (nome) ...: aula13Triggers
--
-- Alteracoes no Script
--   06/06/2020 - ajustes na organizacao do script
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 Triggers (serao implementadas por VOCE)
--
-- --------------------------------------------------------------------------------------------------------------

-- BASE DE DADOS
USE aula13Triggers;


-- INSERINDO NAS TABELAS
INSERT INTO `tbl_cliente` VALUES
 (null,'Carlos Veloso',  'cveloso@bol.com.br',  '2019-12-06 09:01:59'),
 (null,'Ana Maria Braga','anabraga@gmail.com ', '2020-05-25 10:59:25'),
 (null,'Messias Bolson', 'mbolson@hotmail.com', '2020-01-02 08:00:00');



INSERT INTO `tbl_produto` VALUES
 (null,'sabonete'),
 (null,'biscoitos'),
 (null,'laranja'),
 (null,'leite'),
 (null,'creme de leite'),
 (null,'chocolate'),
 (null,'pasta de dente'),
 (null,'guarda-chuva');



INSERT INTO `tbl_compra` VALUES
 ('2019-12-06 09:02:00', 1, 5),
 ('2019-12-06 09:02:00', 1, 2),
 ('2020-05-26 11:22:45', 2, 1),
 ('2020-01-02 09:00:00', 3, 2),
 ('2020-01-02 09:00:00', 3, 4),
 ('2020-01-05 12:01:02', 1, 8),
 ('2020-01-05 12:01:01', 3, 1);



INSERT INTO `tbl_newsletter` VALUES
 (null,'cveloso@bol.com.br'),
 (null,'anabraga@gmail.com '),
 (null,'mbolson@hotmail.com'),
 (null,'teacher@hotmail.com.br'),
 (null,'clarencio@gmail.com');
