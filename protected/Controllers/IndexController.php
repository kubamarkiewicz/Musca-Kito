<?php
namespace Controllers;

use MuscaKit\Controller;

class IndexController extends Controller
{

	public function index($param=null)
	{
		$this->view->assign('param', $param);
		$this->view->assign('section', 'home');
		$this->view->display('home.tpl');
	}

	public function contact()
	{
		$this->view->assign('section', 'contact');
		$this->view->display('contact.tpl');
	}

}