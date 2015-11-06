<?php
$app->post("/", "Controllers\BaseController:index");

$app->post("/medias", "Controllers\DisciplinaController:index");

$app->post("/notasIndividuais", "Controllers\NotasController:index");

$app->post("/usuario/login", "Controllers\UsuarioController:login");