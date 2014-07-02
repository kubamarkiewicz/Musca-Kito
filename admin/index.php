<?php

	/* Musca Front Controller */

	require_once 'musca_application/config.php';

	$db = new Musca_DB(HOST, USER, PASSWORD, DB_NAME);
	$i18n = new Musca_I18n(ADMIN_LANGS, $db, true);
	$auth = new Logic_Auth();
	$dispatcher = new Musca_Dispatcher($db, $i18n, $auth);
	$dispatcher->ignite($_SERVER['REQUEST_URI']);
