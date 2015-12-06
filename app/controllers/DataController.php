<?php
namespace Controllers;
use Helpers\helpers;
use \PDO;

class DataController extends BaseController {
  
  public function listarProximasAvaliacoes(){

    $sth = $this->db->prepare("select descricao_disciplina,
                                      descricao_avaliacao,
                                      date_format(data_avaliacao,'%d/%m/%Y') data_avaliacao,
                                      data_avaliacao - curdate() dias_restantes
                               from   vrel_aluno_turma_nota_final
                               where  id_usuario    = :id_usuario and
                                      data_avaliacao > curdate()");

    $id_usuario = $this->app->request->post('id_usuario');
    $sth->bindParam(':id_usuario', $id_usuario);

    $sth->execute();

    helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
  }


}