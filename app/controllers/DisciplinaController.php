<?php
class DisciplinaController extends BaseController {
	public function index(){
		$sth = $this->db->prepare("SELECT * FROM disciplina");
		$sth->execute();

		$this->app->response->headers->set('Content-Type', 'application/json');
		
		echo json_encode($sth->fetchAll(PDO::FETCH_OBJ));
	}
}