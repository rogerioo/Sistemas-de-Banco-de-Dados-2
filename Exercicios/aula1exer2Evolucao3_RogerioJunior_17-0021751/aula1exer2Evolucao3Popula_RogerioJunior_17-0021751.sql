-- -------------------   << Empresa de Vendas (V3)  >>   -------------------
--
--                    SCRIPT DE POPULAR (DML)
-- 
-- Data Criacao ...........: 11/03/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula1exer2Evolucao3
-- 
-- Data Ultima Alteracao ..: 18/03/2020
--   => Adição do campo idArea ao INSERT da tabela PRODUTO
--   => Remoção do INSERT da tabela supervisiona
--   => Remoção do INSERT da tabela inserido
-- 
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- -------------------------------------------------------------------------

USE aula1exer2Evolucao3;

INSERT INTO PESSOA
  (cpf, nome, senha)
VALUES
  (12345678911, 'Rogério Júnior', '12345'),
  (12345678922, 'Fabiana Ribas', '67890'),
  (12345678933, 'Youssef Muhamad', 'amor123'),
  (12345678944, 'Lucas Dutra', '78965'),
  (12345678955, 'Pedro Féo', 'react432'),
  (12345678966, 'Glenda Soares', 'marley21');

INSERT INTO GERENTE
  (formacao, email, cpf)
VALUES
  ('Ensino Superior Incompleto', 'rjunior@email.com', 12345678911),
  ('Ensino Médio', 'fabis@email.com', 12345678922),
  ('Mestrado', 'ymuhamad@email.com', 12345678933);

INSERT INTO EMPREGADO
  (rua, numero, bairro, cidade, estado, cep, cpf)
VALUES
  ('Quadra 07 Conjunto Y', 118, 'Setor Norte', 'Gama', 'DF', 7243567, 12345678944),
  ('Avenida da Palmeiras', 1206, 'Rua Norte', 'Águas Claras', 'DF', 7265891, 12345678955),
  ('Rua 10', 18, 'Norte', 'Valparaíso de Goiás', 'DF', 7267811, 12345678966);

INSERT INTO telefone
  (matriculaEmpregado, telefone)
VALUES
  (1, 61987653900),
  (2, 61992873460),
  (3, 61996542286);

INSERT INTO AREA
  (nome, idGerente)
VALUES
  ('Eletrônicos', 1),
  ('Cama, mesa e banho', 2),
  ('Livros', 3);

INSERT INTO VENDA
  (`data`, matriculaEmpregado)
VALUES
  ('2019-12-30 11:34:09', 1),
  ('2020-01-08 16:22:56', 2),
  ('2020-03-02 14:41:22', 3);

INSERT INTO PRODUTO
  (nome, precoUnitario, idArea)
VALUES
  ('Galaxy S10', 3200.99, 1),
  ('Lençol Solteirão - Branco', 61.75, 2),
  ('O Herói Perdido', 39.99, 3);

INSERT INTO contem
  (idVenda, idProduto, quantidade)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3);
