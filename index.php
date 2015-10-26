<?php
require 'vendor/autoload.php';

$app = new \Slim\Slim();

require_once 'app/routes.php';

$app->run();