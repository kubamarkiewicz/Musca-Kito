<?php

	class Model_News extends Musca_Model
	{
		public $table = 'news';


		function getForHome()
		{
			$sql = "SELECT * FROM $this->table 
					WHERE enabled=1 
					AND date <= DATE(NOW())
					ORDER BY date DESC LIMIT 3";
			$result = $this->db->getAll($sql);
			return $result;
		}

		function getAll()
		{
			$sql = "SELECT * FROM $this->table 
					WHERE enabled=1 
					AND date <= DATE(NOW())
					ORDER BY date DESC";
			$result = $this->db->getAll($sql);
			return $result;
		}


	}
