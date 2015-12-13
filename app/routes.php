<?php
$app->post("/", "Controllers\BaseController:index");

$app->post("/noticia/listar", "Controllers\NoticiasController:listar");

$app->post("/telefone/listarPorArea", "Controllers\TelefonesController:listarPorArea");

$app->post("/data/listarProximasAvaliacoes", "Controllers\DataController:listarProximasAvaliacoes");

$app->post("/usuario/login", "Controllers\UsuarioController:login");

$app->post("/notas/mediaFinalAlunoTurmaDisciplina", "Controllers\NotasController:mediaFinalAlunoTurmaDisciplina");

$app->post("/notas/listarSemestresDoAluno", "Controllers\NotasController:listarSemestresDoAluno");

$app->post("/notas/listarNotasTurmaDisciplina", "Controllers\NotasController:listarNotasTurmaDisciplina");