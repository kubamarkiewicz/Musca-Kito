<?php

	class Model_Product extends App_Model
	{
		public $table = 'product';
		public $sortBy = 'pos';
		public $fieldsConfig = array(
							'image' => array(
								'type' => 'image',
								'dir' => '/product',
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
		public $galleryConfig = array(
						'dir' => '/product/gallery',
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
			$elem['enabled'] = 1;
			$elem['date'] = date("Y-m-d");
			return $elem;
		}


	}
