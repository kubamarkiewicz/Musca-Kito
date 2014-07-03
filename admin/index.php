<?php

	/* Front Controller */

	require_once 'musca_application/config.php';

	$db = new Musca_DB(HOST, USER, PASSWORD, DB_NAME);
	$i18n = new Musca_I18n(ADMIN_LANGS, $db);
	$template = new Musca_Smarty($i18n);
	$config = new Musca_Config($db);
	$auth = new Logic_Auth();

	$dispatcher = new Musca_Dispatcher($db, $i18n, $template, $config, $auth);
	$dispatcher->ignite($_SERVER['REQUEST_URI']);
