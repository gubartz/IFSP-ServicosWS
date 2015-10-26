<?php
namespace Controllers;
use Slim\Slim as Slim;
use Lib\DB;

class BaseController {

  public    $app;
  protected $db;

  function __construct() {
    $this->app = Slim::getInstance();
    $db        = new DB();
    $this->db  = $db->connect();
  }
}