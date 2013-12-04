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
			$this->db->insert('musca_auth', $data);
			return $this->get($this->last());
		}
		
		function update($data, $id)
		{
			$this->fixData($data);
			$this->db->update('musca_auth', $data, "id_auth=$id");
		}
		
		function fixData(&$data)
		{
			$data['enabled'] = isset($data['enabled']) ? $data['enabled'] : 0;
			
			if (!empty($data['password'])) $data['password'] =  sha1($data['password']);
			else unset($data['password']);
		}
		
		function getRol()
		{
		    return $this->db->getAssoc("SELECT id_auth_rol, name FROM musca_auth_rol ORDER BY name");
		}
		
		function last() { return $this->db->getOne("SELECT MAX(id_auth) FROM musca_auth"); }
		
		function get($id=false)
		{
			if (!$id) die('No existe ID');
			return $this->db->getRow("SELECT * FROM musca_auth WHERE id_auth=$id");
		}
	}
