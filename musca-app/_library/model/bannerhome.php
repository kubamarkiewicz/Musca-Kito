<?php

	class Model_BannerHome extends Musca_Model
	{
		public $table = 'banner_home';

		function getAll()
		{
			$sql = "SELECT * FROM $this->table WHERE enabled=1 ORDER BY pos";
			$result = $this->db->getAll($sql);
			return $result;
		}
	}
