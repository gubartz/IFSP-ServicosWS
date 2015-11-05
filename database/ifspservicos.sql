DROP DATABASE IF EXISTS ifspservicos;

CREATE DATABASE ifspservicos;

use ifspservicos;

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
    rg              varchar(13),
    cpf             varchar(14) NOT NULL,
    cep             varchar(9)  NOT NULL,
    telefone        varchar(14),
    celular         varchar(15),
    email           varchar(50),
    ra              varchar(9)  NOT NULL,
    senha           varchar(50) NOT NULL
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
  nota         float(4,2) NOT NULL,
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
  id_usuario int(15) NOT NULL
);

CREATE TABLE rel_turma_disciplina(
  id            int(15) AUTO_INCREMENT PRIMARY KEY,
  id_turma      int(15) NOT NULL,
  id_disciplina int(15) NOT NULL
);

CREATE TABLE rel_aluno_turmadisciplina(
  id                 int(15)    AUTO_INCREMENT PRIMARY KEY,
  id_usuario         int(15)    NOT NULL,
  id_turmadisciplina int(15)    NOT NULL,
  frequencia         float(5,2) NOT NULL
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

ALTER TABLE rel_aluno_turmadisciplina
  ADD CONSTRAINT FK_relalunoturmadisciplina_usuario         FOREIGN KEY (id_usuario)         REFERENCES usuario (id_usuario),
  ADD CONSTRAINT FK_relalunoturmadisciplina_turmadisciplina FOREIGN KEY (id_turmadisciplina) REFERENCES disciplina (id_disciplina);

ALTER TABLE rel_disciplina_curso
  ADD CONSTRAINT FK_reldisciplinacurso_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina),
  ADD CONSTRAINT FK_reldisciplinacurso_curso      FOREIGN KEY (id_curso)      REFERENCES rel_turma_disciplina (id);

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

INSERT INTO usuario VALUES( 1, #id_usuario
                            1, #id_tipo_usuario
                            'Guilherme Lima Pereira',
                            '45.245.984-9',
                            '421.819.808-02',
                            '13183-250',
                            '(19) 3897-1762',
                            '(19) 98173-7172',
                            'guuuilp@gmail.com',
                            '132017-3',
                            '123456' );

INSERT INTO usuario VALUES( 2, #id_usuario
                            2, #id_tipo_usuario
                            'Gustavo Bartz Guedes',
                            '4.032.894-40',
                            '845.184.304-25',
                            '13120-230',
                            '(19) 3875-1261',
                            '(19) 98433-7122',
                            'gubartz@ifsp.edu.br',
                            '162912-1',
                            '123456' );

INSERT INTO usuario VALUES( 3, #id_usuario
                            2, #id_tipo_usuario
                            'André Constantino da Silva',
                            '30.655.797-6',
                            '116.878.341-05',
                            '13120-231',
                            '(19) 3875-1263',
                            '(19) 98433-7124',
                            'andre.constantino@gmail.com',
                            '162912-2',
                            '123456' );

INSERT INTO usuario VALUES( 4, #id_usuario
                            2, #id_tipo_usuario
                            'Carlos Roberto dos Santos Jr',
                            '48.215.365-9',
                            '678.534.594-40',
                            '13120-232',
                            '(19) 3875-1265',
                            '(19) 98433-7126',
                            'carlos.rsantos@ifsp.edu.br',
                            '162912-3',
                            '123456' );

INSERT INTO usuario VALUES( 5, #id_usuario
                            2, #id_tipo_usuario
                            'Daiane Mastrangelo Tomazeti',
                            '46.048.190-3',
                            '415.578.013-55',
                            '13120-233',
                            '(19) 3875-1267',
                            '(19) 98433-7128',
                            'daianetomazeti@gmail.com',
                            '162912-4',
                            '123456' );

INSERT INTO usuario VALUES( 6, #id_usuario
                            2, #id_tipo_usuario
                            'Edgar Noda',
                            '41.766.399-7',
                            '934.834.052-24',
                            '13120-234',
                            '(19) 3875-1269',
                            '(19) 98433-7121',
                            'edgar.noda@ifsp.edu.br',
                            '162912-5',
                            '123456' );

INSERT INTO usuario VALUES( 7, #id_usuario
                            2, #id_tipo_usuario
                            'Leandro Ledel',
                            '46.281.275-3',
                            '045.353.991-23',
                            '13120-235',
                            '(19) 3875-1265',
                            '(19) 98433-7122',
                            'leandro.ledel@gmail.com',
                            '162912-6',
                            '123456' );

INSERT INTO usuario VALUES( 8, #id_usuario
                            2, #id_tipo_usuario
                            'Rodolfo Francisco de Oliveira',
                            '22.065.604-6',
                            '545.810.012-34',
                            '13120-236',
                            '(19) 3875-1261',
                            '(19) 98433-7129',
                            'rodolfo.oliveira@ifsp.edu.br',
                            '162912-7',
                            '123456' );

INSERT INTO usuario VALUES( 9, #id_usuario
                            2, #id_tipo_usuario
                            'Fernando Sambinelli',
                            '22.065.604-7',
                            '545.810.012-35',
                            '13120-236',
                            '(19) 3875-1269',
                            '(19) 98433-7123',
                            'fersambi@gmail.com',
                            '162912-8',
                            '123456' );

INSERT INTO turma VALUES( 1, 'N135', 2015, 1 );
INSERT INTO turma VALUES( 2, 'N146', 2015, 2 );

#Matérias do primeiro semestre 2015
INSERT INTO disciplina VALUES( 1, 'DW1A5', 'Desenvolvimento para Web I', 80 );
INSERT INTO disciplina VALUES( 2, 'GTIA5', 'Gestão de Ti', 80 );
INSERT INTO disciplina VALUES( 3, 'ENGA5', 'Engenharia de Software', 80 );
INSERT INTO disciplina VALUES( 4, 'PR1A5', 'Projeto Integrado I', 80 );
INSERT INTO disciplina VALUES( 5, 'SIGA5', 'Sistemas de Informações Gerenciais', 80 );

#Matérias do segundo semestre
INSERT INTO disciplina VALUES( 6, 'DW2A6', 'Desenvolvimento Web II', 160 );
INSERT INTO disciplina VALUES( 7, 'PI2A6', 'Projeto Integrado II', 160 );
INSERT INTO disciplina VALUES( 8, 'SEGA6', 'Segurança da Informação', 160 );
INSERT INTO disciplina VALUES( 9, 'TPAA6', 'Tópicos Avançados', 160 );

#Notas de DW1 - Guilherme
INSERT INTO avaliacao VALUES( 1, 7.25, 0.7 );
INSERT INTO avaliacao VALUES( 2, 11.5, 0.3 );

#Notas de ENG - Guilherme
INSERT INTO avaliacao VALUES( 3, 9.25, 0.2 );
INSERT INTO avaliacao VALUES( 4, 9.58, 0.3 );
INSERT INTO avaliacao VALUES( 5, 6   , 0.2 );
INSERT INTO avaliacao VALUES( 6, 0.3 , 0.3 );

#Notas de GTI - Guilherme
INSERT INTO avaliacao VALUES( 7 , 8.5, 0.15 );
INSERT INTO avaliacao VALUES( 8 , 8.5, 0.2  );
INSERT INTO avaliacao VALUES( 9 , 8.5, 0.3  );
INSERT INTO avaliacao VALUES( 10, 3.5, 0.2  );
INSERT INTO avaliacao VALUES( 11, 4  , 0.15 );

#Notas PII - Guilherme
INSERT INTO avaliacao VALUES( 12, 10, 1 );

#Notas SIGA5 - Guilherme
INSERT INTO avaliacao VALUES( 13, 7.5, 0.25 );
INSERT INTO avaliacao VALUES( 14, 8.5, 0.25 );
INSERT INTO avaliacao VALUES( 15, 8, 0.25 );
INSERT INTO avaliacao VALUES( 16, 9, 0.25 );

#Notas ultimo semestre - Guilherme
INSERT INTO avaliacao VALUES( 17, 10, 1 );
INSERT INTO avaliacao VALUES( 18, 7, 1 );
INSERT INTO avaliacao VALUES( 19, 8, 1 );
INSERT INTO avaliacao VALUES( 20, 9, 1 );

INSERT INTO situacao VALUES( 1, 'Aprovado' );
INSERT INTO situacao VALUES( 2, 'Reprovado' );
INSERT INTO situacao VALUES( 3, 'Em Curso' );

INSERT INTO rel_aluno_turma VALUES( 1, 1, 1 );
INSERT INTO rel_aluno_turma VALUES( 2, 2, 1 );

#Criando o relacionamento entre matérias e turma
INSERT INTO rel_turma_disciplina VALUES( 1, 1, 1 );
INSERT INTO rel_turma_disciplina VALUES( 2, 1, 2 );
INSERT INTO rel_turma_disciplina VALUES( 3, 1, 3 );
INSERT INTO rel_turma_disciplina VALUES( 4, 1, 4 );
INSERT INTO rel_turma_disciplina VALUES( 5, 1, 5 );
INSERT INTO rel_turma_disciplina VALUES( 6, 2, 6 );
INSERT INTO rel_turma_disciplina VALUES( 7, 2, 7 );
INSERT INTO rel_turma_disciplina VALUES( 8, 2, 8 );
INSERT INTO rel_turma_disciplina VALUES( 9, 2, 9 );

INSERT INTO rel_aluno_turmadisciplina VALUES( 1, 1, 1, 90 );
INSERT INTO rel_aluno_turmadisciplina VALUES( 2, 1, 2, 100 );
INSERT INTO rel_aluno_turmadisciplina VALUES( 3, 1, 3, 100 );
INSERT INTO rel_aluno_turmadisciplina VALUES( 4, 1, 4, 90 );
INSERT INTO rel_aluno_turmadisciplina VALUES( 5, 1, 5, 85 );
INSERT INTO rel_aluno_turmadisciplina VALUES( 6, 1, 6, 91.5 );
INSERT INTO rel_aluno_turmadisciplina VALUES( 7, 1, 7, 73.5 );
INSERT INTO rel_aluno_turmadisciplina VALUES( 8, 1, 8, 100 );
INSERT INTO rel_aluno_turmadisciplina VALUES( 9, 1, 9, 92.5 );

INSERT INTO rel_disciplina_curso VALUES ( 1, 1, 1 );
INSERT INTO rel_disciplina_curso VALUES ( 2, 2, 1 );
INSERT INTO rel_disciplina_curso VALUES ( 3, 3, 1 );
INSERT INTO rel_disciplina_curso VALUES ( 4, 4, 1 );
INSERT INTO rel_disciplina_curso VALUES ( 5, 5, 1 );
INSERT INTO rel_disciplina_curso VALUES ( 6, 6, 1 );
INSERT INTO rel_disciplina_curso VALUES ( 7, 7, 1 );
INSERT INTO rel_disciplina_curso VALUES ( 8, 8, 1 );
INSERT INTO rel_disciplina_curso VALUES ( 9, 9, 1 );

INSERT INTO rel_professor_disciplina VALUES ( 1, 2, 1 );
INSERT INTO rel_professor_disciplina VALUES ( 2, 6, 2 );
INSERT INTO rel_professor_disciplina VALUES ( 3, 9, 3 );
INSERT INTO rel_professor_disciplina VALUES ( 4, 3, 4 );
INSERT INTO rel_professor_disciplina VALUES ( 5, 4, 5 );
INSERT INTO rel_professor_disciplina VALUES ( 6, 7, 6 );
INSERT INTO rel_professor_disciplina VALUES ( 7, 5, 7 );
INSERT INTO rel_professor_disciplina VALUES ( 8, 8, 8 );
INSERT INTO rel_professor_disciplina VALUES ( 9, 2, 9 );

INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 1, 1, 1 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 2, 2, 1 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 3, 3, 3 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 4, 4, 3 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 5, 5, 3 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 6, 6, 3 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 7, 7, 2 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 8, 8, 2 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 9, 9, 2 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 10, 10, 2 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 11, 11, 2 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 12, 12, 4 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 13, 13, 5 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 14, 14, 5 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 15, 15, 5 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 16, 16, 5 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 17, 17, 6 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 18, 18, 7 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 19, 19, 8 );
INSERT INTO rel_avaliacao_turmadisciplina VALUES ( 20, 20, 9 );

INSERT INTO rel_avaliacaoturma_aluno VALUES ( 1, 1, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 2, 2, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 3, 3, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 4, 4, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 5, 5, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 6, 6, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 7, 7, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 8, 8, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 9, 9, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 10, 10, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 11, 11, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 12, 12, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 13, 13, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 14, 14, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 15, 15, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 16, 16, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 17, 17, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 18, 18, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 19, 19, 1 );
INSERT INTO rel_avaliacaoturma_aluno VALUES ( 20, 20, 1 );

INSERT INTO rel_situacao_aluno_disciplina VALUES ( 1, 1, 1, 1 );
INSERT INTO rel_situacao_aluno_disciplina VALUES ( 2, 1, 1, 2 );
INSERT INTO rel_situacao_aluno_disciplina VALUES ( 3, 1, 1, 3 );
INSERT INTO rel_situacao_aluno_disciplina VALUES ( 4, 1, 1, 4 );
INSERT INTO rel_situacao_aluno_disciplina VALUES ( 5, 1, 1, 5 );
INSERT INTO rel_situacao_aluno_disciplina VALUES ( 6, 3, 1, 6 );
INSERT INTO rel_situacao_aluno_disciplina VALUES ( 7, 3, 1, 7 );
INSERT INTO rel_situacao_aluno_disciplina VALUES ( 8, 3, 1, 8 );
INSERT INTO rel_situacao_aluno_disciplina VALUES ( 9, 3, 1, 9 );

#Criando as views, de forma a trazer a informação de uma forma visivelmente útil
CREATE OR REPLACE VIEW vrel_aluno_turma_curso AS
  SELECT u.nome   nome_aluno,
         t.codigo codigo_turma,
         c.titulo nome_curso
  FROM   usuario              u,
         turma                t,
         curso                c,
         rel_aluno_turma      rat,
         rel_turma_disciplina rtd,
         rel_disciplina_curso rdc
  WHERE  u.id_tipo_usuario = 1              AND
         u.id_usuario      = rat.id_usuario AND
         rat.id_turma      = t.id_turma     AND
         rtd.id_turma      = t.id_turma     AND
         rdc.id_disciplina = rtd.id_turma   AND
         rdc.id_curso      = c.id_curso
  GROUP BY nome, codigo, titulo;

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
         z.frequencia    frequencia,
         d.id_turma      id_turma,
         c.titulo        nome_disciplina,
         d.codigo        codigo_turma
  FROM   rel_avaliacaoturma_aluno       r,
         rel_aluno_turmadisciplina      z,
         rel_avaliacao_turmadisciplina  t,
         rel_turma_disciplina           k,
         avaliacao                      v,
         turma                          d,
         usuario                        u,
         disciplina                     c
  WHERE  t.id_avaliacao       = v.id_avaliacao       AND
         r.id_usuario         = u.id_usuario         AND
         u.id_usuario         = z.id_usuario         AND
         z.id_turmadisciplina = k.id        AND
         r.id_avaliacaoturma  = t.id                 AND
         k.id                 = t.id_turmadisciplina AND
         k.id_turma       = d.id_turma      AND
         k.id_disciplina      = c.id_disciplina      AND
         u.id_tipo_usuario    = 1; #id_tipo_usuario = 1 = aluno

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
  SELECT   id_aluno,
           nome_aluno,
           sum(nota * peso) media,
           nome_disciplina,
           frequencia
  FROM     vrel_avaliacaoturma_aluno r
  GROUP BY id_usuario, nome_disciplina;