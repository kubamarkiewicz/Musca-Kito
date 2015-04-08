<?php

/* Front Controller */

require_once 'protected/config.php';

$db = new MuscaKit\DB(HOST, USER, PASSWORD, DB_NAME);
// $i18n = new Musca_I18n(LANGS, $db);
// $template = new Smarty($i18n);
$template = new MuscaKit\Smarty($i18n);
$config = new MuscaKit\Config($db);

$router = new MuscaKit\Router($db, $i18n, $template, $config);
$router->ignite($_SERVER['REQUEST_URI']);
