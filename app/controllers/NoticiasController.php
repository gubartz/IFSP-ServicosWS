<?php
namespace Controllers;
use Helpers\helpers;
use \PDO;

class NoticiasController extends BaseController {

  public function listar(){
    $sth = $this->db->prepare("SELECT id_noticia,
                                      titulo,
                                      corpo
                               FROM   noticia");

    $sth->execute();

    helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
  }
}