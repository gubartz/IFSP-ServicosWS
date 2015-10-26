<?php
$app->get("/", "Controllers\BaseController:index");

$app->get("/disciplina", "Controllers\DisciplinaController:index");