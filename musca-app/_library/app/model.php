<?php

	/* modified 2013.08.21 */

	class App_Model
	{
		public $table;
		public $PKey = 'id'; // primary key

		protected $db;
		protected $lang;


		
		function __construct($db, $lang = null)
		{
			$this->db = $db;
			$this->lang = $lang;
		}
		
		
		function get($id)
		{
			$sql = "SELECT * FROM $this->table WHERE ".$this->PKey."=".(int)$id;
			$result = $this->db->getRow($sql);
			if ($this->lang) $result = $this->getI18n($result);
			return $result;
		}
		
		
		function getAll()
		{
			$sql = "SELECT * FROM $this->table";
			$result = $this->db->getAll($sql);
			if ($this->lang) foreach ($result as $key => $elem) $result[$key] = $this->getI18n($elem);
			return $result;
		}
		
		
		function getAssoc()
		{
			$sql = "SELECT * FROM $this->table";
			$result = $this->db->getAssoc($sql);
			if ($this->lang) foreach ($result as $key => $elem) $result[$key] = $this->getI18n($elem);
			return $result;
		}

		
		function insert($data)
		{
			return $this->db->insert($this->table, $data);
		}
		

		function update($data, $id)
		{
			return $this->db->update($this->table, $data, $this->PKey."=".(int)$id);
		}


		function last($table = null) 
		{
			return $this->db->getOne("SELECT MAX(".$this->PKey.") FROM ".($table ? $table : $this->table)); 
		}




		function getI18n($data, $table = null)
		{
			if (!$data) return;
			if (!$table) $table = $this->table;
			$id = $data[$this->PKey];
			$sql = "SELECT field, value FROM ".$table."_i18n WHERE lang='".$this->lang."' AND id=".$id;
			$result = $this->db->getAssoc($sql);
		    $i18n =  array();
			foreach ($result as $field => $value) $i18n[$field] = $value;
			return array_merge($data, $i18n);
		}	

	}
