/* Lógico_1: */

CREATE TABLE SETOR (
    idArea INT(4) PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE PLANTONISTA (
    matriculaFuncional INT(4) PRIMARY KEY,
    nome VARCHAR(100),
    sexo ENUM('F','M')
);

CREATE TABLE ESPECIALIDADE (
    idEspecialidade INT(4) PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE alocado (
    idArea INT(4),
    matriculaFuncional INT(4),
    saida DATETIME,
    entrada DATETIME,
    UNIQUE (matriculaFuncional, saida, entrada)
);

CREATE TABLE possui (
    matriculaFuncional INT(4),
    idEspecialidade INT(4)
);
 
ALTER TABLE alocado ADD CONSTRAINT FK_alocado_1
    FOREIGN KEY (idArea)
    REFERENCES SETOR (idArea)
    ON DELETE RESTRICT;
 
ALTER TABLE alocado ADD CONSTRAINT FK_alocado_2
    FOREIGN KEY (matriculaFuncional)
    REFERENCES PLANTONISTA (matriculaFuncional)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (matriculaFuncional)
    REFERENCES PLANTONISTA (matriculaFuncional)
    ON DELETE SET NULL;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (idEspecialidade)
    REFERENCES ESPECIALIDADE (idEspecialidade)
    ON DELETE SET NULL;