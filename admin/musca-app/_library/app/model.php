<?php

	/* modified 2013.11.25 */

	class App_Model
	{
		public $table;		
	/*
		If items are sortable set the name of the field where items' order is stored
	 	public $sortBy = 'pos'; 
	 */
	 	public $sortBy = false;
	/*		
		Fields configuration. Array key is a field name. 

		Example of file upload field:
	
		public $fieldsConfig = array(
					'pdf' => array(
						'type' => 'file',
						'dir' => '/sandbox_pdf'
					)
				);

		Example of image upload field:

		public $fieldsConfig = array(
					'image' => array(
						'type' => 'image',
						'dir' => '/sandbox',
						'width' => '200',
						'height' => '160',
						'crop' => true,
						'thumbnail' => array(
							'width' => '100',
							'height' => '80',
							'crop' => true
						)
					)
				);
	*/
	/*
		Gallery configuration
		
		public $galleryConfig = array(
						'dir' => '/sandbox',
						'width' => '200',
						'height' => '160',
						'crop' => true,
						'thumbnail' => array(
							'width' => '100',
							'height' => '80',
							'crop' => true
						);
	*/
		
		protected $db;
		private $PKey;


		function __construct($db)
		{
			$this->db = $db;
		}


		// get primary key column name
		function PKey()
		{
			if (isset($this->PKey)) return $this->PKey;
		    return $this->PKey = $this->db->getPKeyColumn($this->table);
		}


		function getAll()
		{
			$sql = "SELECT * FROM $this->table ORDER BY ".($this->sortBy ? $this->sortBy : 'name');
			$result = $this->db->getAll($sql);

			// i18n
			$result = $this->getI18n($result, $this->table, $id);

            return $result;	
		}



		function get($id = null)
		{
			if (!$id) return $this->_new();

			$sql = "SELECT * FROM $this->table WHERE ".$this->PKey()."=$id";
			$result = $this->db->getRow($sql);

			$result = $this->getI18n($result, $this->table, $id);
			if ($this->galleryConfig) $result = $this->getGallery($result);

            return $result;	
		}


		/* put here default values row new record */
		function _new()
		{
			$elem = array();
			return $elem;
		}
		

		function save($data, $id = null)
		{
			// print_r($data); exit;

			if ($id) // update record
			{
				$this->db->update($this->table, $data, $this->PKey()."=$id");
			}
			else // insert record
			{
				if ($this->sortBy) $data[$this->sortBy] = $this->getLastPos() + 1;
				$this->db->insert($this->table, $data);
				$id = $this->last($this->table);
			}

			// save fields
			if ($this->fieldsConfig) foreach ($this->fieldsConfig as $fieldName => $parameters) 
				switch ($parameters['type']) 
				{
					case 'file':
						$this->saveFile($id, $fieldName, $parameters);
						break;
					case 'image':
						$this->saveImage($id, $fieldName, $parameters);
						break;
				}

			$this->saveI18n($data['i18n'], $this->table, $id);
			if ($this->galleryConfig) $this->saveGallery($id, $this->galleryConfig);

			return $this->get($id);
		}


		function last($table = null) 
		{
			if (!$table) $table = $this->table; 
			return $this->db->getOne("SELECT MAX(".$this->PKey().") FROM ".$table); 
		}





		/* i18n ********************************************************************************************/


		function isI18n()
		{
			$sql = "SHOW TABLES LIKE '".$this->table."_i18n'";
		    return (bool) $this->db->getRow($sql);
		}

		function getI18n($result, $table, $id)
		{
			if (!$this->isI18n()) return $result;
		    $i18n =  array();
			$arValue = $this->db->getAll('SELECT lang, field, value FROM '.$table.'_i18n WHERE id='.$id);
			foreach ($arValue as $k => $v)
			{
			    $lang = $v['lang'];
				$field = $v['field'];
			    $i18n[$field][$lang] = $v['value'];
			}
			return array_merge($result, $i18n);
		}

		function saveI18n($i18n, $table, $id)
		{
			if (!$this->isI18n()) return;
			$this->util = new Musca_Utils_DB($this->db);
			foreach ($i18n as $field => $langs)
			    foreach ($langs as $iso => $value)
			    {
			        $value = addslashes($value);
			        if ($field=='title')
			        {
				    	$slug = $value ? $this->util->slug_i18n($value, $table . '_i18n') : '';
				        $this->db->query("INSERT INTO ".$this->table."_i18n (id,lang,field,value) VALUES ($id,'$iso','slug','$slug') ON DUPLICATE KEY UPDATE value='$slug'");
					}
			        $this->db->query("INSERT INTO " . $table. "_i18n (id,lang,field,value) VALUES ($id,'$iso','$field','$value') ON DUPLICATE KEY UPDATE value='$value'");
			    }
		}




		/* ORDER ********************************************************************************************/

		function getOrder($table = null)
		{
			if (!$table) $table = $this->table;
			$sql = "SELECT * FROM $table ORDER BY $this->sortBy";
		    return $this->db->getAll($sql);
		}

		function saveOrder($data, $table = null)
		{
			if (!$table) $table = $this->table;
		    $pos = 0;
			foreach($data['order'] as $id)
			{
			    $insert[$this->sortBy] = ++$pos;
			    $this->db->update($table, $insert, $this->PKey().'='.$id);
			}
		}

		function getLastPos()
		{
			$sql = "SELECT $this->sortBy FROM $this->table ORDER BY $this->sortBy DESC LIMIT 1";
	    	return $this->db->getOne($sql);	
		}









		/* FILE UPLOAD *******************************************************************************************/

		function saveFile($id, $field, $parameters)
		{
			// print_r($_FILES); exit;
			if (!$parameters) return;

			$this->deleteFile($id, $field, $parameters);

			// upload file
			$filePath = MUSCA_PATH.CONTENT_DIR.$parameters['dir'];
			if (!file_exists($filePath)) mkdir($filePath);

			$filename = Musca_Utils_Upload::uploadFile($field, $filePath);
			if (!$filename)	return;

			// update db
			$this->db->update($this->table, array($field => $filename), $this->PKey().'='.$id);
		}


		function deleteFile($id, $field, $parameters)
		{
			if (!$_POST[$field.'_del']) return;

			$filePath = MUSCA_PATH.CONTENT_DIR.$parameters['dir'];
			$elem = $this->get($id);
			unlink($filePath.'/'.$elem[$field]);
			$this->db->update($this->table, array($field => ''), $this->PKey().'='.$id);
		}





		/* IMAGE UPLOAD *******************************************************************************************/

		function saveImage($id, $field, $parameters)
		{
			// print_r($_FILES); exit;
			if (!$parameters) return;

			$this->deleteImage($id, $field, $parameters);

			// upload file
			$imagePath = MUSCA_PATH.CONTENT_DIR.$parameters['dir'];
			if (!file_exists($imagePath)) mkdir($imagePath, 0777);

			$filename = Musca_Utils_Upload::uploadFile($field, $imagePath);
			if (!$filename)	return;

			// resize image
			if ($parameters['width'] || $parameters['height'])
			{
				$filename = Musca_Utils::imageResize($imagePath.'/'.$filename, $parameters['width'], $parameters['height'], null, $parameters['crop']);
				if (!$filename) 
				{
					throw new Exception('Error: image resize failed.');
					return;
				}
				$filename = basename($filename);
			}

			// update db
			$this->db->update($this->table, array($field => $filename), $this->PKey().'='.$id);

			// generate thumbnail
			if ($parameters['thumbnail'])
			{
				$thumbPath = $imagePath.'/thumbs';
				if (!file_exists($thumbPath)) mkdir($thumbPath, 0777);
				Musca_Utils::imageResize($imagePath.'/'.$filename, $parameters['thumbnail']['width'], $parameters['thumbnail']['height'], $thumbPath, $parameters['thumbnail']['crop']);
			}
		}


		function deleteImage($id, $field, $parameters)
		{
			if (!$_POST[$field.'_del']) return;

			$imagePath = MUSCA_PATH.CONTENT_DIR.$parameters['dir'];
			$elem = $this->get($id);
			unlink($imagePath.'/'.$elem[$field]);
			$this->db->update($this->table, array($field => ''), $this->PKey().'='.$id);

			// thumbnail
			if ($parameters['thumbnail']) unlink($imagePath.'/thumbs/'.$elem[$field]);
		}


		/* GALLERY ********************************************************************************************/


		function saveGallery($id, $config)
		{
			if (!$config) return;

			$galleryPath = MUSCA_PATH.CONTENT_DIR.$config['dir'];
			if (!file_exists($galleryPath)) mkdir($galleryPath, 0777);
			$galleryPath .= '/'.$id;
			if (!file_exists($galleryPath)) mkdir($galleryPath, 0777);
			$thumbPath = $galleryPath.'/thumbs';
			if (!file_exists($thumbPath)) mkdir($thumbPath, 0777);

			// UPLOAD
			// print_r($_FILES); exit;
			foreach ($_FILES['gallery']['name'] as $index => $item)
			{
				$filename = Musca_Utils_Upload::uploadFile('gallery', $galleryPath, $index);
				if ($filename)
				{			
					// resize image
					if ($config['width'] || $config['height'])
					{
						$filename = Musca_Utils::imageResize($galleryPath.'/'.$filename, $config['width'], $config['height'], null, $config['crop']);
						if (!$filename) continue;
						$filename = basename($filename);
					}

					// insert into db
					$this->db->insert($this->table.'_gallery', array($this->table."_id" => $id, "image" => $filename));

					// generate thumbnail
					if ($config['thumbnail'])
					{
						Musca_Utils::imageResize($galleryPath.'/'.$filename, $config['thumbnail']['width'], $config['thumbnail']['height'], $thumbPath, $config['thumbnail']['crop']);
					}
				}
			}


			// UPDATE
			// print_r($_POST); exit;
			if ($_POST['gallery']) foreach ($_POST['gallery'] as $imageId => $item)
			{
				$this->db->update($this->table.'_gallery', $item, 'id='.$imageId);
			}


			// DELETE
			if ($_POST['gallery_del']) foreach ($_POST['gallery_del'] as $imageId)
			{
				$sql = "SELECT image FROM {$this->table}_gallery WHERE id=".$imageId;
				$file = $this->db->getOne($sql);
				unlink($galleryPath.'/'.$file);
				$this->db->delete($this->table.'_gallery', 'id='.$imageId);
			}
		}



		function getGallery($result)
		{
			$id = $result[$this->PKey()];
			$sql = "SELECT * FROM {$this->table}_gallery WHERE {$this->table}_id=".$id." ORDER BY pos";
			$result['gallery'] = $this->db->getAll($sql);
			// print_r($result);
			return $result;
		}



	}
