<?php
	
	/* modified 2014.06.02 */

	class Musca_Controller
	{

		public $db;
		public $i18n;
		public $template;
		public $config;


		function __construct($db=null, $i18n=null)
		{
        	$this->db = $db;
			$this->i18n = $i18n;

			// SMARTY CONFIG --------------------------- >>
				$this->template = new Musca_Smarty($this->i18n);
// 				$this->template->caching = false;
// 				$this->template->force_compile = false;
// 				$this->template->compile_check = false;
// 				$this->template->compile_id = $this->lang;
	            $this->template->error_reporting = DEBUG_MODE;

				$this->template->template_dir = MUSCA_PATH . APP_DIR . TEMPLATES_DIR . DS;
				$this->template->compile_dir = MUSCA_PATH . APP_DIR . DS . 'compile' . DS;
				$this->template->cache_dir = MUSCA_PATH . APP_DIR . DS . 'cache' . DS;
			// ------------------------------------------- >>

			// DEFINE PATHS --------- >>
				$this->template->assign('musca_url', MUSCA_URL);
				$this->template->assign('content_dir', CONTENT_DIR);
			// ------------------------------------ >>

			// i18n	
			if ($this->i18n)
			{
				$this->template->assign('langs', $this->i18n->getLangs());
				$this->template->assign('lang', $this->i18n->getLang());
			}

			// set controller name as a section by default
			$this->template->assign('section', strtolower(get_class($this)));
			
			$this->config = new Musca_Config($db);
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
		protected function error($message='Page not found.', $title='404', $code='404 Not Found')
		{
			// send HTTP error header
			if ($code) header('HTTP/1.1 '.$code);

			if (!$title) $title = $code;
			if (!file_exists(MUSCA_PATH.APP_DIR.TEMPLATES_DIR.'/error.tpl')) die("<pre>$title\n$message");

			// display error page
			$this->template->assign('message', $message);
			$this->template->assign('title', $title);
			$this->template->assign('section', 'error');
			$this->template->display('error.tpl');
			die();
		}

	}
