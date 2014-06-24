<?php

	/* modified 2013.11.17 */

	class IndexController extends App_Controller
	{
		protected $modul = 'sandbox';
		protected $module_title = 'Sandbox';
		protected $flex_table = 'sandbox';
		protected $flex_fields = 'id, pos, name, enabled';
	    protected $flex_col_model = array(
										array('display' => 'ID', 'name' => 'id', 'width' => 25, 'sortable' => true, 'align' => 'right'),
										array('display' => 'Order', 'name' => 'pos', 'width' => 40, 'sortable' => true, 'align' => 'right'),
										array('display' => 'Name', 'name' => 'name', 'width' => 500, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Activated', 'name' => 'version', 'width' => 55, 'sortable' => true, 'align' => 'left')
									);

        protected $flex_sortname = 'pos';
        protected $flex_sortorder = 'ASC';
        // protected $flex_where = '';
        protected $flex_class = array('enabled'=>'bool');
        protected $model_class = 'Model_Sandbox';
	}
		

	function __construct($db, $i18n, $auth)
	{
		parent::__construct($db, $i18n, $auth);
		$this->template->assign('MAX_FILE_SIZE', Musca_Utils_Upload::maxUpload());
		$this->template->assign('MAX_FILE_SIZE_HUMAN', Musca_Utils_Upload::maxUpload(1));
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

		$model = new $this->model_class($this->db);

		if (isset($_POST['send']))
		{
			$elem = $model->save($_POST, $id);
			$id = $elem[$this->db->getPKeyColumn($this->flex_table)];
			$this->redirect('/'.$this->modul.'/edit/'.$id.'/saved');
		}

		$this->template->assign('id', $id);
		$this->template->assign('elem', $model->get($id));
		$this->template->assign('model', $model);
		$this->template->assign('saved', $saved);
		$this->output('edit.tpl');
	}


	function orderAction()
	{
		$model = new $this->model_class($this->db);

		if (isset($_POST['send']))
		{
			// print_r($_POST); exit;
			$elem = $model->saveOrder($_POST);
			$this->template->assign('saved', true);
		}

		$this->template->assign('elem', $model->getOrder());
		$this->output('order.tpl');
	}
