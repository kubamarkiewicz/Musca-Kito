<?php

	class Index extends App_Controller
	{
		protected $modul = 'product';
		protected $module_title = 'Product';
		protected $flex_table = 'product';
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
		

		function __construct($db=null, $i18n=null)
		{
			parent::__construct($db, $i18n);

			$this->flex_buttons = "buttons : [ {name: '".$this->i18n->t('Add', 'grid')."', bclass: 'add', onpress: test}, {name: '".$this->i18n->t('Edit', 'grid')."', bclass: 'edit', onpress: test}, {name: '".$this->i18n->t('Delete', 'grid')."', bclass: 'delete', onpress: test}, {name: '".$this->i18n->t('Select all', 'grid')."', bclass : 'select', onpress : test}, {name: '".$this->i18n->t('Deselect all', 'grid')."', bclass : 'des-select', onpress : test} ],";
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

			$model = new Model_Product($this->db);

			if (isset($_POST['send']))
			{
				$elem = $model->save($_POST, $id);
				$id = $elem[$model->PKey()];
				$this->redirect('/'.$this->modul.'/edit/'.$id.'/saved');
			}

			$this->smarty->assign('id', $id);
			$this->smarty->assign('elem', $model->get($id));
			$this->smarty->assign('imageConfig', $model->fieldsConfig['image']);
			$this->smarty->assign('galleryConfig', $model->galleryConfig);
			$this->smarty->assign('saved', $saved);
			$this->output('edit.tpl');
		}


		function order()
		{
			$model = new Model_Product($this->db);

			if (isset($_POST['send']))
			{
				// print_r($_POST); exit;
				$elem = $model->saveOrder($_POST);
				$this->smarty->assign('saved', true);
			}

			$this->smarty->assign('elem', $model->getOrder());
			$this->output('order.tpl');
		}
	}

