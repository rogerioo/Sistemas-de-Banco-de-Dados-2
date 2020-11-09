-- ------------------------------------------------------
-- Projeto Pessoal - Banco MySQL
-- Base de Dados = agenda
--   01 = Base de Dados
--   04 = Tabelas
-- Atualizado: 26/10/2018 - organizou melhor o script
-- ------------------------------------------------------

--
-- Cria Base de Dados AGENDA
--
CREATE DATABASE IF NOT EXISTS agenda;


-- Cria Tabela PESSOA
--
CREATE TABLE `agenda`.`pessoa` (
  `idPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Popula PESSOA
--
INSERT INTO `agenda`.`pessoa` (`idPessoa`,`nome`,`dataNascimento`,`sexo`) VALUES
 (1,'Levino Andrade','1992-02-18','M'),
 (2,'Ana Maria Silva','1994-10-10','F'),
 (3,'Luis Carvalho','2010-01-08','M');



-- Cria Tabela ENDERECO
--
CREATE TABLE `agenda`.`endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `rua` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `idPessoa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEndereco`),
  CONSTRAINT `endereco_fk` FOREIGN KEY (`idPessoa`) REFERENCES `agenda`.`pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Popula ENDERECO
--
INSERT INTO `agenda`.`endereco` (`idEndereco`,`rua`,`numero`,`bairro`,`complemento`,`idPessoa`) VALUES
 (1,'Rua Pacaembu',32,'Morumbi','Apartamento 122',1),
 (2,'Avenia Alcantara',1522,'Samambaia','',2),
 (3,'Eixo Central',403,'Asa Sul','Bloco A apartamento 211',3);




-- Cria Tabela TELEFONE
--
CREATE TABLE `agenda`.`telefone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telefone` int(11) DEFAULT NULL,
  `idPessoa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `telefone_fk` FOREIGN KEY (`idPessoa`) REFERENCES `agenda`.`pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Popula TELEFONE
--
INSERT INTO `agenda`.`telefone` (`id`,`telefone`,`idPessoa`) VALUES
 (1,98181818,1),
 (2,34323232,2),
 (3,91415665,3),
 (4,34561278,2);




-- Cria Tabela PRODUTOS
--
CREATE TABLE `agenda`.`produtos` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `nome`      varchar(80) NOT NULL,
  `preco`     float       NOT NULL,
  `qtde`      int         NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Popula PRODUTOS
--
INSERT INTO `agenda`.`produtos` VALUES
 (null, 'Sabonete', 1.0, 5),
 (null, 'Cerveja', 5, 100),
 (null, 'Pasta de dente', 2.5, 2);
