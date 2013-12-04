<?php

	class Index extends App_Controller
	{
		protected $flex_table = 'musca_auth_rol';
		protected $flex_fields = 'id_auth_rol, name, enabled';
	    protected $flex_col_model = array(
										array('display' => 'ID', 'name' => 'id_auth_rol', 'width' => 25, 'sortable' => true, 'align' => 'right'),
										array('display' => 'Name', 'name' => 'name', 'width' => 300, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Activated', 'name' => 'enabled', 'width' => 50, 'sortable' => true, 'align' => 'center')
									);
        protected $flex_sortname = 'name';
        protected $flex_sortorder = 'ASC';
        protected $flex_class = array('enabled'=>'bool');
		protected $module_title = 'Roles';
        
		protected $modul = 'musca_auth_rol';
		
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
			$admin = new Model_Musca_AuthRol($this->db);

			if (isset($_POST['send']))
			{
				$elem = $admin->save($_POST);
				$this->smarty->assign('elem', $elem);
				$this->smarty->assign('saved', true);
			}

			$this->loader($admin);
			$this->output($this->modul.'/edit.tpl', 0);
		}

		function edit($id=false)
		{
			$admin = new Model_Musca_AuthRol($this->db);

			if (isset($_POST['send']))
			{
				$admin->update($_POST, $id);
				$this->smarty->assign('saved', true);
			}
			if (!$id) $this->first();
			$elem = $admin->get($id);
			$this->smarty->assign('elem', $elem);
			$this->smarty->assign('id',$id);
			$this->loader($admin);
			$this->output($this->modul.'/edit.tpl', 1);
		}
		
		private function loader($admin)
		{
            list($modul_user, $modul_admin) = $admin->getMods();
			$this->smarty->assign('modul_user', $modul_user);
			$this->smarty->assign('modul_admin', $modul_admin);
		}


		function del()
		{
			if (!$this->getAuth($this->modul) || !isset($_POST['ids'])) die();
			$this->db->delete($this->flex_table, "id_auth_rol IN (".rtrim($_POST['ids'],",").")");
		}

		function flexGrid() { parent::flexGrid(); }
	}
