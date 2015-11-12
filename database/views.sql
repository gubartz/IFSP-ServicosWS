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

#Mantém todas as médias finais por turma
CREATE OR REPLACE VIEW vrel_aluno_turma_nota_final AS
SELECT u.nome
     , u.id_usuario
		 , d.codigo 
		 , d.titulo 
		 , b.semestre 
		 , b.ano
		 , s.media_final
		 , si.descricao
FROM rel_turma_disciplina       a 
	 , turma                      b 
	 , rel_aluno_turma_disciplina c 
	 , usuario                    u 
	 , disciplina                 d
	 , rel_situacao_aluno_turma   s
	 , situacao                   si    
WHERE a.id_turma                  = b.id_turma 
  AND a.id_turma_disciplina       = c.id_turma_disciplina 
  AND c.id_usuario                = u.id_usuario 
  AND a.id_disciplina             = d.id_disciplina
  AND s.id_aluno_turma_disciplina = c.id_aluno_turma_disciplina
  AND s.id_situacao               = si.id_situacao;

#Mantém as disciplinas de acordo com o curso
CREATE OR REPLACE VIEW v_rel_disciplina_curso AS
  SELECT dc.*
       , d.codigo
       , d.titulo
       , d.carga_horaria
  FROM rel_disciplina_curso dc
     , disciplina           d
  WHERE dc.id_disciplina = d.id_disciplina;