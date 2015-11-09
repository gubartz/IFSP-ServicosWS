<?php
namespace Controllers;
use Helpers\helpers;
use \PDO;

class DisciplinaController extends BaseController {
	
	public function listar(){
		$sth = $this->db->prepare("SELECT * 
                               FROM disciplina");

		$sth->execute();

		helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
	}

	public function listarDisciplinaPorCurso(){
		$sth = $this->db->prepare("SELECT * 
                               FROM v_rel_disciplina_curso
                               WHERE id_curso = :id_curso");

    $id_curso = $this->app->request->post('id_curso');
    $sth->bindParam(':id_curso', $id_curso);

		$sth->execute();

		helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));		
	}
}