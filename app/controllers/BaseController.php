<?php
namespace Controllers;
use Slim\Slim as Slim;
use Lib\DB;

class BaseController {
  protected $app;
  protected $db;
  protected $headers;
  protected $idUsuario;
  protected $idDisciplina;

  function __construct() {
    $this->app     = Slim::getInstance();
    $db            = new DB();
    $this->db      = $db->connect();
    $this->headers = getallheaders();

    if(isset($this->headers['Usuario'])){
    	$this->idUsuario = $this->headers['Usuario'];	
    }else{
    	$this->idUsuario = null;
    }

    if(isset($this->headers['Disciplina'])){
      $this->idDisciplina = $this->headers['Disciplina']; 
    }else{
      $this->idDisciplina = null;
    }
  }
}