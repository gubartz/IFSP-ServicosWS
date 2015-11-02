<?php
namespace Controllers;
use Slim\Slim as Slim;
use Lib\DB;

class BaseController {
  protected $app;
  protected $db;
  protected $headers;
  protected $idUsuario;

  function __construct() {
    $this->app     = Slim::getInstance();
    $db            = new DB();
    $this->db      = $db->connect();
    $this->headers = getallheaders();

    if(isset($this->headers['usuario'])){
    	$this->idUsuario = $this->headers['usuario'];	
    }else{
    	$this->idUsuario = null;
    }
  }
}