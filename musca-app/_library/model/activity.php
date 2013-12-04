<?php

	class Model_Activity extends Musca_Model
	{
		public $table = 'activity';

		function getAll()
		{
			$sql = "SELECT * FROM $this->table 
					WHERE enabled=1 
					AND endDate >= DATE(NOW())
					ORDER BY startDate ASC";
			$result = $this->db->getAll($sql);
			return $result;
		}

	}
