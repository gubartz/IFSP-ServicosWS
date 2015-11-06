<?php
namespace Controllers;
use Helpers\helpers;
use \PDO;

class NotasController extends BaseController {
  
  public function index(){

    $sth = $this->db->prepare("SELECT t.id_usuario,
                                      t.id_disciplina,
                                      t.nome_disciplina,
                                      t.descricao_avaliacao,
                                      t.data_avaliacao,
                                      t.nota,
                                      t.peso
                              FROM    vrel_avaliacaoturma_aluno t
                              WHERE   t.id_disciplina = :id_disciplina AND
                                      t.id_usuario    = :id_usuario");

    $sth->bindParam(':id_usuario', $this->idUsuario);
    $sth->bindParam(':id_disciplina', $this->idDisciplina);

    $sth->execute();

    helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
  }
}