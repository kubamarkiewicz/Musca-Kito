<?php

	class Model_Bull extends Musca_Model
	{
		public $table = 'bull';


		function getByCategory($categoryId, $sort = null)
		{
			$sql = "SELECT * FROM $this->table 
					WHERE categoryId=$categoryId 
					AND enabled=1";
			if ($sort)
			{
				if ($_SESSION['bull']['sort'][$sort] == 'DESC') $_SESSION['bull']['sort'][$sort] = 'ASC';
				else $_SESSION['bull']['sort'][$sort] = 'DESC';
				$sql .= " ORDER BY ".mysql_real_escape_string($sort).' '.$_SESSION['bull']['sort'][$sort];
			} 
			else $sql .= " ORDER BY pos ASC";
			// echo $sql;
			$result = $this->db->getAssoc($sql);
            return $result;	
		}


		function getCategories()
		{
			$sql = "SELECT * FROM {$this->table}_category 
					ORDER BY pos ASC";
			$result = $this->db->getAssoc($sql);
            return $result;	
		}


		function getCategory($categoryId)
		{
			$sql = "SELECT * FROM {$this->table}_category 
					WHERE id=".(int)$categoryId;
			$result = $this->db->getRow($sql);
            return $result;	
		}



	}
