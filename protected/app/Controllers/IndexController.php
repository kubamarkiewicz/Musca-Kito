<?php
namespace App\Controllers;

use MuscaKit\Controller as BaseController;

class IndexController extends BaseController
{

	public function indexAction($param=null)
	{
		// exit('hello world!');
		$this->template->assign('param', $param);
		$this->template->assign('section', 'home');
		$this->template->display('home.tpl');
	}

	public function contactAction()
	{
		$this->template->display('contact.tpl');
	}

}