<?php

	/* modified 2014.07.03 */

	require_once('Smarty/Smarty.class.php');

	class Musca_Smarty extends Smarty
	{
		public $i18n;

		function __construct($i18n=null)
		{
			$this->i18n = $i18n;

			parent::__construct();

			// SMARTY CONFIG --------------------------- >>
// 				$this->caching = false;
// 				$this->force_compile = false;
// 				$this->compile_check = false;
// 				$this->compile_id = $this->lang;
	            $this->error_reporting = DEBUG_MODE;

				$this->template_dir = MUSCA_PATH . APP_DIR . TEMPLATES_DIR . DS;
				$this->compile_dir = MUSCA_PATH . APP_DIR . STORAGE_DIR . DS . 'compile' . DS;
				$this->cache_dir = MUSCA_PATH . APP_DIR . STORAGE_DIR . DS . 'cache' . DS;
			// ------------------------------------------- >>


			// DEFINE PATHS --------- >>
				$this->assign('musca_url', MUSCA_URL);
				$this->assign('uploads_dir', UPLOADS_DIR);
			// ------------------------------------ >>

			// i18n	
			if ($this->i18n)
			{
				$this->assign('langs', $this->i18n->getLangs());
				$this->assign('lang', $this->i18n->getLang());
			}

		}

	}
