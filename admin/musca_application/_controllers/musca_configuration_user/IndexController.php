<?php

	class IndexController extends App_Controller
	{
		protected $modul = 'musca_configuration_user';
		protected $module_title = 'Configuration';
		
		function indexAction()
		{
			$amConfigurationUser = new Model_Musca_ConfigurationUser($this->db);
			if (!empty($_POST))
			{
				$amConfigurationUser->save($_POST);
				$this->template->assign('saved', true);
			}
			$elem = $amConfigurationUser->get();

			$this->template->assign('elem', $elem);
			$this->output($this->modul.'/index.tpl', 1);
		}

	}
