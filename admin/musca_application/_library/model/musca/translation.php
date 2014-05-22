<?php

	class Model_Musca_Translation
	{
		private $db;
		public $uploadDir = '/files'; // relative to CONTENT_DIR
		public $table = 'musca_i18n';

		function __construct($db)
		{
			$this->db = $db;
		}
		
		function save($data, $id=false)
		{
			// print_r($data); exit;
		    unset($data['send']);

		    $elem = $this->get($id);

			// upload file
			if ($elem['file'] && $_FILES['files']['name']) foreach($_FILES['files']['name'] as $lang => $val) if ($val)
				$data['langs'][$lang] = $this->uploadFile('files', $lang);

			// upload image
			if ($elem['image'] && $_FILES['images']['name']) foreach($_FILES['images']['name'] as $lang => $val) if ($val)
				$data['langs'][$lang] = $this->uploadImage('images', $lang, $elem);

			// insert / update
		    if ($data['langs']) foreach($data['langs'] as $lang => $val)
		    {
		    	$insert = $elem;
		        $insert['id_i18n'] = null;
		        $insert['lang'] = $lang;
		        $insert['value'] = $val;

		        $id_exist = $this->db->getOne("SELECT id_i18n FROM ".PRE.$this->table." WHERE section='".$data['section']."' AND tag='".$data['tag']."' AND lang='".$lang."'");
		        if (!empty($id_exist)) $this->db->update(PRE.$this->table, $insert, "id_i18n=$id_exist");
				else $this->db->insert(PRE.$this->table, $insert);
			}
		}
		
		function get($id=false)
		{
			if (!$id) die('No existe ID');
			$elem = $this->db->getRow("SELECT * FROM ".PRE.$this->table." WHERE id_i18n=$id");
			$elem['langs'] = $this->db->getAssoc("SELECT lang, value FROM ".PRE.$this->table." WHERE section='".$elem['section']."' AND tag='".$elem['tag']."'");

			return $elem;
		}
		
		function getSections()
		{
		    return $this->db->getAssoc("SELECT DISTINCT section, section FROM ".PRE.$this->table." ORDER BY section");
		}
		
		private function is_md5($var) {
			return preg_match('/^[A-Fa-f0-9]{32}$/',$var);
		}


		function uploadFile($arrayName, $arrayKey, $arrayKey2)
		{
			// print_r($_FILES); exit;

			// upload file
			$filePath = MUSCA_PATH.CONTENT_DIR.$this->uploadDir;
			if (!file_exists($filePath)) mkdir($filePath);

			$filename = Musca_Utils_Upload::uploadFile($arrayName, $filePath, $arrayKey, $arrayKey2);
			if (!$filename) return;

			$fileURL = MUSCA_URL.CONTENT_DIR.$this->uploadDir.'/'.basename($filename);

			return $fileURL;
		}


		function uploadImage($arrayName, $arrayKey, $arrayKey2, $parameters)
		{
			// print_r($_FILES); exit;

			// upload file
			$imagePath = MUSCA_PATH.CONTENT_DIR.$this->uploadDir;
			if (!file_exists($imagePath)) mkdir($imagePath);

			$filename = Musca_Utils_Upload::uploadFile($arrayName, $imagePath, $arrayKey, $arrayKey2);
			if (!$filename) return;

			// resize image
			if ($parameters['width'])
			{
				$filename = Musca_Utils::imageResize($imagePath.'/'.$filename, $parameters['width'], $parameters['height'], null, $parameters['crop']);
				if (!$filename) 
				{
					throw new Exception('Error: image resize failed.');
					return;
				}
				$filename = basename($filename);
			}

			$fileURL = MUSCA_URL.CONTENT_DIR.$this->uploadDir.'/'.basename($filename);

			return $fileURL;
		}


		function getParametersByTag($tag)
		{
			$sql = "SELECT * FROM ".PRE.$this->table." WHERE tag='".mysql_real_escape_string($tag)."' LIMIT 1";
			return $this->db->getRow($sql);
		}
	}
