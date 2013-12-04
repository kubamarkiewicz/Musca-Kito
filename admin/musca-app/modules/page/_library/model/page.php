<?php

	class Model_Page extends App_Model
	{
		public $table = 'page';
		public $sortBy = 'pos';
		public $fieldsConfig = array(
						'image' => array(
							'type' => 'image',
							'dir' => '/page',
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

		public $parent_id;


		function __construct($db=null, $i18n=null)
		{
			parent::__construct($db, $i18n);

			$this->parent_id = $_SESSION['page']['parent_id'];
		}



		/* defaul values goes here */
		function _new()
		{
			$elem = array();
			$elem['enabled'] = 1;
			$elem['parent_id'] = $this->parent_id;
			return $elem;
		}



		function save($data, $id = null)
		{
			// print_r($data); exit;
			$data['slug'] = Musca_Utils::slug($data['name']);

			return parent::save($data, $id);
		}




		function getTree($flat = false)
		{
			$sql = "SELECT * FROM $this->table ORDER BY pos";
			$result = $this->db->getAssoc($sql);
			// print_r($result); exit;
			if ($result) foreach ($result as $id => $page) 
			{
				$page['children'] = $tree[$id]['children'];
				$tree[$id] = $page;
				$tree[$page['parent_id']]['children'][] = &$tree[$id];
			}
			// print_r($tree); exit;
			$tree = $tree[0]['children'];
			// print_r($tree); exit;

			if ($flat) $tree = $this->flattenTree($tree);
			// print_r($tree); exit;

            return $tree;	
		}


		private function flattenTree($pages, $depth=0) 
		{ 
			++$depth;
			$return = array();
			if ($pages) foreach ($pages as $page) 
			{
				$page['depth'] = $depth;
				$children = $page['children'];
				$page['children'] = null;
				$return[] = $page;
				if ($children) $return = array_merge($return, $this->flattenTree($children, $depth)); 
			}
			--$depth;
			return $return;
		}




		function getOrder()
		{
			$sql = "SELECT * FROM $this->table WHERE parent_id=".(int)$this->parent_id." ORDER BY pos";
		    return $this->db->getAll($sql);
		}


		function getLastPos()
		{
			$sql = "SELECT pos FROM $this->table WHERE parent_id=".(int)$this->parent_id." ORDER BY pos DESC LIMIT 1";
		    return $this->db->getOne($sql);
		}


	
	}
