/* aula1exer2Logico_RogerioJunior_17-0021751: */

CREATE TABLE PESSOA (
    nome VARCHAR(100),
    senha VARCHAR(50),
    cpf BIGINT(11) PRIMARY KEY
);

CREATE TABLE GERENTE (
    idGerente INT(4) PRIMARY KEY,
    formacao VARCHAR(15),
    email VARCHAR(30),
    cpf BIGINT(11)
);

CREATE TABLE VENDA (
    idVenda INT(4) PRIMARY KEY,
    data DATETIME,
    matriculaEmpregado INT(4)
);

CREATE TABLE AREA (
    idArea INT(4) PRIMARY KEY,
    nome VARCHAR(30),
    idGerente INT(4)
);

CREATE TABLE EMPREGADO (
    matriculaEmpregado INT(4) PRIMARY KEY,
    rua VARCHAR(20),
    numero INT(5),
    bairro VARCHAR(20),
    complemento VARCHAR(50),
    cidade VARCHAR(30),
    estado CHAR(2),
    cep INT(7),
    cpf BIGINT(11)
);

CREATE TABLE PRODUTO (
    idProduto INT(4) PRIMARY KEY,
    nome VARCHAR(30),
    precoUnitario FLOAT(7,2)
);

CREATE TABLE telefone (
    matriculaEmpregado INT(4) NOT NULL,
    telefone BIGINT(12),
    UNIQUE (matriculaEmpregado, telefone)
);

CREATE TABLE inserido (
    matriculaEmpregado INT(4),
    idArea INT(4)
);

CREATE TABLE supervisiona (
    idGerente INT(4),
    matriculaEmpregado INT(4)
);

CREATE TABLE contem (
    idVenda INT(4),
    idProduto INT(4)
);
 
ALTER TABLE GERENTE ADD CONSTRAINT FK_GERENTE_2
    FOREIGN KEY (cpf)
    REFERENCES PESSOA (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE VENDA ADD CONSTRAINT FK_VENDA_2
    FOREIGN KEY (matriculaEmpregado)
    REFERENCES EMPREGADO (matriculaEmpregado);
 
ALTER TABLE AREA ADD CONSTRAINT FK_AREA_2
    FOREIGN KEY (idGerente)
    REFERENCES GERENTE (idGerente);
 
ALTER TABLE EMPREGADO ADD CONSTRAINT FK_EMPREGADO_2
    FOREIGN KEY (cpf)
    REFERENCES PESSOA (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE telefone ADD CONSTRAINT FK_telefone_1
    FOREIGN KEY (matriculaEmpregado)
    REFERENCES EMPREGADO (matriculaEmpregado);
 
ALTER TABLE inserido ADD CONSTRAINT FK_inserido_1
    FOREIGN KEY (idArea)
    REFERENCES AREA (idArea)
    ON DELETE RESTRICT;
 
ALTER TABLE inserido ADD CONSTRAINT FK_inserido_2
    FOREIGN KEY (matriculaEmpregado)
    REFERENCES EMPREGADO (matriculaEmpregado);
 
ALTER TABLE supervisiona ADD CONSTRAINT FK_supervisiona_1
    FOREIGN KEY (idGerente)
    REFERENCES GERENTE (idGerente);
 
ALTER TABLE supervisiona ADD CONSTRAINT FK_supervisiona_2
    FOREIGN KEY (matriculaEmpregado)
    REFERENCES EMPREGADO (matriculaEmpregado);
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_1
    FOREIGN KEY (idVenda)
    REFERENCES VENDA (idVenda)
    ON DELETE RESTRICT;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_2
    FOREIGN KEY (idProduto)
    REFERENCES PRODUTO (idProduto)
    ON DELETE RESTRICT;