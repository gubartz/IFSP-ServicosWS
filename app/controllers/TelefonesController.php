<?php
namespace Controllers;
use Helpers\helpers;
use \PDO;

class TelefonesController extends BaseController {

  public function listarPorArea(){
    $sth = $this->db->prepare("SELECT id_telefone, 
    								  local, 
    								  ddd, 
    								  numero,
    								  area
    						   FROM   telefone
    						   WHERE  area = :area");

    $area = $this->app->request->post('area');
    $sth->bindParam(':area', $area);

    $sth->execute();

    helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
  }
}