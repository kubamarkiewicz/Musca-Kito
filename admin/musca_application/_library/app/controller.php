<?php

	/* modified 2013.11.25 */

	class App_Controller extends App_Auth
	{
		protected $modul = '';
		protected $module_title = '';
		protected $model_class; 
	    protected $flex_table = '';
		protected $flex_fields = '';
		protected $flex_where = '1=1';
		protected $flex_class = array();
		protected $flex_buttons;


		function __construct($db=null, $i18n=null)
		{
			parent::__construct($db, $i18n);

			$this->flex_table = PRE.$this->flex_table;

			$this->flex_buttons = "buttons : [ 
					{name: '".$this->i18n->t('Add', 'grid')."', bclass: 'add', onpress: test},  
					{name: '".$this->i18n->t('Delete', 'grid')."', bclass: 'delete', onpress: test} 
				], ";
			if (@$this->flex_col_model) foreach ($this->flex_col_model as $key => $value) 
			{
				$this->flex_col_model[$key]['display'] = $this->i18n->t($value['display'], 'grid');
			}

			$this->smarty->assign('MAX_FILE_SIZE', Musca_Utils_Upload::maxUpload());
			$this->smarty->assign('MAX_FILE_SIZE_HUMAN', Musca_Utils_Upload::maxUpload(1));
			
			$this->smarty->assign('web_langs', explode(',', WEB_LANGS));
		}	

		protected function output($tpl=false, $menu=false)
		{

			// auth
			if (!$this->getAuth($this->modul)) 
			{
				header('location: ' . MUSCA_URL . '/auth');
				exit;
			}

			if ($menu) $this->smarty->assign('menu', $menu);
			if ($tpl) $this->smarty->assign('tpl', $tpl);

			if (strpos($tpl,'list')!==false) $this->smarty->assign('list', true);
			$this->smarty->assign('modul', $this->modul);
			if ($this->module_title) $this->smarty->assign('module_title', $this->module_title);
			$this->smarty->assign('buttons', $this->flex_buttons);
			
			$this->smarty->assign('wysiwygDisabled', Musca_Config::get('wysiwyg', 'disabled'));

			$this->smarty->display('layout.tpl');
		}
		
		function flexGrid() { echo $this->flexJson($this->flex_table, $this->flex_fields, $this->flex_where); }
		
		function flexJson($table=false, $fields=false, $where='1=1')
		{
			$page = !empty($_REQUEST['page']) ? $_REQUEST['page'] : 1;
			$rp = !empty($_REQUEST['rp']) ? $_REQUEST['rp'] : 10;
			$sortname = !empty($_REQUEST['sortname']) ? $_REQUEST['sortname'] : '';
			$sortorder = !empty($_REQUEST['sortorder']) ? $_REQUEST['sortorder'] : '';
			$str_find = '';

			if (!empty($_REQUEST['search'])) foreach ($_REQUEST['search'] as $field => $value) $str_find .= " AND $field LIKE '%$value%' ";
			if (!empty($_REQUEST['search_int'])) foreach ($_REQUEST['search_int'] as $field => $value) $str_find .= " AND $field=".(int)$value;
			$group = 
			$sort = "ORDER BY $sortname $sortorder";
			$start = (($page-1) * $rp);
			$limit = "LIMIT $start, $rp";
			$where = ($where || $str_find) ? "WHERE $where $str_find" : '';
			$total = $this->db->getOne("SELECT count(*) FROM $table $where");
			// echo "SELECT $fields FROM $table $where $group $sort $limit";

		    $result = $this->db->getAssoc("SELECT $fields FROM $table $where $sort $limit");
		    $rows = array();
		    foreach ($result as $k => $v)
		    {
				foreach ($this->flex_class as $field => $class)
				{
					if (array_key_exists($field, $v))
					{
					    switch ($class)
					    {
					        case 'bool':
					            $class = 'disabled';
					            if ($v[$field]) $class = 'enabled';
					            $v[$field] = '<span class="fg_'.$class.'"></span>';
					            break;
							case 'float':
								$v[$field] = '<span class="fg_'.$class.'">'.number_format($v[$field], 2, ',', '.').'</span>';
							    break;
							case 'numeric':
								$v[$field] = '<span class="fg_'.$class.'">'.number_format($v[$field], 0, ',', '.').'</span>';
							    break;
							case 'star':
								$v[$field] = '<span class="fg_'.$class.'_'.$v[$field].'"></span>';
							    break;
							case 'status':
								$v[$field] = '<span class="fg_'.$class.'_'.$v[$field].'"></span>';
							    break;
							default:
							    $v[$field] = '<span class="fg_'.$class.'">'.$v[$field].'</span>';
					        case 'blocked':
					            $class = 'unblocked';
					            if ($v[$field]) $class = 'blocked';
					            $v[$field] = '<span class="fg_'.$class.'"></span>';
					            break;
						}
					}
				}

				$rows[$k] = '{id: '.$k.', cell: '.json_encode(array_values($v)).'}';
			}

			return '{page: '.$page.', total: '.$total.', rows: ['.implode(',', $rows).']}';
		}

		function del()
		{
			$this->db->delete($this->flex_table, $this->db->getPKeyColumn($this->flex_table) . " IN (".rtrim($_POST['ids'],",").")");
			unset($_SESSION['edit_ids'][$this->modul]);
		}

		protected function setEditIds(&$id, $modul='default', $table, $id_where, $field)
		{
			if(!is_numeric($id))
			{
				$ids = explode(',',$id);
				$id = $ids[1];

				unset($_SESSION['edit_ids'][$modul]);
				foreach($ids as $x => $k)
					if ($x) $_SESSION['edit_ids'][$modul][$k] = $this->db->getOne("SELECT $field FROM $table WHERE $id_where=$k");
			}
		}

		protected function clearEditIds()
		{
			unset($_SESSION['edit_ids']);
		}
		

		function add()
		{
			return $this->edit();
		}
	}
