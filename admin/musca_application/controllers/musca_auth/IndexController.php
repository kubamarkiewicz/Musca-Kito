<?php

	class IndexController extends App_Controller
	{
		protected $modul = 'musca_auth';
		protected $module_title = 'Administrators';
	
		protected $flex_table = 'musca_auth';
		protected $flex_fields = 'id_auth, username, enabled';
	    protected $flex_col_model = array(
										array('display' => 'ID', 'name' => 'id_auth', 'width' => 25, 'sortable' => true, 'align' => 'right'),
										array('display' => 'Username', 'name' => 'username', 'width' => 300, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Activated', 'name' => 'enabled', 'width' => 50, 'sortable' => true, 'align' => 'center')
									);
        protected $flex_sortname = 'username';
        protected $flex_sortorder = 'ASC';
        protected $flex_where = '';
        protected $flex_class = array('enabled'=>'bool');
		
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
		    $model = new Model_Musca_Auth($this->db);
			if (isset($_POST['send']))
			{
				$elem = $model->save($_POST);
				$this->template->assign('elem', $elem);
				$this->template->assign('saved', true);
			}
			$this->loader($model);
			$this->output($this->modul.'/edit.tpl', 0);
		}

		function editAction($id=false)
		{
			$model = new Model_Musca_Auth($this->db);
			if (isset($_POST['send']))
			{
				$model->update($_POST, $id);
				$this->template->assign('saved', true);
			}
			if (!$id) $this->first();
			$elem = $model->get($id);

			$this->template->assign('elem', $elem);
			$this->template->assign('id',$id);
			$this->loader($model);
			$this->output($this->modul.'/edit.tpl', 1);
		}
		
		private function loader($model)
		{
		}

		function delAction()
		{
			if (!$this->getAuth($this->modul) || !isset($_POST['ids'])) die();
			$this->db->delete($this->flex_table, "id_auth IN (".rtrim($_POST['ids'],",").")");
		}

		function flexGridAction() { parent::flexGridAction(); }

	}
