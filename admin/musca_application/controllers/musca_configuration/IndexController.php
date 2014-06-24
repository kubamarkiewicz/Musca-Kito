<?php

	class IndexController extends App_Controller
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
		
		function indexAction()
		{
			$this->template->assign('colModel', json_encode($this->flex_col_model));
			$this->template->assign('sortname', $this->flex_sortname);
			$this->template->assign('sortorder', $this->flex_sortorder);
			$this->template->assign('modul', $this->modul);
			$this->output($this->modul.'/list.tpl', 0);
		}
		
		function addAction()
		{
			if (isset($_POST['send']))
			{
				$admin = new Model_Musca_Configuration($this->db);
				$elem = $admin->save($_POST);
				$this->template->assign('elem', $elem);
				$this->template->assign('saved', true);
			}
			$this->output($this->modul.'/edit.tpl', 0);
		}

		function editAction($id=false)
		{
			$this->setEditIds($id, $this->modul, $this->flex_table, 'id_config', 'name');

			$admin = new Model_Musca_Configuration($this->db);
			if (isset($_POST['send']))
			{
				$admin->update($_POST, $id);
				$this->template->assign('saved', true);
			}
			if (!$id) $this->first();
			$elem = $admin->get($id);

			$this->template->assign('elem', $elem);
			$this->template->assign('id',$id);
			$this->output($this->modul.'/edit.tpl', 1);
		}


		function delAction()
		{
			if (!$this->getAuth($this->modul) || !isset($_POST['ids'])) die();
			$this->db->delete($this->flex_table, "id_config IN (".rtrim($_POST['ids'],",").")");
		}

		function flexGridAction() { parent::flexGridAction(); }

	}
