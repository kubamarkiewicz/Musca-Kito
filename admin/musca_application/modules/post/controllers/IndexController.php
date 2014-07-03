<?php

	class IndexController extends App_Controller
	{
		protected $modul = 'post';
		protected $module_title = 'Posts';
		protected $flex_table = 'post'; 			// without prefix
		protected $flex_fields = 'id, date, name, published';
	    protected $flex_col_model = array(
										array('display' => 'ID', 'name' => 'id', 'width' => 25, 'sortable' => true, 'align' => 'right'),
										array('display' => 'Date', 'name' => 'date', 'width' => 130, 'sortable' => true, 'align' => 'right'),
										array('display' => 'Title', 'name' => 'name', 'width' => 500, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Published', 'name' => 'published', 'width' => 60, 'sortable' => true, 'align' => 'right')
									);
        protected $flex_sortname = 'date';
        protected $flex_sortorder = 'DESC';
		// protected $flex_where = '';
        protected $flex_class = array('published'=>'bool');
		


		

		function __construct($db, $i18n, $template, $config, $auth)
		{
			parent::__construct($db, $i18n, $template, $config, $auth);
		}
		

		function indexAction()
		{
			$this->clearEditIds();
			$this->template->assign('colModel', json_encode($this->flex_col_model));
			$this->template->assign('sortname', $this->flex_sortname);
			$this->template->assign('sortorder', $this->flex_sortorder);
			$this->template->assign('modul', $this->modul);
			$this->output('list.tpl');
		}


		function editAction($id = null, $saved = false)
		{
			$this->setEditIds($id, $this->modul, $this->flex_table, 'id', 'name');

			$model = new Model_Post($this->db);

			if ($_POST['send'])
			{
				$elem = $model->save($_POST, $id);
				$id = $elem[$model->PKey()];
				$this->redirect('/'.$this->modul.'/edit/'.$id.'/saved');
			}

			$this->template->assign('id', $id);
			$this->template->assign('elem', $model->get($id));
			$this->template->assign('fieldsConfig', $model->fieldsConfig);
			$this->template->assign('galleryConfig', $model->galleryConfig);
			$this->template->assign('saved', $saved);
			$this->output('edit.tpl');
		}


		function orderAction()
		{
			$model = new Model_Post($this->db);

			if (isset($_POST['send']))
			{
				// print_r($_POST); exit;
				$elem = $model->saveOrder($_POST);
				$this->template->assign('saved', true);
			}

			$this->template->assign('elem', $model->getOrder());
			$this->output('order.tpl');
		}

		function delAction()
		{
			$model = new Model_Post($this->db);
			if ($ids = explode(',', $_POST['ids'])) foreach ($ids as $id) $model->delete($_POST['ids']);
			unset($_SESSION['edit_ids'][$this->modul]);
		}
	}

