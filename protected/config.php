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
		define('DB_NAME', 'musca');
		define('PRE', ''); // table prefix

	// directories relative to the front controller (index.php)
		define('UPLOADS_DIR', '/uploads');

	// error reporting
		define('DEBUG_MODE', true);

	// languages activated in the app, ISO values seperated by coma eg. 'en,es,pl'. first language is the default.
		define('LANGS', 'en,es');







	/* AUTO-CONFIGURATION  ********************************************************/

							
		define('MUSCA_PATH', dirname(__DIR__)); // local server path of the front controller eg. "/compo/newsite"
		define('MUSCA_URL', ((@$_SERVER["HTTPS"] == "on") ? "https://" : "http://") . $_SERVER['HTTP_HOST'].rtrim(dirname($_SERVER['SCRIPT_NAME']), '/'));	// URL of the front controller (index.php) eg. "http://www.compo.org/learning-center"
		
		define('PROTECTED_PATH', __DIR__);
		define('APP_PATH', PROTECTED_PATH.'/app');
		define('TEMPLATES_PATH', APP_PATH.'/Templates');
		define('STORAGE_PATH', PROTECTED_PATH.'/storage');

		define('MD5_SALT', md5(MUSCA_PATH));
		define('CAPSULE', md5(MUSCA_PATH));



	// AUTOLOAD
		require_once __DIR__.'/vendor/autoload.php';
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

