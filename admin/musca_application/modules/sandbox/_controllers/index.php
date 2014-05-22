<?php

	/* modified 2013.11.17 */

	class Index extends App_Controller
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
		

	function __construct($db=null, $i18n=null)
	{
		parent::__construct($db, $i18n);
		$this->smarty->assign('MAX_FILE_SIZE', Musca_Utils_Upload::maxUpload());
		$this->smarty->assign('MAX_FILE_SIZE_HUMAN', Musca_Utils_Upload::maxUpload(1));
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

		$model = new $this->model_class($this->db);

		if (isset($_POST['send']))
		{
			$elem = $model->save($_POST, $id);
			$id = $elem[$this->db->getPKeyColumn($this->flex_table)];
			$this->redirect('/'.$this->modul.'/edit/'.$id.'/saved');
		}

		$this->smarty->assign('id', $id);
		$this->smarty->assign('elem', $model->get($id));
		$this->smarty->assign('model', $model);
		$this->smarty->assign('saved', $saved);
		$this->output('edit.tpl');
	}


	function order()
	{
		$model = new $this->model_class($this->db);

		if (isset($_POST['send']))
		{
			// print_r($_POST); exit;
			$elem = $model->saveOrder($_POST);
			$this->smarty->assign('saved', true);
		}

		$this->smarty->assign('elem', $model->getOrder());
		$this->output('order.tpl');
	}
