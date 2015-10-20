<?php

/* Front Controller */

require_once 'protected/config/config.php';

// $db = new MuscaKit\DB(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule;
$capsule->addConnection([
	'driver'	=> 'mysql',
	'username'	=> DB_USER,
	'password'	=> DB_PASSWORD,
	'database'	=> DB_NAME,
    'prefix'    => DB_PREFIX,
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci'
]);
$capsule->setAsGlobal();
$capsule->bootEloquent();

$i18n = new MuscaKit\I18n(LANGS, $db);
$view = new MuscaKit\Smarty($i18n);
$config = new MuscaKit\Config($db);

$router = new MuscaKit\Router($db, $i18n, $view, $config);
$router->ignite($_SERVER['REQUEST_URI']);
