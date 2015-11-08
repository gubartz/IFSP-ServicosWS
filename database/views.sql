#Criando as views, de forma a trazer a informação de uma forma visivelmente útil
CREATE OR REPLACE VIEW vrel_aluno_turma_curso_disciplina AS
  SELECT c.titulo     AS curso
       , u.nome       AS usuario
       , u.id_usuario
       , u.ra      
       , d.id_disciplina
       , d.titulo       AS disciplina
       , d.codigo
       , ata.nota
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