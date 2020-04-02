-- ------------------------------------------   << Empresa de Vendas (V4)  >>   ------------------------------------------
--
--                                                SCRIPT DE CONSULTA (DML)
-- 
-- Data Criacao ...........: 11/03/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula1exer2Evolucao4
-- 
-- Data Ultima Alteracao ..: 18/03/2020
--   => Remoção do DROP TABLE da tabela inserido
--   => Remoção do DROP TABLE da tabela supervisiona
-- 
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- ------------------------------------------------------------------------------------------------------------------------

USE aula1exer2Evolucao4;

-- A) Consultar todas as vendas feitas por um empregado específico que será definido pelo usuário através da chave
--    primária do empregado nessa pesquisa;

SELECT data from VENDA 
  WHERE matriculaEmpregado = 1 
ORDER BY data DESC;

-- B) Relacionar todos os dados de uma venda específica com todas as informações dos produtos comercializados por
--    esta venda (usuário definirá uma venda específica);

SELECT P.nome as 'produto', C.quantidade, P.precoUnitario, (P.precoUnitario * C.quantidade) as totalProduto,
       SUM(P.precoUnitario * C.quantidade) OVER (ORDER BY P.nome DESC) as totalParcialCompra
  FROM VENDA AS V
    INNER JOIN contem AS C
      ON V.idVenda = C.idVenda
    INNER JOIN PRODUTO AS P
      ON P.idProduto = C.idProduto
  WHERE V.data = '2020-03-10 10:01:20'
ORDER BY P.nome DESC;

-- C) Mostrar todos os empregados da empresa que não sejam gerentes em ordem alfabética crescente;

SELECT P.nome, P.cpf
  FROM PESSOA AS P
    INNER JOIN EMPREGADO AS E
      ON E.cpf = P.cpf
    LEFT JOIN GERENTE AS G
      ON G.cpfGerente = P.cpf
  WHERE G.cpfGerente IS NULL
ORDER BY P.nome; 

-- D) Consultar e mostrar a quantidade de CADA produto que foi vendido por esta empresa (lembrar que só código
--    do produto não identifica qual produto é para funcionários da empresa).

SELECT P.nome, SUM(C.quantidade) as quantidade
  FROM PRODUTO AS P
    INNER JOIN contem AS C
      ON P.idProduto = C.idProduto
GROUP BY P.nome
ORDER BY P.nome;
