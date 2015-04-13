<?php
namespace App\Controllers;

use MuscaKit\Controller as BaseController;
use App\Models\TestModel;

class IndexController extends BaseController
{

	public function indexAction($param=null)
	{
		$this->view->assign('param', $param);
		$this->view->assign('section', 'home');
		$this->view->display('home.tpl');
	}

	public function testAction()
	{
		$model = new TestModel();
		echo $model->sayHi();
	}

}