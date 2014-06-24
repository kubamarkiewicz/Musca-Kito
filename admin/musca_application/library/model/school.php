<?php

	class Model_School extends App_Model
	{
		public $table = 'school';

		function getAll()
		{
			$sql = "SELECT * FROM $this->table WHERE deleted<>1 ORDER BY name";
		    return $this->db->getAll($sql);
		}
	}
