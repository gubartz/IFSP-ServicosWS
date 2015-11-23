<?php
$app->post("/", "Controllers\BaseController:index");

$app->post("/disciplina/listar", "Controllers\DisciplinaController:listar");

$app->post("/noticia/listar", "Controllers\NoticiasController:listar");

$app->post("/disciplina/listarDisciplinaPorCurso", "Controllers\DisciplinaController:listarDisciplinaPorCurso");

$app->post("/notas/listarNotasTurmaDisciplina", "Controllers\NotasController:listarNotasTurmaDisciplina");

$app->post("/usuario/login", "Controllers\UsuarioController:login");

$app->post("/notas/mediaFinalAlunoTurmaDisciplina", "Controllers\NotasController:mediaFinalAlunoTurmaDisciplina");