<?php


	/**
	 *	Musca App configuration 
	 *
	 *	All constants are defined here.
	 *	Convention for Paths and URLs is: with trailing slash & without final slash eg. /your/path
	 */



	/* USER SETTINGS - EDIT BELOW ****************************************************/


	// DATABASE CONNECTION  
		define('HOST', 'localhost');
		define('DB_NAME', 'musca');
		define('USER', 'root');
		define('PASSWORD', '');

	// directories relative to the front controller (index.php)
		define('MUSCA_LIBRARY_DIR', '/../musca-library');
		define('CONTENT_DIR', '/../content');

	// error reporting
		define('DEBUG_MODE', true);

	// languages activated in the app, ISO values seperated by coma eg. 'en,es,pl'. first language is the default.
		define('LANGS', 'en,es,pl');

	// configuration of administration panel 
		define('ADMIN', true);
		define('TRANSLATIONS_LANGS', 'en,es,pl');




	/* AUTO-CONFIGURATION - BE CAREFUL  ********************************************************/

							
		define('MUSCA_URL', ((@$_SERVER["HTTPS"] == "on") ? "https://" : "http://") . $_SERVER['HTTP_HOST'].rtrim(dirname($_SERVER['SCRIPT_NAME']), '/'));	// URL of the front controller (index.php) eg. "http://www.compo.org/learning-center"
		define('MUSCA_PATH', dirname(dirname(__FILE__))); // local server path of the front controller eg. "/compo/newsite"

		define('DS', DIRECTORY_SEPARATOR);
		define('APP_DIR', strrchr(dirname(__FILE__), DS));
		define('CONTROLLERS_DIR', '/_controllers');
		define('LIBRARY_DIR', '/_library');
		define('TEMPLATES_DIR', '/_templates');
		define('MODULES_DIR', '/modules');

		define('MD5_SALT', md5(MUSCA_PATH));
		define('CAPSULE', md5(MUSCA_PATH));


	// include path
		set_include_path(
			'.'
			. PATH_SEPARATOR . MUSCA_PATH . MUSCA_LIBRARY_DIR . DS
			. PATH_SEPARATOR . MUSCA_PATH . APP_DIR . LIBRARY_DIR . DS
		);
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
		ini_set('error_log', MUSCA_PATH.APP_DIR.'/log.txt');
	// ------------------------------------- >>


	// AUTOLOAD
	    spl_autoload_register(null, false);
	    spl_autoload_extensions('.php');
	    function classLoader($class)
		{
			if (substr($class, 0, 15) == "Smarty_Internal")
			{
				$class = "Smarty/sysplugins/" . strtolower($class);
				require_once $class . ".php";
			}
			else require_once str_replace('_','/',strtolower($class)).'.php';
		}
	    spl_autoload_register('classLoader');
	// ------------------------------------- >>


	// SESSION
		session_cache_limiter('nocache');
    	session_start();
	// ------------------------------------- >>



?>
