<?php
namespace Controllers;
use Helpers\helpers;
use \PDO;

class NotasController extends BaseController {
  
  public function listarNotasTurmaDisciplina(){

    $sth = $this->db->prepare("SELECT *
                               FROM vrel_aluno_turma_curso_disciplina
                               WHERE id_turma_disciplina = :id_turma_disciplina AND
                                     id_usuario          = :id_usuario");

    $id_usuario = $this->app->request->post('id_usuario');
    $sth->bindParam(':id_usuario', $id_usuario);

    $id_turma_disciplina = $this->app->request->post('id_turma_disciplina');
    $sth->bindParam(':id_turma_disciplina', $id_turma_disciplina);

    $sth->execute();

    helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
  }

  public function mediaFinalAlunoTurmaDisciplina(){

    $sth = $this->db->prepare("SELECT * 
                               FROM vrel_aluno_turma_nota_final
                               WHERE semestre   = :semestre AND
                                     id_usuario = :id_usuario");

    $id_usuario = $this->app->request->post('id_usuario');
    $sth->bindParam(':id_usuario', $id_usuario);

    $semestre = $this->app->request->post('semestre');
    $sth->bindParam(':semestre', $semestre);

    $sth->execute();

    helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
  }  
}