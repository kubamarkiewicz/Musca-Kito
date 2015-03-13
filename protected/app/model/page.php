<?php

	class Model_Page extends App_Model
	{
		public $table = 'page';
		public $tree;


		function __construct($db, $lang=null)
		{
			parent::__construct($db, $lang);

			// set pages tree
			$sql = "SELECT * FROM $this->table WHERE enabled=1 ORDER BY pos";
			$result = $this->db->getAll($sql);
			/* i18n */
			// foreach ($result as $key => $elem) $result[$key] = $this->getI18n($elem);
			// print_r($result); exit;

			$this->tree = new Tree($result, array('id' => 'id', 'parentId' => 'parent_id', 'url' => 'slug'));
			// $this->tree->dump(); exit;
		}


		function getPageByUrl($url)
		{
			return $this->tree->getPageByUrl($url);
		}



		function getMenuItems()
		{
			return $this->tree->get();
		}




	}
