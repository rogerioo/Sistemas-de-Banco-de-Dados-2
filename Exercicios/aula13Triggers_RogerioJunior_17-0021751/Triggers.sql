-- -----------------------------------  << Programação do SGBD (TRIGGERS) >>  -----------------------------------
--
--                                           SCRIPT DE TRIGGERS (DDL)                                           
--
-- Data Criacao ...........: 18/11/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0.22
-- Base de Dados (nome) ...: aula13Triggers
--
-- Alteracoes no Script:
--   18/10/2020 - cria triggers
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 Triggers
--
-- --------------------------------------------------------------------------------------------------------------

DELIMITER $$

CREATE TRIGGER SET_CLIENTE_NULL BEFORE INSERT ON tbl_cliente
  FOR EACH ROW
BEGIN
  SET @name = NEW.cliente_nome;

  IF ( (CHAR_LENGTH(@name)) <= 4 OR (@name = '') )
    THEN
      SET NEW.cliente_nome = NULL;
  END IF;
END$$

CREATE TRIGGER CHECK_COMPRA_INTEGRITY BEFORE INSERT ON tbl_compra
  FOR EACH ROW
BEGIN
  SELECT COUNT(cliente_id) INTO @client_id FROM tbl_cliente
    WHERE cliente_id = NEW.cliente_id;

  SELECT COUNT(produto_id) INTO @product_id FROM tbl_produto
    WHERE produto_id = NEW.produto_id;

  IF( (@client_id = 0) OR (@product_id = 0) ) THEN
    SET NEW.cliente_id = NULL;
    SET NEW.produto_id = NULL;
  END IF;
END$$

CREATE TRIGGER SET_USER_NEWSLETTER BEFORE INSERT ON tbl_cliente
  FOR EACH ROW
BEGIN
  IF ( NEW.cliente_email IS NOT NULL )
    THEN
      INSERT INTO tbl_newsletter SET news_email = NEW.cliente_email;
  END IF;
END$$

DELIMITER ;