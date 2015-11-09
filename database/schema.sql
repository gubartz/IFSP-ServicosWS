DROP DATABASE IF EXISTS ifspservicos;

CREATE DATABASE ifspservicos;

use ifspservicos;

#Criando as tabelas base
CREATE TABLE curso(
  id_curso int(15) AUTO_INCREMENT PRIMARY KEY,
  titulo   varchar(50) NOT NULL,
  area     varchar(50) NOT NULL,
  duracao  int(3) #Em semestres
);

CREATE TABLE usuario(
    id_usuario      int(15) AUTO_INCREMENT PRIMARY KEY,
    id_tipo_usuario int(15),
    nome            varchar(50) NOT NULL,
    rg              varchar(13),
    cpf             varchar(14) NOT NULL,
    cep             varchar(9)  NOT NULL,
    telefone        varchar(14),
    celular         varchar(15),
    email           varchar(50),
    ra              varchar(9)  NOT NULL,
    senha           varchar(50) NOT NULL,
    token           varchar(1000)
);

CREATE TABLE tipo_usuario(
    id_tipo_usuario int(15) AUTO_INCREMENT PRIMARY KEY,
    descricao       varchar(30) NOT NULL
);

CREATE TABLE turma(
  id_turma int(15) AUTO_INCREMENT PRIMARY KEY,
  ano      int(15) NOT NULL,
  semestre int(15) NOT NULL
);

CREATE TABLE periodo(
  id_periodo int(15) AUTO_INCREMENT PRIMARY KEY,
  descricao  varchar(30) NOT NULL
);

CREATE TABLE disciplina(
  id_disciplina int(15) AUTO_INCREMENT PRIMARY KEY,
  codigo        varchar(30) NOT NULL, #Alternate key
  titulo        varchar(50) NOT NULL,
  carga_horaria int(3)                #Em horas
);

CREATE TABLE avaliacao(
  id_avaliacao int(15) AUTO_INCREMENT PRIMARY KEY,
  data         date        NOT NULL,
  descricao    varchar(50) NOT NULL,
  peso         float(4,2)  NOT NULL
);

CREATE TABLE situacao(
  id_situacao int(15) AUTO_INCREMENT PRIMARY KEY,
  descricao   varchar(50)  #Aprovado, Reprovado, Em Curso
);

#Criando as tabelas de relacionamento
CREATE TABLE rel_turma_periodo(
  id_turma_periodo int(15) AUTO_INCREMENT PRIMARY KEY,
  id_turma        int(15) NOT NULL,
  id_periodo      int(15) NOT NULL,
  UNIQUE(id_turma)
);

CREATE TABLE rel_turma_disciplina(
  id_turma_disciplina int(15) AUTO_INCREMENT PRIMARY KEY,
  id_turma            int(15) NOT NULL,
  id_disciplina       int(15) NOT NULL,
  UNIQUE(id_turma)
);

CREATE TABLE rel_aluno_turma_disciplina(
  id_aluno_turma_disciplina int(15)    AUTO_INCREMENT PRIMARY KEY,
  id_usuario                int(15)    NOT NULL,
  id_turma_disciplina       int(15)    NOT NULL,
  frequencia                float(5,2) NOT NULL,
  UNIQUE(id_usuario, id_turma_disciplina)
);

CREATE TABLE rel_professor_turma_disciplina(
  id_professor_turma_disciplina int(15)  AUTO_INCREMENT PRIMARY KEY,
  id_usuario                    int(15)  NOT NULL,
  id_turma_disciplina           int(15)  NOT NULL,
  UNIQUE(id_usuario, id_turma_disciplina) 
);

CREATE TABLE rel_avaliacao_turma_disciplina(
  id_avaliacao_turma_disciplina int(15) AUTO_INCREMENT PRIMARY KEY,
  id_avaliacao                  int(15) NOT NULL,
  id_turma_disciplina           int(15) NOT NULL,
  UNIQUE(id_avaliacao, id_turma_disciplina)
);

CREATE TABLE rel_disciplina_curso(
  id_disciplina_curso int(15) AUTO_INCREMENT PRIMARY KEY,
  id_disciplina       int(15) NOT NULL,
  id_curso            int(15) NOT NULL,
  UNIQUE(id_disciplina, id_curso)
);

CREATE TABLE rel_avaliacao_turma_aluno(
  id_avaliacao_turma_aluno      int(15)     AUTO_INCREMENT PRIMARY KEY,
  id_avaliacao_turma_disciplina int(15)     NOT NULL,
  id_usuario                    int(15)     NOT NULL,
  nota                          float(4,2)  NOT NULL,
  UNIQUE(id_usuario, id_avaliacao_turma_disciplina)
);

CREATE TABLE rel_situacao_aluno_turma(
  id_situacao_aluno_turma   int(15) AUTO_INCREMENT PRIMARY KEY,
  id_situacao               int(15) NOT NULL,
  id_usuario                int(15) NOT NULL,
  id_aluno_turma_disciplina int(15) NOT NULL,
  media_final               float(4,2)  NOT NULL,
  UNIQUE(id_usuario, id_aluno_turma_disciplina)
);

#Adicionando as FKs nas tabelas de relacionamento
ALTER TABLE usuario
  ADD CONSTRAINT FK_rel_usuario_tipo_usuario FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario);

ALTER TABLE rel_turma_periodo
  ADD CONSTRAINT FK_rel_turma_periodo         FOREIGN KEY (id_turma)   REFERENCES turma(id_turma),
  ADD CONSTRAINT FK_rel_turma_periodo_periodo FOREIGN KEY (id_periodo) REFERENCES periodo(id_periodo);

ALTER TABLE rel_turma_disciplina
  ADD CONSTRAINT FK_rel_turma_disciplina_turma      FOREIGN KEY (id_turma) REFERENCES turma(id_turma),
  ADD CONSTRAINT FK_rel_turma_disciplina_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina);

ALTER TABLE rel_aluno_turma_disciplina
  ADD CONSTRAINT FK_rel_aluno_turma_disciplina_usuario          FOREIGN KEY (id_usuario)          REFERENCES usuario(id_usuario),
  ADD CONSTRAINT FK_rel_aluno_turma_disciplina_turma_disciplina FOREIGN KEY (id_turma_disciplina) REFERENCES rel_turma_disciplina(id_turma_disciplina);

ALTER TABLE rel_disciplina_curso
  ADD CONSTRAINT FK_rel_disciplina_curso_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina),
  ADD CONSTRAINT FK_rel_disciplina_curso_curso      FOREIGN KEY (id_curso)      REFERENCES curso(id_curso);

ALTER TABLE rel_professor_turma_disciplina
  ADD CONSTRAINT FK_rel_professor_disciplina_professor  FOREIGN KEY (id_usuario)          REFERENCES usuario(id_usuario),
  ADD CONSTRAINT FK_rel_professor_disciplina_disciplina FOREIGN KEY (id_turma_disciplina) REFERENCES rel_turma_disciplina(id_turma_disciplina);

ALTER TABLE rel_avaliacao_turma_disciplina
  ADD CONSTRAINT FK_rel_avaliacao_turma_disciplina_avaliacao       FOREIGN KEY (id_avaliacao)        REFERENCES avaliacao(id_avaliacao),
  ADD CONSTRAINT FK_rel_avaliacao_turma_disciplina_turma_disciplina FOREIGN KEY (id_turma_disciplina) REFERENCES rel_turma_disciplina(id_turma_disciplina);

ALTER TABLE rel_avaliacao_turma_aluno
  ADD CONSTRAINT FK_rel_avaliacao_turma_disciplina       FOREIGN KEY (id_avaliacao_turma_disciplina) REFERENCES rel_avaliacao_turma_disciplina(id_avaliacao_turma_disciplina),
  ADD CONSTRAINT FK_rel_avaliacao_disciplina_aluno_aluno FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);

ALTER TABLE rel_situacao_aluno_turma
  ADD CONSTRAINT FK_rel_situacao_aluno_disciplina_situacao   FOREIGN KEY (id_situacao)               REFERENCES situacao(id_situacao),
  ADD CONSTRAINT FK_rel_situacao_aluno_disciplina_aluno      FOREIGN KEY (id_usuario)                REFERENCES usuario(id_usuario),
  ADD CONSTRAINT FK_rel_situacao_aluno_turma_disciplina      FOREIGN KEY (id_aluno_turma_disciplina) REFERENCES rel_aluno_turma_disciplina(id_aluno_turma_disciplina);