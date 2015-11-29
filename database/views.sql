#Criando as views, de forma a trazer a informação de uma forma visivelmente útil

#Mantém todas as notas tiradas em todas as turmas de disciplinas
CREATE OR REPLACE VIEW vrel_aluno_turma_curso_disciplina AS
  SELECT c.titulo     AS curso
       , u.nome       AS usuario
       , u.id_usuario
       , u.ra      
       , d.id_disciplina
       , d.titulo       AS disciplina
       , d.codigo
       , ata.nota
       , td.id_turma_disciplina
  FROM curso                      c
     , usuario                    u
     , turma                      t
     , rel_turma_disciplina       td
     , rel_aluno_turma_disciplina atd
     , rel_disciplina_curso       dc
     , disciplina                 d
     , rel_avaliacao_turma_aluno      ata
     , rel_avaliacao_turma_disciplina avtd
  WHERE t.id_turma                         = td.id_turma
    AND atd.id_turma_disciplina            = td.id_turma_disciplina
    AND atd.id_usuario                     = u.id_usuario
    AND u.id_tipo_usuario                  = 1
    AND dc.id_disciplina                   = d.id_disciplina
    AND td.id_disciplina                   = dc.id_disciplina
    AND ata.id_usuario                     = u.id_usuario
    AND avtd.id_avaliacao_turma_disciplina = ata.id_avaliacao_turma_disciplina
    AND avtd.id_turma_disciplina           = td.id_turma_disciplina;

#Mantém todas as médias finais
CREATE OR REPLACE VIEW vrel_aluno_turma_nota_final AS
  SELECT u.id_usuario
       , di.codigo    AS codigo_disciplina
       , di.titulo    AS nome_disciplina
       , si.descricao AS situacao
       , s.media_final
       , atd.frequencia
       , tm.semestre
  FROM rel_situacao_aluno_turma   s
     , usuario                    u
     , rel_aluno_turma_disciplina atd
     , rel_turma_disciplina       td
     , situacao                   si
     , disciplina                 di
     , turma                      tm
  WHERE u.id_usuario                = s.id_usuario
    AND s.id_aluno_turma_disciplina = atd.id_aluno_turma_disciplina
    AND atd.id_turma_disciplina     = td.id_turma_disciplina
    AND s.id_situacao               = si.id_situacao
    AND td.id_disciplina            = di.id_disciplina
    AND tm.id_turma                 = td.id_turma;

#Mantém as disciplinas de acordo com o curso
CREATE OR REPLACE VIEW v_rel_disciplina_curso AS
  SELECT dc.*
       , d.codigo
       , d.titulo
       , d.carga_horaria
  FROM rel_disciplina_curso dc
     , disciplina           d
  WHERE dc.id_disciplina = d.id_disciplina;