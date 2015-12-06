#CriANDo as views, de forma a trazer a informação de uma forma visivelmente útil

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
SELECT usr.id_usuario                    id_usuario,
       usr.nome                          nome_aluno,
       avl.descricao                     descricao_avaliacao,
       dcp.id_disciplina                 id_disciplina,
       dcp.codigo                        codigo_disciplina,
       dcp.titulo                        descricao_disciplina,
       avl.data                          data_avaliacao,
       ata.nota                          nota_avaliacao,
       avl.peso                          peso_avaliacao,
       ats.frequencia                    frequencia,
       sit.descricao                     descricao_situacao,
       sat.media_final                   media_final,
       trm.semestre,
       trm.ano
FROM   rel_avaliacao_turma_disciplina    atd,
       rel_turma_disciplina              tdi,
       rel_aluno_turma_disciplina        ats,
       rel_avaliacao_turma_aluno         ata,
       rel_situacao_aluno_turma          sat,
       usuario                           usr,
       avaliacao                         avl,
       disciplina                        dcp,
       situacao                          sit,
       turma                             trm
where atd.id_avaliacao                  = avl.id_avaliacao                  AND
      atd.id_turma_disciplina           = ats.id_turma_disciplina           AND
      atd.id_avaliacao_turma_disciplina = ata.id_avaliacao_turma_disciplina AND
      atd.id_turma_disciplina           = tdi.id_turma_disciplina           AND
      ats.id_usuario                    = usr.id_usuario                    AND
      ats.id_aluno_turma_disciplina     = sat.id_aluno_turma_disciplina     AND
      sat.id_situacao                   = sit.id_situacao                   AND
      dcp.id_disciplina                 = tdi.id_disciplina                 AND
      ata.id_usuario                    = usr.id_usuario                    AND
      tdi.id_turma                      = trm.id_turma;

#Mantém as disciplinas de acordo com o curso
CREATE OR REPLACE VIEW v_rel_disciplina_curso AS
  SELECT dc.*
       , d.codigo
       , d.titulo
       , d.carga_horaria
  FROM rel_disciplina_curso dc
     , disciplina           d
  WHERE dc.id_disciplina = d.id_disciplina;


CREATE OR REPLACE VIEW vrel_aluno_turma_nota_avaliacao AS
SELECT usr.id_usuario                    id_usuario,
       usr.nome                          nome_aluno,
       avl.descricao                     descricao_avaliacao,
       dcp.id_disciplina                 id_disciplina,
       dcp.codigo                        codigo_disciplina,
       dcp.titulo                        descricao_disciplina,
       avl.data                          data_avaliacao,
       ata.nota                          nota_avaliacao,
       avl.peso                          peso_avaliacao
FROM   rel_avaliacao_turma_disciplina    atd,
       rel_turma_disciplina              tdi,
       rel_aluno_turma_disciplina        ats,
       rel_avaliacao_turma_aluno         ata,
       usuario                           usr,
       avaliacao                         avl,
       disciplina                        dcp
where atd.id_avaliacao                  = avl.id_avaliacao                  AND
      atd.id_turma_disciplina           = ats.id_turma_disciplina           AND
      atd.id_avaliacao_turma_disciplina = ata.id_avaliacao_turma_disciplina AND
      atd.id_turma_disciplina           = tdi.id_turma_disciplina           AND
      ats.id_usuario                    = usr.id_usuario                    AND
      dcp.id_disciplina                 = tdi.id_disciplina                 AND
      ata.id_usuario                    = usr.id_usuario;

CREATE OR REPLACE VIEW vsemestres_cursados_aluno AS
SELECT trm.ano,
       trm.semestre,
       atd.id_usuario
FROM   rel_situacao_aluno_turma      sat,
       rel_aluno_turma_disciplina    atd,
       rel_turma_disciplina          trd,
       turma                         trm
WHERE  sat.id_aluno_turma_disciplina =    atd.id_aluno_turma_disciplina AND
       atd.id_turma_disciplina       =    trd.id_turma_disciplina       AND
       trd.id_turma                  =    trm.id_turma;

CREATE OR REPLACE VIEW vrel_disciplin_situacao_media_final AS
SELECT u.id_usuario
     , di.id_disciplina
     , di.codigo    AS codigo_disciplina
     , di.titulo    AS descricao_disciplina
     , si.descricao AS descricao_situacao
     , s.media_final
     , atd.frequencia
     , tm.semestre
     , tm.ano
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