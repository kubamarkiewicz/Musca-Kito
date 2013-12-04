<?php

	class Model_Product extends Musca_Model
	{
		public $table = 'product';



		function getBySlug($slug)
		{
			$sql = "SELECT * FROM $this->table WHERE slug='".mysql_real_escape_string($slug)."' AND enabled=1";
			$result = $this->db->getRow($sql);
			if (!$result) return false;
			if ($this->lang) $result = $this->getI18n($result);
			return $result;
		}


		function getByCategory($categoryId)
		{
			$sql = "SELECT * FROM $this->table 
					WHERE categoryId=$categoryId 
					AND enabled=1 
					ORDER BY pos ASC";
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





	}
