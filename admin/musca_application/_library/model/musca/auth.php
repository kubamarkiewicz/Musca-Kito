<?php

	class Model_Musca_Auth
	{
		private $db;

		function __construct($db)
		{
			$this->db = $db;
		}
		
		function save($data)
		{
			$this->fixData($data);
			$this->db->insert(PRE.'musca_auth', $data);
			return $this->get($this->last());
		}
		
		function update($data, $id)
		{
			$this->fixData($data);
			$this->db->update(PRE.'musca_auth', $data, "id_auth=$id");
		}
		
		function fixData(&$data)
		{
			$data['enabled'] = isset($data['enabled']) ? $data['enabled'] : 0;
			
			if (!empty($data['password'])) $data['password'] =  sha1($data['password']);
			else unset($data['password']);
		}
		
		function last() { return $this->db->getOne("SELECT MAX(id_auth) FROM ".PRE."musca_auth"); }
		
		function get($id=false)
		{
			if (!$id) die('No existe ID');
			return $this->db->getRow("SELECT * FROM ".PRE."musca_auth WHERE id_auth=$id");
		}
	}
