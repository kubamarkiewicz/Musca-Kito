<?php


	/**
	 *	Musca App configuration 
	 *
	 *	All constants are defined here.
	 *	A rule of thumb for paths and URLs is: start with slash, end without slash eg.: /your/localpath, /your/url
	 */



	/* USER SETTINGS - EDIT BELOW ****************************************************/


	// DATABASE CONNECTION  
		define('HOST', 'localhost');
		define('USER', 'root');
		define('PASSWORD', 'root');
		define('DB_NAME', 'inplus');
		define('PRE', 'c19_'); // table prefix

	// languages activated, ISO values seperated by coma eg. 'en,es,pl'. first language is the default.
		define('LANGS', 'pl');

	// debugging
		define('DEBUG_MODE', true);

		define('UPLOADS_DIR', '/uploads');



	/* AUTO-CONFIGURATION  ********************************************************/

							
		define('MUSCA_PATH', dirname(__DIR__)); // website local path on the server
		define('MUSCA_URL', ((@$_SERVER["HTTPS"] == "on") ? "https://" : "http://") . $_SERVER['HTTP_HOST'].rtrim(dirname($_SERVER['SCRIPT_NAME']), '/'));	// full website URL
		
		define('PROTECTED_PATH', __DIR__);
		define('STORAGE_PATH', PROTECTED_PATH.'/storage');
		define('MODULES_PATH', PROTECTED_PATH.'/Modules');

		define('CONTROLLERS_DIR', '/Controllers');
		define('VIEWS_DIR', '/views');


	// AUTOLOAD
		require_once 'vendor/autoload.php';
	// ------------------------------------- >>


	// error reporting
		if (DEBUG_MODE) 
		{
			ini_set('display_errors', 1);
			error_reporting(E_ALL ^ E_NOTICE);
		}
		else error_reporting(0);
	// ------------------------------------- >>

		
	// error log
		ini_set('log_errors', 1);
		ini_set('error_log', STORAGE_PATH.'/log.txt');
	// ------------------------------------- >>


	// SESSION
		session_cache_limiter('nocache');
    	session_start();
	// ------------------------------------- >>

