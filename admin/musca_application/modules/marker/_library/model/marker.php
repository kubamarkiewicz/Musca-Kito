<?php

	class Model_Marker extends App_Model
	{
		public $table = 'marker'; 		/* without prefix */
		public $sortBy = null;
		public $fieldsConfig = array(
						);
		

		/* defaul values goes here */
		function _new()
		{
/*			$elem = array();
			$elem['published'] = 1;
			$elem['date'] = date("Y-m-d");
			return $elem;*/
		}
		

		function delete($id)
		{
			$id = (int)$id;
			if ($id) // update record
			{
				$this->db->update($this->table, array('deleted' => 1), $this->PKey()."=$id");
			}
		}


	}
