<?php

	class Page extends App_Controller
	{

		function first()
		{
			$args = func_get_args();
			$url = implode('/', $args);

			$model = new Model_Page($this->db, $this->i18n->getCurrentLang());
			$page = $model->getPageByUrl($url);
			if (!$page) $this->error();

			// print_r($page);
			$this->smarty->assign('page', $page);
			
			// meta tags
			$this->smarty->assign('title', $page['name']);
			$this->smarty->assign('description', $page['intro']);

			$this->smarty->display('page.tpl');
		}

	}