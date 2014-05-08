<?php

	class Model_Marker extends App_Model
	{
		public $table = 'marker';
		public $fieldsConfig = array(
					'file' => array(
						'type' => 'image',
						'dir' => '/marker',
						'width' => '1200',
						'height' => '800',
						'crop' => false,
						'thumbnail' => array(
							'width' => '100',
							'height' => '80',
							'crop' => true
						)
					)
				);

		function getAll()
		{
			$sql = "SELECT * FROM $this->table 
					WHERE deleted<>1";
			return $this->db->getAssoc($sql);
		}


		function save($data, $id = null)
		{
			if ($id = (int)$id) // update record
			{
				$this->db->update($this->table, $data, "id=$id");
			}
			else // insert record
			{
				$this->db->insert($this->table, $data);
				$id = $this->last($this->table);
			}

			// save files
			for ($i=1; $i<=5; $i++)
			{
				$this->saveFile($id, 'file'.$i, $this->fieldsConfig['file']);
			}

			return $id;
		}


		/* upload file and save in field in db table */
		protected function saveFile($id, $field, $parameters)
		{
			// upload file
			$filePath = MUSCA_PATH.CONTENT_DIR.$parameters['dir'];
			if (!file_exists($filePath)) mkdir($filePath);

			$filename = Musca_Utils_Upload::uploadFile($field, $filePath);
			if (!$filename)	return;

			// resize image
			if ($parameters['width'] || $parameters['height'])
			{
				$imagename = Musca_Utils::imageResize($filePath.'/'.$filename, $parameters['width'], $parameters['height'], null, $parameters['crop']);
				if ($imagename) 
				{
					$filename = basename($imagename);
				}
			}

			// update db
			$this->db->update($this->table, array($field => $filename), 'id='.$id);
		}
	}
