<?php

	class Index extends App_Controller
	{
		protected $modul = 'musca_configuration_user';
		protected $module_title = 'Configuration';
		
		function first()
		{
			$amConfigurationUser = new Model_Musca_ConfigurationUser($this->db);
			if (!empty($_POST))
			{
				$amConfigurationUser->save($_POST);
				$this->smarty->assign('saved', true);
			}
			$elem = $amConfigurationUser->get();

			$this->smarty->assign('elem', $elem);
			$this->output($this->modul.'/index.tpl', 1);
		}

	}
