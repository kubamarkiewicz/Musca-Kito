<?php

	class Model_BannerHomeSmall extends Musca_Model
	{
		public $table = 'banner_home_small';

		function getAll()
		{
			$sql = "SELECT * FROM $this->table WHERE enabled=1 ORDER BY RAND() LIMIT 2";
			$result = $this->db->getAll($sql);
			return $result;
		}
	
	}
