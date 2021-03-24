-- --------       << SBD2 PR 2020-2 >>       ------------ --
--
--                    SCRIPT DE APAGA (DDL)
--
-- Data Criacao ..........: 03/11/2020
-- Autor(es) .............: Vandor Rissoli
-- Banco de Dados ........: MySQL
-- Base de Dados(nome) ...: bdInstituicao
--
-- Data Ultima Alteracao ..: 15/12/2020
--    + Ajustes nos scripts
--
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
--
-- ----------------------------------------------------------------- --

-- Acessando a Base de Dados do Projeto
USE bdInstituicao;


-- Populando as tabelas
INSERT INTO CIDADAO VALUES
 (02954492171, 'Rui Moreira',      '1993-02-19'),
 (02954492175, 'Carlos Moreira',   '1993-02-19'),
 (02954492172, 'Mauro Nascimento', '1989-02-19'),
 (02954492173, 'Carla Araujo',     '1989-02-20'),
 (02954492176, 'Ana Maria Braga',  '1948-10-10');

INSERT INTO  ALUNO VALUES
 (1512345,02954492175,123),
 (1754321,02954492172,124),
 (1812121,02954492175,124);

INSERT INTO INSTITUICAO VALUES
 (47512454000198, 'CEM 311', 'quadra 4',  'DF','Gama',        71090, 'setor norte'),
 (51245313001209, 'CEMI210', 'setor O',   'DF','Ceilandia',   72900, 'setor leste'),
 (12345678000123, 'CEM 001', 'quadra 412','DF','Plano Piloto',71939, NULL);

INSERT INTO DOCENTE VALUES
 (123, 02954492172),
 (124, 02954492171),
 (130, 02954492176);

INSERT INTO CURSO_FORMACAO VALUES
 (1,'Informatica',        'P'),
 (2,'Culinaria',          'X'),
 (3,'Processamento Dados','G'),
 (4,'Fisioterapia',       'G');

INSERT INTO CURSO_SUPERIOR VALUES
 (1,'Designe Web'),
 (2,'Hotelaria'),
 (3,'Tecnico em enfermagem');

INSERT INTO  email VALUES
 ('guguta@gmail.com',  1512345),
 ('ruika@gmail.com',   1754321),
 ('guguta@hotmail.com',1512345),
 ('fluir@gmail.com',   1812121);

INSERT INTO  ingressa VALUES
 (1512345,47512454000198,'2015-02-02'),
 (1754321,51245313001209,'2017-02-01'),
 (1812121,51245313001209,'2018-02-02');

INSERT INTO  formado VALUES
 (1,123),
 (2,124),
 (3,123),
 (1,130);

INSERT INTO  oferece VALUES
 (47512454000198,1),
 (47512454000198,2),
 (51245313001209,1),
 (51245313001209,3);
