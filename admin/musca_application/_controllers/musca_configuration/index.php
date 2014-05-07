<?php

	class Index extends App_Controller
	{
		protected $flex_table = 'musca_config';
		protected $flex_fields = 'id_config, section, name, value, user_show';
	    protected $flex_col_model = array(
										array('display' => 'ID', 'name' => 'id_config', 'width' => 25, 'sortable' => true, 'align' => 'right'),
										array('display' => 'Sección', 'name' => 'section', 'width' => 150, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Name', 'name' => 'name', 'width' => 150, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Valor', 'name' => 'value', 'width' => 250, 'sortable' => true, 'align' => 'left'),
										array('display' => 'User', 'name' => 'user_show', 'width' => 50, 'sortable' => true, 'align' => 'left')
									);
        protected $flex_sortname = 'section';
        protected $flex_sortorder = 'ASC';
		protected $flex_class = array('user_show'=>'bool');
		protected $modul = 'musca_configuration';
		protected $module_title = 'Configuration';
		
		function first()
		{
			$this->smarty->assign('colModel', json_encode($this->flex_col_model));
			$this->smarty->assign('sortname', $this->flex_sortname);
			$this->smarty->assign('sortorder', $this->flex_sortorder);
			$this->smarty->assign('modul', $this->modul);
			$this->output($this->modul.'/list.tpl', 0);
		}
		
		function add()
		{
			if (isset($_POST['send']))
			{
				$admin = new Model_Musca_Configuration($this->db);
				$elem = $admin->save($_POST);
				$this->smarty->assign('elem', $elem);
				$this->smarty->assign('saved', true);
			}
			$this->output($this->modul.'/edit.tpl', 0);
		}

		function edit($id=false)
		{
			$this->setEditIds($id, $this->modul, $this->flex_table, 'id_config', 'name');

			$admin = new Model_Musca_Configuration($this->db);
			if (isset($_POST['send']))
			{
				$admin->update($_POST, $id);
				$this->smarty->assign('saved', true);
			}
			if (!$id) $this->first();
			$elem = $admin->get($id);

			$this->smarty->assign('elem', $elem);
			$this->smarty->assign('id',$id);
			$this->output($this->modul.'/edit.tpl', 1);
		}


		function del()
		{
			if (!$this->getAuth($this->modul) || !isset($_POST['ids'])) die();
			$this->db->delete($this->flex_table, "id_config IN (".rtrim($_POST['ids'],",").")");
		}

		function flexGrid() { parent::flexGrid(); }

	}
