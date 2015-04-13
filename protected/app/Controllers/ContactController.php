<?php
namespace App\Controllers;

use MuscaKit\Controller as BaseController;

class ContactController extends BaseController
{

	public function indexAction()
	{
		$this->view->display('contact.tpl');
	}

}