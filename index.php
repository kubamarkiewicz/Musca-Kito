<?php

/* Front Controller */

// use App\Kuba;
use MuscaKit\DB;
use MuscaKit\Router;

require_once 'protected/config.php';

$db = new DB(HOST, USER, PASSWORD, DB_NAME);
// $i18n = new Musca_I18n(LANGS, $db);
// $template = new Musca_Smarty($i18n);
// $config = new Musca_Config($db);

$router = new Router($db, $i18n, $template, $config);
$router->ignite($_SERVER['REQUEST_URI']);
