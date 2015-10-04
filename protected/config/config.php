<?php


	/**
	 *	Musca configuration 
	 *
	 *	Convention: paths start with slash and end without slash eg.: /your/localpath, /your/url
	 */


	// DATABASE CONNECTION  
		define('DB_HOST', 'localhost');
		define('DB_USER', 'root');
		define('DB_PASSWORD', 'root');
		define('DB_NAME', 'musca');
		define('DB_PRE', 'c21_'); // table prefix

	// debugging
		define('DEBUG_MODE', true);

	// upload directory relative to MUSCA_PATH
		define('UPLOADS_DIR', '/../uploads');
	
	// languages activated, ISO values seperated by coma eg. 'en,es,pl'. first language is the default.
		define('LANGS', 'en, es');


	require "autoconfig.php";