-- ------------------------------------------   << Empresa de Vendas (V4)  >>   ------------------------------------------
--
--                                                SCRIPT DE POPULAR (DML)
-- 
-- Data Criacao ...........: 11/03/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula1exer2Evolucao4
-- 
-- Data Ultima Alteracao ..: 18/03/2020
--   => Adição do campo idArea ao INSERT da tabela PRODUTO
--   => Remoção do INSERT da tabela supervisiona
--   => Remoção do INSERT da tabela inserido
--   => Modificação dos dados de acordo com o popula do Ivan
-- 
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- ------------------------------------------------------------------------------------------------------------------------

USE aula1exer2Evolucao4;

INSERT INTO PESSOA
  (cpf, nome, senha)
VALUES
  (12345678910,'Jorge Almeida da Silva','silva1234'),
  (10987654321,'Gustavo Andrade dos Reis','abelhaG'),
  (12340987652,'Andre Bastio','jesus'),
  (10101054221,'Ivan Augusto Souza','naveEspacial'),
  (55678919281,'Wellison dos Santos','wewewe456'),
  (68993893918,'Lieverton Pereira Batista','A123buias_c'),
  (11321231234,'Pedro Alencar Ritfo','yaka123'),
  (56123841723,'Afonso Padilla','palla2710');

INSERT INTO GERENTE
  (formacao, email, cpfGerente)
VALUES
  ('Ensino Superior Incompleto', 'jorge@gmail.com', 12345678910),
  ('Ensino Médio', 'andre@gmail.com', 10987654321),
  ('Mestrado', 'gustavo@gmail.com', 12340987652),
  ('Ensino Superior', 'pedro@gmail.com', 11321231234);

INSERT INTO EMPREGADO
  (rua, numero, bairro, cidade, estado, cep, cpf)
VALUES
  ('Quadra 07 Conjunto Y', 118, 'Setor Norte', 'Gama', 'DF', 7243567, 10101054221),
  ('Avenida da Palmeiras', 1206, 'Rua Norte', 'Águas Claras', 'DF', 7265891, 55678919281),
  ('Rua 10', 18, 'Norte', 'Valparaíso de Goiás', 'DF', 7267811, 68993893918),
  ('Rua das Laranjeiras', 123, 'Rua Sul', 'Patos de Minas', 'MG', 2876532, 56123841723);

INSERT INTO telefone
  (matriculaEmpregado, telefone)
VALUES
  (1, 21999765123),
  (2, 21987654971),
  (3, 61985587681),
  (4, 61987674563);

INSERT INTO AREA
  (nome, cpfGerente)
VALUES
  ('Papelaria', 12345678910),
  ('Vestuário', 10987654321),
  ('Carpentaria', 12340987652),
  ('Imóvel', 11321231234);

INSERT INTO VENDA
  (data, matriculaEmpregado)
VALUES
  ('2020-02-10 18:02:20', 1),
  ('2020-03-10 10:01:20', 2),
  ('2020-01-02 14:52:10', 3),
  ('2020-01-13 15:27:10', 1);

INSERT INTO PRODUTO
  (nome, idArea, precoUnitario)
VALUES
  ('Borracha', 1, 1.00),
  ('Caneta', 1, 2.00),
  ('Camisa', 2, 40.00),
  ('Armário', 3, 200.00),
  ('Container', 4, 2000.25);


INSERT INTO contem
  (idVenda, idProduto, quantidade)
VALUES
  (1, 1, 3),
  (4, 1, 10),
  (1, 2, 4),
  (2, 2, 10),
  (2, 3, 2),
  (3, 4, 1),
  (3, 5, 1);
