<?php


	/**
	 *	Musca auto-configuration 
	 *
	 *	Convention: paths start with slash and end without slash eg.: /your/localpath, /your/url
	 */


	define('MUSCA_PATH', dirname(dirname(__DIR__))); // website local path on the server
	define('MUSCA_URL', ((@$_SERVER["HTTPS"] == "on") ? "https://" : "http://") . $_SERVER['HTTP_HOST'].rtrim(dirname($_SERVER['SCRIPT_NAME']), '/'));	// full website URL
	
	define('PROTECTED_PATH', dirname(__DIR__));
	define('TEMP_PATH', PROTECTED_PATH.'/temp');
	define('MODULES_PATH', PROTECTED_PATH.'/Modules');
	
	define('CONTROLLERS_DIR', '/Controllers');
	define('TEMPLATES_DIR', '/templates');


	// AUTOLOAD
		require_once PROTECTED_PATH.'/vendor/autoload.php';
	// ------------------------------------- >>


	// error reporting
		if (DEBUG_MODE) 
		{
			ini_set('display_errors', 1);
			error_reporting(E_ALL ^ E_NOTICE);
		}
		else error_reporting(0);
	// ------------------------------------- >>

		
	// error logging
		ini_set('log_errors', 1);
		ini_set('error_log', TEMP_PATH.'/log.txt');
	// ------------------------------------- >>


	// SESSION
		session_cache_limiter('nocache');
    	session_name(md5(__DIR__));
    	session_set_cookie_params(0);
    	session_save_path(TEMP_PATH.'/session');
    	session_start();
	// ------------------------------------- >>

