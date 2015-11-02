<?php
namespace Controllers;
use Helpers\helpers;
use \PDO;

class DisciplinaController extends BaseController {
	
	public function index(){
		$sth = $this->db->prepare("SELECT * 
			                         FROM vrel_aluno_turma_curso_disciplina
			                         WHERE id_usuario = :id_usuario");

		$sth->bindParam(':id_usuario', $this->idUsuario);

		$sth->execute();

		helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
	}
}