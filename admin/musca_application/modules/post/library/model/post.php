<?php

	class Model_Post extends App_Model
	{
		public $table = 'post';
		public $fields = array(
							'image' => array(
								'type' => 'image',
								'dir' => '/post',
								'width' => '200',
								'height' => '160',
								'crop' => true,
								'thumbnail' => array(
									'width' => '100',
									'height' => '80',
									'crop' => true
								)
							)
						);
		public $gallery = array(
						'dir' => '/post/gallery',
						'width' => '500',
						'height' => '500',
						'crop' => true,
						'thumbnail' => array(
							'width' => '100',
							'height' => '80',
							'crop' => true
						)
					);


		/* defaul values goes here */
		function _new()
		{
			$elem = array();
			$elem['date'] = date("Y-m-d");
			return $elem;
		}


	}
