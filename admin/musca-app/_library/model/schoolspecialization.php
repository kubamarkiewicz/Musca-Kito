<?php

	class Model_SchoolSpecialization extends App_Model
	{
		public $table = 'school_specialization';

		function save($data, $id = null)
		{
			// print_r($data); exit;

			if ($id) // update record
			{
				$this->db->update($this->table, $data, $this->PKey."=$id");
			}
			else // insert record
			{
				$data['school_id'] = $_SESSION[CAPSULE]['auth']['school_id'];

				if ($this->reorder) $data['pos'] = $this->getLastPos() + 1;
				$this->db->insert($this->table, $data);
				$id = $this->last($this->table);
			}

			if ($this->fields) foreach ($this->fields as $fieldName => $parameters) 
				switch ($parameters['type']) 
				{
					case 'image':
						$this->saveImage($id, $fieldName, $parameters);
						break;
				}

			// i18n
			if ($this->i18n) $this->saveI18n($data['i18n'], $this->table, $id);

			return $this->get($id);
		}
	}
