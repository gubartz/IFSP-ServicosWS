<?php
namespace Controllers;
use Helpers\helpers;
use \PDO;

class UsuarioController extends BaseController {
	
	public function index(){
		$sth = $this->db->prepare("SELECT * FROM disciplina");
		$sth->execute();

		helpers::jsonResponse(false, 'results', $sth->fetchAll(PDO::FETCH_OBJ));
	}

	public function login(){
		$sth = $this->db->prepare("SELECT ra
			                              , id_usuario
			                         FROM usuario 
			                         WHERE ra = :usuario
			                           AND senha = :senha"
			                       );

		$usuario = $this->app->request->post('usuario');
		$senha   = $this->app->request->post('senha');

		$sth->bindParam(':usuario', $usuario);
		$sth->bindParam(':senha', $senha);

		$sth->execute();

		$result = $sth->fetchAll(PDO::FETCH_OBJ);

		if(!empty($result)){
			$token = $this->generateToken();
			$result[0]->token = $token;

			$this->updateToken($usuario, $senha, $token);

			helpers::jsonResponse(false, 'results', $result);	
		}else{
			helpers::jsonResponse(true, 'Usuário e senha incorretos.');			
		}
	}

	private function updateToken($usuario, $senha, $token){
		$sth = $this->db->prepare("UPDATE usuario 
			                         SET token = :token
			                         WHERE ra    = :usuario
			                           AND senha = :senha"
			                       );
		
		$sth->bindParam(':token', $token);
		$sth->bindParam(':usuario', $usuario);
		$sth->bindParam(':senha', $senha);

		$sth->execute();
	}

	private function generateToken(){
		return bin2hex(openssl_random_pseudo_bytes(16));
	}

	public function register(){
		
	}
}