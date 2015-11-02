<?php
$app->post("/", "Controllers\BaseController:index");

$app->post("/disciplina", "Controllers\DisciplinaController:index");

$app->post("/usuario/login", "Controllers\UsuarioController:login");