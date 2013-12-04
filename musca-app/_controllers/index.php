<?php

	class Index extends App_Controller
	{

		function first()
		{
			// load page controller
			if ($args = func_get_args()) 
			{
				require_once MUSCA_PATH.APP_DIR.CONTROLLERS_DIR."/page.php";
				$controller = new Page($this->db, $this->i18n);
				return call_user_func_array(array($controller, 'first'), $args);
			}

			$this->smarty->display('index.tpl');
		}


	}