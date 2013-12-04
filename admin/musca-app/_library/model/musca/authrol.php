<?php

	class Model_Musca_AuthRol
	{
		private $db;

		function __construct($db)
		{
			$this->db = $db;
		}
		
		function save($data)
		{
		    $mods = !empty($data['mods']) ? $data['mods'] : array();
			$this->fixData($data);
			$this->db->insert('musca_auth_rol', $data);
			$id = $this->last();
			$this->saveRel($mods, 'musca_mod_auth_rol_rel', 'slug', $id);
			return $this->get($id);
		}
		
		function update($data, $id)
		{
			if(!empty($data['modul_admin']) && is_array($data['modul_admin'])) $this->updateMods($data['modul_admin']);

		    $mods = !empty($data['mods']) ? $data['mods'] : array();
		    $this->saveRel($mods, 'musca_mod_auth_rol_rel', 'slug', $id);
		    
			$this->fixData($data);
			$this->db->update('musca_auth_rol', $data, "id_auth_rol=$id");
		}

		private function updateMods($data=false)
		{
			foreach($data as $id_mod => $v)
			{
                $arInsert = array();
                $arInsert['name'] = $v['name'];
                $arInsert['enabled'] = !empty($v['enabled']) ? 1 : 0;
                $delete = !empty($v['delete']) ? 1 : 0;
				if ($delete) $this->db->delete('musca_mod', "id_mod=$id_mod");
				else $this->db->update('musca_mod', $arInsert, "id_mod=$id_mod");
			}
		}
		
		function fixData(&$data)
		{
			$data['enabled'] = isset($data['enabled']) ? $data['enabled'] : 0;
		}
		
		function getMods()
		{
		    $path = dirname(dirname(dirname(dirname(__FILE__)))).DS.'controllers'.DS.'admin'.DS;
		    $folder_handle = opendir($path);
		    $exclude_array = explode("|", $exclude = ".|..");
		    $result = array();
		    while(false !== ($filename = readdir($folder_handle))) {
		        if(!in_array(strtolower($filename), $exclude_array)) {
		            if(is_dir($path . $filename . "/")) $result[] = $filename;
		        }
		    }
		    foreach ($result as $key => $name) $this->db->query("INSERT INTO musca_mod (id_mod,slug,name) VALUES ($key,'$name','$name') ON DUPLICATE KEY UPDATE id_mod=$key");

            $modul_user = $this->db->getAssoc("SELECT slug, name FROM musca_mod WHERE enabled=1 ORDER BY name");
            $modul_admin = $this->db->getAssoc("SELECT id_mod, name, enabled FROM musca_mod ORDER BY name");

		    return array($modul_user, $modul_admin);
		}
		
		function last() { return $this->db->getOne("SELECT MAX(id_auth_rol) FROM musca_auth_rol"); }
		
		function get($id=false)
		{
			if (!$id) die('No existe ID');
			$result = $this->db->getRow("SELECT * FROM musca_auth_rol WHERE id_auth_rol=$id");
			$result['mods'] = $this->db->getAssoc("SELECT slug, slug FROM musca_mod_auth_rol_rel WHERE id_auth_rol=$id");
			return $result;
		}
		
		function saveRel($data, $table=false, $field=false, $id)
		{
			$this->db->delete($table, "id_auth_rol=$id");
			if(empty($data)) return false;
			foreach($data as $id_field)
			{
			    $arInsert = array();
			    $arInsert[$field] = $id_field;
			    $arInsert['id_auth_rol'] = $id;
			    $this->db->insert($table, $arInsert);
			}
		}
	}
