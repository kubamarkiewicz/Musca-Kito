<?php

	/**
	 *	Musca configuration 
	 *
	 *	Paths convention: paths start with slash, end without slash eg.: /your/localpath, /your/url
	 */

	// debugging
		define('DEBUG_MODE', true);

	// upload directory relative to MUSCA_PATH
		define('UPLOADS_DIR', '/../uploads');
	
	// languages activated, ISO values seperated by coma eg. 'en,es,pl'. first language is the default.
		define('LANGS', 'en, es');


	require_once "db.php";
	require_once "autoconfig.php";
	