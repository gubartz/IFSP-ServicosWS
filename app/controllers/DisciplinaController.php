<?php
namespace Controllers;
use Helpers\helpers;
use \PDO;

class DisciplinaController extends BaseController {
	
	public function index(){
		$sth = $this->db->prepare("SELECT * 
                               FROM   vmedia_aluno_disciplina
			                         WHERE  id_usuario = :id_usuario AND
                                      semestre   = :semestre");

    $id_usuario = $this->app->request->post('id_usuario');
    $semestre = $this->app->request->post('semestre');

    $sth->bindParam(':semestre', $semestre);
    $sth->bindParam(':id_usuario', $id_usuario);

		$sth->execute();

		helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
	}
}