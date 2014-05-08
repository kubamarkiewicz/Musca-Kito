<?php

	class Index extends App_Controller
	{

		function first($param=null)
		{
			if ($param) $this->error();
			$this->smarty->assign('section', 'home');
			$this->smarty->display('home.tpl');
		}

	}