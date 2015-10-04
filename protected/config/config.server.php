<?php


	/**
	 *	Musca configuration 
	 *
	 *	Convention: paths start with slash and end without slash eg.: /your/localpath, /your/url
	 */


	// DATABASE CONNECTION  
		define('DB_HOST', 'localhost');
		define('DB_USER', 'marcus_marcus');
		define('DB_PASSWORD', 'k1u2b3a4');
		define('DB_NAME', 'marcus_cms');
		define('DB_PRE', 'c18_'); // table prefix

	// debugging
		define('DEBUG_MODE', true);

	// upload directory relative to MUSCA_PATH
		define('UPLOADS_DIR', '/../uploads');

	// languages activated, ISO values seperated by coma eg. 'en,es,pl'. first language is the default.
		define('LANGS', 'en, es');


	require "autoconfig.php";