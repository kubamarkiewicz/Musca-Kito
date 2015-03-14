<?php

	class IndexController extends BaseController
	{

		function indexAction($param=null)
		{
			$this->template->assign('param', $param);
			$this->template->assign('section', 'home');
			$this->template->display('home.tpl');
		}

		function contactAction()
		{
			$this->template->display('contact.tpl');
		}

	}