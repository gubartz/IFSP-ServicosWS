<?php
namespace Controllers;
use Helpers\helpers;
use \PDO;

class NotasController extends BaseController {
  
  public function mediaFinalAlunoTurmaDisciplina(){

    $sth = $this->db->prepare("SELECT id_usuario,
                                      id_disciplina,
                                      codigo_disciplina,
                                      descricao_disciplina,
                                      frequencia,
                                      descricao_situacao,
                                      media_final,
                                      semestre,
                                      ano
                               FROM   vrel_disciplin_situacao_media_final
                               WHERE  semestre   = :semestre AND
                                      ano        = :ano      AND
                                      id_usuario = :id_usuario");

    $id_usuario = $this->app->request->post('id_usuario');
    $sth->bindParam(':id_usuario', $id_usuario);

    $semestre = $this->app->request->post('semestre');
    $sth->bindParam(':semestre', $semestre);

    $ano = $this->app->request->post('ano');
    $sth->bindParam(':ano', $ano);

    $sth->execute();

    helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
  }

  public function listarSemestresDoAluno(){

    $sth = $this->db->prepare("select *
                               from   vsemestres_cursados_aluno
                               where  id_usuario = :id_usuario
                               group by ano, semestre");

    $id_usuario = $this->app->request->post('id_usuario');
    $sth->bindParam(':id_usuario', $id_usuario);

    $sth->execute();

    helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
  }

  public function listarNotasTurmaDisciplina(){

    $sth = $this->db->prepare("select descricao_avaliacao,
                                      date_format(data_avaliacao,'%d/%m/%Y') data_avaliacao,
                                      nota_avaliacao,
                                      peso_avaliacao
                               from vrel_aluno_turma_nota_avaliacao
                               where id_usuario    = :id_usuario AND
                                     id_disciplina = :id_disciplina");

    $id_usuario = $this->app->request->post('id_usuario');
    $sth->bindParam(':id_usuario', $id_usuario);

    $id_disciplina = $this->app->request->post('id_disciplina');
    $sth->bindParam(':id_disciplina', $id_disciplina);

    $sth->execute();

    helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
  }

}