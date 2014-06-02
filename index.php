<?php

	/* Musca App Front Controller */

	require_once 'musca_application/config.php';

	$db = new Musca_DB(HOST, USER, PASSWORD, DB_NAME);
	$i18n = new Musca_I18n(LANGS, $db);
	$dispatcher = new Musca_Dispatcher($db, $i18n);
	$dispatcher->ignite($_SERVER['REQUEST_URI']);

