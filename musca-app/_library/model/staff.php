<?php

	class Model_Staff extends Musca_Model
	{
		public $table = 'staff';


		function getAll()
		{
			$sql = "SELECT * FROM $this->table 
					WHERE enabled=1 
					ORDER BY pos";
			$result = $this->db->getAll($sql);
			return $result;
		}


	}
