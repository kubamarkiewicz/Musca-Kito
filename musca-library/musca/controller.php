<?php

	/* modified 2013.11.23 */

	class Musca_Controller
	{

		public $smarty;
		public $db;
		public $i18n;
		public $config;


		function __construct($db=null, $i18n=null)
		{
        	$this->db = $db;
			$this->i18n = $i18n;

			// SMARTY CONFIG --------------------------- >>
				$this->smarty = new Musca_Smarty($this->i18n);
// 				$this->smarty->caching = false;
// 				$this->smarty->force_compile = false;
// 				$this->smarty->compile_check = false;
// 				$this->smarty->compile_id = $this->lang;
	            $this->smarty->error_reporting = DEBUG_MODE;

				$this->smarty->template_dir = MUSCA_PATH . APP_DIR . TEMPLATES_DIR . DS;
				$this->smarty->compile_dir = MUSCA_PATH . APP_DIR . DS . 'compile' . DS;
				$this->smarty->cache_dir = MUSCA_PATH . APP_DIR . DS . 'cache' . DS;
			// ------------------------------------------- >>

			// DEFINE PATHS --------- >>
				$this->smarty->assign('musca_url', MUSCA_URL);
				$this->smarty->assign('content_dir', CONTENT_DIR);
			// ------------------------------------ >>

			// i18n	
				$this->smarty->assign('langs', $this->i18n->getLangs());
				$this->smarty->assign('lang', $this->i18n->getCurrentLang());

			// set controller name as a section by default
			$this->smarty->assign('section', strtolower(get_class($this)));
			
			$this->config = new Musca_Utils_Config($db);
		}
		

		
	
		protected function redirect($location='/')
		{
			header('location: '.MUSCA_URL.$location);
			die();
		}



		/* 
		 * send HTTP error header & display error page & die 
		 * find more errors codes here: http://krisjordan.com/php-class-for-http-response-status-codes
		 */ 
		function error($message='Ain\'t no page at this address, captain!', $title='404', $code='404 Not Found')
		{
			// send HTTP error header
			if ($code) header('HTTP/1.1 '.$code);

			if (!$title) $title = $code;
			if (!file_exists(MUSCA_PATH.APP_DIR.TEMPLATES_DIR.'/error.tpl')) die("<pre>$title\n$message");

			// display error page
			$this->smarty->assign('message', $message);
			$this->smarty->assign('title', $title);
			$this->smarty->display('error.tpl');
			die();
		}

	}
