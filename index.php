<?php

/* Front Controller */

require_once 'protected/config.php';

$db = new MuscaKit\DB(HOST, USER, PASSWORD, DB_NAME);
$i18n = new MuscaKit\I18n(LANGS, $db);
$view = new MuscaKit\Smarty($i18n);
$config = new MuscaKit\Config($db);

$router = new MuscaKit\Router($db, $i18n, $view, $config);
$router->ignite($_SERVER['REQUEST_URI']);
