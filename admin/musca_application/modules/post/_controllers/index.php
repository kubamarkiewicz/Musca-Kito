<?php

	class Index extends App_Controller
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
		

		function __construct($db=null, $i18n=null)
		{
			parent::__construct($db, $i18n);
		}
		

		function first()
		{
			$this->clearEditIds();
			$this->smarty->assign('colModel', json_encode($this->flex_col_model));
			$this->smarty->assign('sortname', $this->flex_sortname);
			$this->smarty->assign('sortorder', $this->flex_sortorder);
			$this->smarty->assign('modul', $this->modul);
			$this->output('list.tpl');
		}


		function edit($id = null, $saved = false)
		{
			$this->setEditIds($id, $this->modul, $this->flex_table, 'id', 'name');

			$model = new Model_Post($this->db);

			if ($_POST['send'])
			{
				$elem = $model->save($_POST, $id);
				$id = $elem[$model->PKey()];
				$this->redirect('/'.$this->modul.'/edit/'.$id.'/saved');
			}

			$this->smarty->assign('id', $id);
			$this->smarty->assign('elem', $model->get($id));
			$this->smarty->assign('fieldsConfig', $model->fieldsConfig);
			$this->smarty->assign('galleryConfig', $model->galleryConfig);
			$this->smarty->assign('saved', $saved);
			$this->output('edit.tpl');
		}


		function order()
		{
			$model = new Model_Post($this->db);

			if (isset($_POST['send']))
			{
				// print_r($_POST); exit;
				$elem = $model->saveOrder($_POST);
				$this->smarty->assign('saved', true);
			}

			$this->smarty->assign('elem', $model->getOrder());
			$this->output('order.tpl');
		}

		function del()
		{
			$model = new Model_Post($this->db);
			if ($ids = explode(',', $_POST['ids'])) foreach ($ids as $id) $model->delete($_POST['ids']);
			unset($_SESSION['edit_ids'][$this->modul]);
		}
	}
