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

    if(isset($this->headers['Usuario'])){
    	$this->idUsuario = $this->headers['Usuario'];	
    }else{
    	$this->idUsuario = null;
    }
  }
}