-- ------------------------------   << US Elections 2020 - Joe Bidden (Trabalho Final)  >>   ------------------------------
--
--                                                SCRIPT DE CONSULTAS (DDL/DML)                                                
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

-- Visão para otimizar a busca por quantidades de tweet em cada estado
CREATE OR REPLACE VIEW TWEETS_BY_STATE 
  (state, city, quantity)
AS
  SELECT L.state_code, L.state_name, COUNT(*) as quantity
    FROM  FACT_TWEET T
    INNER JOIN LOCATION_DIMENSION L
      ON T.latitude = L.latitude AND T.longitude = L.longitude
    GROUP BY L.state_code, L.state_name
    ORDER BY quantity DESC;

-- Consulta para ver as 10 cidades com maior quantidade de tweets
SELECT * FROM TWEETS_BY_STATE LIMIT 10;

-- Visão para otimizar a recuperação de dados relacionadas as estatisticas do usuário
CREATE OR REPLACE VIEW USERS_ANALYTICS
  (id, username, followers, qtd_tweets, likes_avg, retweet_avg)
AS
  SELECT U.user_id, U.screen_name, U.followers_count, COUNT(T.tweet_id) AS qtd_tweets, AVG(T.likes) AS likes_avg, AVG(T.retweet_count) as retweet_avg
    FROM FACT_TWEET T
    INNER JOIN USER_DIMENSION U
      ON T.user_id = U.user_id
    GROUP BY T.user_id
    ORDER BY
      qtd_tweets DESC,
      likes_avg DESC;

-- Indexes para melhorar o desempenho de acesso à visão USERS_ANALYTICS
-- Aumenta em 10% as transações (t/s) e diminui em 10% a latência (m/s)
-- Transações: 3.67 (m/s) --> 4.01 (m/s)
-- Latência Média: 4282.82 (ms) --> 3962.58 (ms)
CREATE INDEX FACT_TWEET_LIKES_IDX ON FACT_TWEET (`likes`);
CREATE INDEX FACT_TWEET_RETWEET_COUNT_IDX ON FACT_TWEET (`retweet_count`);

-- Cosulta para ver os usuários que têm a média de likes entre 2000 e 3000
SELECT * FROM USERS_ANALYTICS WHERE likes_avg BETWEEN 2000 and 3000;

-- Consulta para ver os aparelhos mais usados para fazer os tweets
SELECT S.name, COUNT(*) AS quantity 
  FROM FACT_TWEET T
  INNER JOIN SOURCE_DIMENSION S
    ON T.source_id = S.source_id
GROUP BY S.name
ORDER BY quantity DESC
LIMIT 10;