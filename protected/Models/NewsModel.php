<?php
namespace Models;

use Illuminate\Database\Eloquent\Model as Eloquent;

class NewsModel extends Eloquent 
{
	protected $table = 'news';
	protected $fillable = ['title'];
	public $timestamps = false;

	public function kuba()
	{
		$news = NewsModel::first();
		print_r($news);
		var_dump($this);
		return 'kuba';
	}
}