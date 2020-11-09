-- --------------------------------------  << Otimização de Consultas >>  --------------------------------------
--
--                                       SCRIPT DE OTIMIZAÇÃO (DML E DDL)                                       
--
-- Data Criacao ...........: 09/11/2020
-- Autor(es) ..............: Rogério S. dos Santos Júnior
-- Banco de Dados .........: MySQL 8.0.22
-- Base de Dados (nome) ...: marketplace
--
--
-- PROJETO => 01 Base de Dados
--            06 Tabelas
--            06 Consultas
--
-- --------------------------------------------------------------------------------------------------------------

USE marketplace;

--  ================================================  CONSULTA 1 ================================================

-- A criação do Index se mostrou muito eficaz, uma vez que o campo date é acessado repetidas vezes e o Index
-- permite o acesso mais eficiente dos registros.
-- A remoção da função YEAR melhora o desempenho da consulta também, uma vez que ela é chamada todas as vezes que
-- a consulta é realizada

-- Preliminar
-- Taxa de transferência = 5.89 t/s
--  Latência = 2667.49 ms

CREATE INDEX sale_date_idx on sale(`date`);

SELECT SQL_NO_CACHE COUNT(*) AS `Número de compras em 2015` FROM sale
  WHERE date BETWEEN '2015-01-01' AND '2015-12-31';

-- Posterior
-- Taxa de transferência = 12.52 t/s (+ 112.70%)
--  Latência = 1253.35 ms (- 53.01%)

-- =============================================================================================================


--  ================================================  CONSULTA 2 ================================================

-- Aparentemente, o operador BETWEEEN funciona melhor com o tipo FLOAT (que é o tipo apropriado do atributo) do 
-- que o VARCHAR(50)

-- Preliminar
-- Taxa de transferência = 76.38 t/s
--  Latência = 208.76 ms

ALTER TABLE product MODIFY price FLOAT(6,2) NOT NULL;

SELECT SQL_NO_CACHE COUNT(*) AS `Quantidade` FROM product
  WHERE price BETWEEN 0 AND 1000 AND stock <= 100;

-- Posterior
-- Taxa de transferência = 104.82 t/s (+ 37.23%)
--  Latência = 152.13 ms (- 27.13%)

-- =============================================================================================================


--  ================================================  CONSULTA 3 ================================================

-- A criação do Index se mostrou muito eficaz, uma vez que o campo name é acessado repetidas vezes e o Index
-- permite o acesso mais eficiente dos registros.

-- Preliminar
-- Taxa de transferência = 23215.39 t/s
--  Latência = 0.69 ms

CREATE INDEX category_name_idx on category(`name`);

SELECT SQL_NO_CACHE name AS `Nome da categoria` FROM category LIMIT 10;

-- Posterior
-- Taxa de transferência = 24190.13 t/s (+ 4.2%)
--  Latência = 0.66 ms (- 4.35%)

-- =============================================================================================================


--  ================================================  CONSULTA 4 ================================================

-- A criação do Index se mostrou muito eficaz, uma vez que o campo date é acessado repetidas vezes e o Index
-- permite o acesso mais eficiente dos registros.

-- Preliminar
-- Taxa de transferência = 3.89 t/s
--  Latência = 4061.28 ms

CREATE INDEX sale_date_idx on sale(`date`);

SELECT SQL_NO_CACHE * FROM sale s
INNER JOIN customer c
  ON s.customerId = c.customerId
  WHERE date > CURDATE() - INTERVAL 1 YEAR;

-- Posterior
-- Taxa de transferência = 15.61 t/s (+ 301.30%)
--  Latência = 991.83 ms (- 75.60%)

-- =============================================================================================================


--  ================================================  CONSULTA 5 ================================================

-- Aparentemente, o operado IN funciona ligeramente mais rápido que o '='

-- Preliminar
-- Taxa de transferência = 36200.92 t/s
--  Latência = 0.44 ms

SELECT SQL_NO_CACHE * FROM user
  WHERE userId IN (11100);

-- Posterior
-- Taxa de transferência = 40655.05 t/s (+ 12.31%)
--  Latência = 0.39 ms (- 11.40%)

--  ================================================  CONSULTA 6 ================================================

-- Ao meu ver, não existe otimização para essa consulta pois ela já está eficiente.

-- Preliminar
-- Taxa de transferência = 737.92 t/s
--  Latência = 21.63 ms

SELECT SQL_NO_CACHE * FROM store;

-- =============================================================================================================