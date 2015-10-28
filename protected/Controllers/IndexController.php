<?php
namespace Controllers;

use MuscaKit\Controller;
use Illuminate\Database\Capsule\Manager as Capsule;
use Models\NewsModel;
use Illuminate\Database\Connection as DB;

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

	public function eloquent()
	{
		// Capsule::schema()->create('news', function($table)
		// {
		//    $table->increments('id');
		//    $table->string('title');
		// });
		// NewsModel::create(['title' => 'Wii U']);

		// print_r(NewsModel::first()->toArray());

		$news = NewsModel::first();
		print_r($news);
		$news->title = 'Playstation 4';
		$news->save();
		print_r(NewsModel::first()->toArray());
	}

	public function eloquent2()
	{
		$newsModel = new NewsModel();
		echo $newsModel->kuba();
		exit;
		$news = DB::select('select * from c21_news' );
		print_r($news);
	}

}