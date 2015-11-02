CREATE DATABASE ifspservicos;

#Dropando as tabelas, caso existam
drop table if exists rel_aluno_turma;
drop table if exists rel_turma_disciplina;
drop table if exists rel_disciplina_curso;
drop table if exists rel_professor_disciplina;
drop table if exists rel_avaliacaoturma_aluno;
drop table if exists rel_situacao_aluno_disciplina;
drop table if exists rel_turma_disciplina;
drop table if exists rel_avaliacao_turmadisciplina;
drop table if exists curso;
drop table if exists usuario;
drop table if exists tipo_usuario;
drop table if exists turma;
drop table if exists disciplina;
drop table if exists avaliacao;
drop table if exists situacao;

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
    rg              varchar(11),
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
  codigo   varchar(30) NOT NULL,
  ano      int(15) NOT NULL,
  semestre int(15) NOT NULL
);

CREATE TABLE disciplina(
  id_disciplina int(15) AUTO_INCREMENT PRIMARY KEY,
  codigo        varchar(30) NOT NULL, #Alternate key
  titulo        varchar(50) NOT NULL,
  carga_horaria int(3)                #Em horas
);

CREATE TABLE avaliacao(
  id_avaliacao int(15) AUTO_INCREMENT PRIMARY KEY,
  nota         int(4) NOT NULL,
  peso         float(4,2) NOT NULL
);

CREATE TABLE situacao(
  id_situacao int(15) AUTO_INCREMENT PRIMARY KEY,
  descricao   varchar(50)  #Aprovado, Reprovado, Em Curso
);

#Criando as tabelas de relacionamento
CREATE TABLE rel_aluno_turma(
  id         int(15) AUTO_INCREMENT PRIMARY KEY,
  id_turma   int(15) NOT NULL,
  id_usuario int(15) NOT NULL,
  frequencia int(15) NOT NULL
);

CREATE TABLE rel_turma_disciplina(
  id            int(15) AUTO_INCREMENT PRIMARY KEY,
  id_turma      int(15) NOT NULL,
  id_disciplina int(15) NOT NULL
);

CREATE TABLE rel_disciplina_curso(
  id            int(15) AUTO_INCREMENT PRIMARY KEY,
  id_disciplina int(15) NOT NULL,
  id_curso      int(15) NOT NULL
);

CREATE TABLE rel_professor_disciplina(
  id            int(15) AUTO_INCREMENT PRIMARY KEY,
  id_usuario    int(15) NOT NULL,
  id_disciplina int(15) NOT NULL
);

CREATE TABLE rel_avaliacao_turmadisciplina(
  id                 int(15) AUTO_INCREMENT PRIMARY KEY,
  id_avaliacao       int(15) NOT NULL,
  id_turmadisciplina int(15) NOT NULL
);

CREATE TABLE rel_avaliacaoturma_aluno(
  id                int(15) AUTO_INCREMENT PRIMARY KEY,
  id_avaliacaoturma int(15) NOT NULL,
  id_usuario        int(15) NOT NULL
);

CREATE TABLE rel_situacao_aluno_disciplina(
  id            int(15) AUTO_INCREMENT PRIMARY KEY,
  id_situacao   int(15) NOT NULL,
  id_usuario    int(15) NOT NULL,
  id_disciplina int(15) NOT NULL
);

#Adicionando as FKs nas tabelas de relacionamento
ALTER TABLE usuario
  ADD CONSTRAINT FK_relusuario_tipousuario FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario);

ALTER TABLE rel_aluno_turma
  ADD CONSTRAINT FK_relalunoturma_turma FOREIGN KEY (id_turma)   REFERENCES turma (id_turma),
  ADD CONSTRAINT FK_relalunoturma_aluno FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);

ALTER TABLE rel_turma_disciplina
  ADD CONSTRAINT FK_relturmadisciplina_turma      FOREIGN KEY (id_turma)      REFERENCES turma (id_turma),
  ADD CONSTRAINT FK_relturmadisciplina_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina);

ALTER TABLE rel_disciplina_curso
  ADD CONSTRAINT FK_reldisciplinacurso_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina),
  ADD CONSTRAINT FK_reldisciplinacurso_curso      FOREIGN KEY (id_curso)      REFERENCES curso (id_curso);

ALTER TABLE rel_professor_disciplina
  ADD CONSTRAINT FK_relprofessordisciplina_professor  FOREIGN KEY (id_usuario)    REFERENCES usuario (id_usuario),
  ADD CONSTRAINT FK_relprofessordisciplina_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina);

ALTER TABLE rel_avaliacao_turmadisciplina
  ADD CONSTRAINT FK_relavaliacaoturmadisciplina_avaliacao       FOREIGN KEY (id_avaliacao)       REFERENCES avaliacao (id_avaliacao),
  ADD CONSTRAINT FK_relavaliacaoturmadisciplina_turmadisciplina FOREIGN KEY (id_turmadisciplina) REFERENCES rel_turma_disciplina (id);

ALTER TABLE rel_avaliacaoturma_aluno
  ADD CONSTRAINT FK_relavaliacaodisciplinaaluno_relavaliacaoturma FOREIGN KEY (id_avaliacaoturma) REFERENCES rel_avaliacaoturma_aluno (id),
  ADD CONSTRAINT FK_relavaliacaodisciplinaaluno_aluno             FOREIGN KEY (id_usuario)        REFERENCES usuario (id_usuario);

ALTER TABLE rel_situacao_aluno_disciplina
  ADD CONSTRAINT FK_relsituacaoalunodisciplina_situacao   FOREIGN KEY (id_situacao)   REFERENCES situacao (id_situacao),
  ADD CONSTRAINT FK_relsituacaoalunodisciplina_aluno      FOREIGN KEY (id_usuario)    REFERENCES usuario (id_usuario),
  ADD CONSTRAINT FK_relsituacaoalunodisciplina_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina);

#Realizando as cargas de dados
INSERT INTO curso VALUES( null,
                          'Análise e Desenvolvimento de Sistemas',
                          'Informática',
                          6 );

INSERT INTO tipo_usuario VALUES( 1, 'Aluno' );
INSERT INTO tipo_usuario VALUES( 2, 'Professor' );

INSERT INTO usuario VALUES( null,
                            1,
                            'Guilherme Lima Pereira',
                            '45.245.984-9',
                            '421.819.808-02',
                            '13183-250',
                            '(19) 3897-1762',
                            '(19) 98173-7172',
                            'guuuilp@gmail.com',
                            '132017-3',
                            '123456',
                            '807beb0856b800f4faeb9783464c4b2d' );

INSERT INTO usuario VALUES( null,
                            2,
                            'Gustavo Bartz Guedes',
                            '4.032.894-40',
                            '845.184.304-25',
                            '13120-230',
                            '(19) 3875-1262',
                            '(19) 98433-7122',
                            'gubartz@gmail.com',
                            '162912-1',
                            '123456',
                            '807beb0856b800f4faeb9783464c4b2d' );

INSERT INTO turma VALUES( null, 'N135', 2015, 2 );

INSERT INTO disciplina VALUES( null,
                               'DW1A5',
                               'Desenvolvimento para Web I',
                               80 );

INSERT INTO disciplina VALUES( null, 'GTIA5', 'Gestão de Ti', 80 );

INSERT INTO avaliacao VALUES( null, 8, 0.5 );
INSERT INTO avaliacao VALUES( null, 10, 0.5 );
INSERT INTO avaliacao VALUES( null, 6, 0.7 );
INSERT INTO avaliacao VALUES( null, 8, 0.3 );

INSERT INTO situacao VALUES( 1, 'Aprovado' );
INSERT INTO situacao VALUES( 2, 'Reprovado' );
INSERT INTO situacao VALUES( 3, 'Em Curso' );

INSERT INTO rel_aluno_turma VALUES( null, 1, 1, 95 );

INSERT INTO rel_turma_disciplina VALUES( null, 1, 1 );
INSERT INTO rel_turma_disciplina VALUES( null, 1, 2 );

INSERT INTO rel_disciplina_curso VALUES ( null, 1, 1 );
INSERT INTO rel_disciplina_curso VALUES ( null, 2, 1 );

INSERT INTO rel_professor_disciplina VALUES ( null, 2, 1 );

INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 1, 1, 1 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 2, 2, 1 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 3, 3, 2 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 4, 4, 2 );

INSERT INTO rel_avaliacaoturma_aluno VALUES ( null, 1, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( null, 2, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( null, 3, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( null, 4, 1 );

INSERT INTO rel_situacao_aluno_disciplina VALUES ( null, 3, 1, 1 );
INSERT INTO rel_situacao_aluno_disciplina VALUES ( null, 3, 1, 2 );

#Criando as views, de forma a trazer a informação de uma forma visivelmente útil
CREATE OR REPLACE VIEW vrel_aluno_turma_curso_disciplina AS
  SELECT u.nome   nome_aluno,
         t.codigo codigo_turma,
         c.titulo nome_curso,
         u.id_usuario,
         di.codigo,
         di.titulo
  FROM   rel_aluno_turma       r,
         rel_turma_disciplina  d,
         rel_disciplina_curso  k,
         usuario               u,
         turma                 t,
         curso                 c,
         disciplina            di
  WHERE  r.id_usuario      = u.id_usuario    AND
         r.id_turma        = t.id_turma      AND
         r.id_turma        = d.id_turma      AND
         d.id_disciplina   = k.id_disciplina AND
         k.id_curso        = c.id_curso      AND
         u.id_tipo_usuario = 1               AND #id_tipo_usuario = 1 = aluno
         d.id_disciplina   = di.id_disciplina; 

CREATE OR REPLACE VIEW vrel_aluno_turma_curso AS
  SELECT u.nome   nome_aluno,
         t.codigo codigo_turma,
         c.titulo nome_curso,
         u.id_usuario
  FROM   rel_aluno_turma       r,
         rel_turma_disciplina  d,
         rel_disciplina_curso  k,
         usuario               u,
         turma                 t,
         curso                 c
  WHERE  r.id_usuario      = u.id_usuario    AND
         r.id_turma        = t.id_turma      AND
         r.id_turma        = d.id_turma      AND
         d.id_disciplina   = k.id_disciplina AND
         k.id_curso        = c.id_curso      AND
         u.id_tipo_usuario = 1; #id_tipo_usuario = 1 = aluno

CREATE OR REPLACE VIEW vrel_disciplina_curso AS
  SELECT d.titulo nome_disciplina,
         c.titulo nome_curso
  FROM   rel_disciplina_curso  r,
         disciplina            d,
         curso                 c
  WHERE  r.id_disciplina = d.id_disciplina AND
         r.id_curso      = c.id_curso;

CREATE OR REPLACE VIEW vrel_professor_disciplina AS
  SELECT u.nome   nome_professor,
         d.titulo nome_disciplina
  FROM   rel_professor_disciplina r,
         usuario                  u,
         disciplina               d
  WHERE  r.id_usuario      = u.id_usuario    AND
         r.id_disciplina   = d.id_disciplina AND
         u.id_tipo_usuario = 2; #id_tipo_usuario = 2 = professor

CREATE OR REPLACE VIEW vrel_avaliacaoturma_aluno AS
  SELECT u.id_usuario    id_usuario,
         u.nome          nome_aluno,
         v.nota          nota,
         v.peso          peso,
         d.id_turma      id_turma,
         c.titulo        nome_disciplina,
         d.codigo        codigo_turma
  FROM   rel_avaliacaoturma_aluno       r,
         rel_avaliacao_turmadisciplina  t,
         rel_turma_disciplina           k,
         avaliacao                      v,
         turma                          d,
         usuario                        u,
         disciplina                     c
  WHERE  t.id_avaliacao      = v.id_avaliacao       AND
         r.id_usuario        = u.id_usuario         AND
         r.id_avaliacaoturma = t.id                 AND
         k.id                = t.id_turmadisciplina AND
         k.id_disciplina     = c.id_disciplina      AND
         u.id_tipo_usuario   = 1; #id_tipo_usuario = 1 = aluno

CREATE OR REPLACE VIEW vrel_situacao_aluno_disciplina AS
  SELECT u.nome      nome_aluno,
         d.titulo    nome_disciplina,
         s.descricao situacao
  FROM   rel_situacao_aluno_disciplina r,
         situacao                      s,
         usuario                       u,
         disciplina                    d
  WHERE  r.id_situacao     = s.id_situacao   AND
         r.id_usuario      = u.id_usuario    AND
         r.id_disciplina   = d.id_disciplina AND
         u.id_tipo_usuario = 1; #id_tipo_usuario = 1 = aluno

CREATE OR REPLACE VIEW vmedia_aluno_disciplina AS
  SELECT   nome_aluno,
           sum(nota * peso) media,
           nome_disciplina,
           95 presenca #Cravado 95. Não pensei em como fazer o controle de presença no banco de dados
  FROM     vrel_avaliacaoturma_aluno r
  GROUP BY id_usuario, nome_disciplina;