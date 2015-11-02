<?php
namespace Lib;
use \PDO;

class DB{
	private $conn;

	public function connect(){
		require_once __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'config' . DIRECTORY_SEPARATOR . 'config.php';

		$dsn = 'mysql:host=' . DB_HOST . ';dbname=' . DB_DATABASE . ';charset=utf8';
		try{
			$this->conn = new PDO($dsn, DB_USER, DB_PASSWORD);
			$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		}catch (PDOException $e) {
    	echo 'Connection failed: ' . $e->getMessage();
		}

		return $this->conn;
	}
}