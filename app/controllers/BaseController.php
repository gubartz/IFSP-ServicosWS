<?php
use Slim\Slim as Slim;
use lib\DB;

class BaseController {

  public    $app;
  protected $db;

  function __construct() {
    $this->app = Slim::getInstance();
    $db        = new DB();
    $this->db  = $db->connect();
  }

  public function index() {
    echo json_encode(array('teste', 'teste2'));
  }
}