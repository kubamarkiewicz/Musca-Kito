<?php

	/* modified 2013.10.17 */

	class Model_Sandbox extends App_Model
	{
		public $table = 'sandbox';
		public $fields = array(
							'image' => array(
								'type' => 'image',
								'dir' => '/sandbox',
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
						'dir' => '/sandbox/gallery',
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
