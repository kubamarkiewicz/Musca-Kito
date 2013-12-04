<?php

	class Model_Musca_Configuration
	{
		private $db;

		function __construct($db)
		{
			$this->db = $db;
		}
		
		function save($data)
		{
			$data = $this->fixData($data);
			$this->db->insert('musca_config', $data);
			return $this->get($this->last());
		}
		
		function update($data, $id)
		{
			$data = $this->fixData($data);
			$this->db->update('musca_config', $data, "id_config=$id");
		}
		
		function fixData($data)
		{
			$data['user_show'] = isset($data['user_show']) ? $data['user_show'] : 0;

			return $data;
		}
		
		function last() { return $this->db->getOne("SELECT MAX(id_config) FROM musca_config"); }
		
		function get($id=false)
		{
			if (!$id) die('No existe ID');
			return $this->db->getRow("SELECT * FROM musca_config WHERE id_config=$id");
		}
	}
