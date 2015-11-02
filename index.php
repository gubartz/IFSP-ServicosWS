<?php
require 'vendor/autoload.php';
use Auth\Auth;

$headers = getallheaders();

$app = new \Slim\Slim();
$app->add(new Auth($headers));

require_once 'app/routes.php';

$app->run();