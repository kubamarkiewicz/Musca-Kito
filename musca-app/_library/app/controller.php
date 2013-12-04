<?php

	class App_Controller extends Musca_Controller
	{

		function __construct($db=null, $i18n=null)
		{
			parent::__construct($db, $i18n);

			// get menu items
			$model = new Model_Page($this->db, $this->i18n->getCurrentLang());
			$this->smarty->assign('menuItems', $model->getMenuItems());
		}
	}
