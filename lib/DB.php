<?php
namespace lib;
use \PDO;

class DB{
	private $conn;

	public function connect(){
		require_once __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'config' . DIRECTORY_SEPARATOR . 'config.php';

		$dsn = 'mysql:host=' . DB_HOST . ';dbname=' . DB_DATABASE . ';charset=utf8';
		$this->conn = new PDO($dsn, DB_USER, DB_PASSWORD);

		return $this->conn;
	}
}