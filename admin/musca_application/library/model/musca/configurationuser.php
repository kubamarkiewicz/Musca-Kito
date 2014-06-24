<?php

	class Model_Musca_ConfigurationUser
	{
		private $db;

		function __construct($db)
		{
			$this->db = $db;
		}
		
		function save($data)
		{
			foreach($data['config'] as $id_config => $update)
			{
				if(isset($update['value']) && empty($update['value'])) $update['value'] = ' ';
				
				$this->db->update(PRE.'musca_config', $update, "id_config=$id_config");
			}
		}

		function get()
		{
			return $this->db->getAssoc("SELECT * FROM ".PRE."musca_config WHERE user_show=1");
		}
	}

