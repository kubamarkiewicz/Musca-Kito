<?php

	class IndexController extends App_Controller
	{
		protected $modul = 'musca_translation_admin';
		protected $module_title = 'Administration Translations';

		protected $flex_table = 'musca_i18n_admin';
		protected $flex_fields = 'id_i18n, lang, section, label, value, value_tpl, date_modified';
	    protected $flex_col_model = array(
										array('display' => 'ID', 'name' => 'id_i18n_lang', 'width' => 25, 'sortable' => true, 'align' => 'right'),
										array('display' => 'Lang', 'name' => 'lang', 'width' => 50, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Section', 'name' => 'section', 'width' => 120, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Label', 'name' => 'label', 'width' => 120, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Translated', 'name' => 'value', 'width' => 400, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Original', 'name' => 'value_tpl', 'width' => 250, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Modified', 'name' => 'date_modified', 'width' => 120, 'sortable' => true, 'align' => 'left')
									);
        protected $flex_sortname = 'id_i18n';
        protected $flex_sortorder = 'ASC';
		

		function __construct($db, $i18n, $auth)
		{
			parent::__construct($db, $i18n, $auth);

			$this->flex_buttons = "buttons : [ {name: '".$this->i18n->t('Edit', 'grid')."', bclass: 'edit', onpress: test}, {name: '".$this->i18n->t('Delete', 'grid')."', bclass: 'delete', onpress: test}, {name: '".$this->i18n->t('Select all', 'grid')."', bclass : 'select', onpress : test}, {name: '".$this->i18n->t('Deselect all', 'grid')."', bclass : 'des-select', onpress : test} ],";
		}


		protected function getLangs()
		{
			return $this->i18n->getLangs();
		}


		function indexAction()
		{	
			$this->template->assign('colModel', json_encode($this->flex_col_model));
			$this->template->assign('sortname', $this->flex_sortname);
			$this->template->assign('sortorder', $this->flex_sortorder);
			$this->template->assign('modul', $this->modul);

			$this->template->assign('translations_langs', $this->getLangs());
			$model = new Model_Musca_TranslationAdmin($this->db);
			$this->template->assign('sections', $model->getSections());
			
			$this->output($this->modul.'/list.tpl', 0);
		}
		
		function addAction()
		{
			$this->edit($this->db->getOne("SELECT MAX(id_i18n) FROM ".PRE.$this->flex_table)+1);
		}

		function editAction($id=false)
		{
			$this->setEditIds($id, $this->modul, $this->flex_table, 'id_i18n', 'section');

			$model = new Model_Musca_TranslationAdmin($this->db);
			if (isset($_POST['send']))
			{
				$model->save($_POST, $id);
				$this->template->assign('saved', true);
			}
			if (!$id) $this->first();
			$elem = $model->get($id);

			$this->template->assign('elem', $elem);
			$this->template->assign('id',$id);
			$this->template->assign('translations_langs', $this->getLangs());
			$this->output($this->modul.'/edit.tpl', 1);
		}

		function blockAction($section=false)
		{
			$section = $this->db->link->real_escape_string($section);

			$langs =  $this->getLangs();
			$this->template->assign('translations_langs', $langs);

			$model = new Model_Musca_TranslationAdmin($this->db);
			$sections = $model->getSections();
			$this->template->assign('sections', $sections);

		    if (!$section) $section = current($sections);
		    $section = addslashes($section);
		    $this->template->assign('section', $section);

			if(!empty($_POST['send']))
			{
				// print_r($_POST); exit;
				$tags = (!empty($_POST['tags']) && is_array($_POST['tags'])) ? $_POST['tags'] : array();
				
				// upload files
				// print_r($_FILES); exit;
				if ($_FILES['files']) foreach ($_FILES['files']['name'] as $tag => $value) 
					foreach ($langs as $lang) 
						if ($_FILES['files']['name'][$tag][$lang])
						{
							$file = $model->uploadFile('files', $tag, $lang);
							if ($file) $tags[$tag][$lang] = $file;
						}	

				// upload images
				// print_r($_FILES); exit;
				if ($_FILES['images']) foreach ($_FILES['images']['name'] as $tag => $value) {
					$parameters = $model->getParametersByTag($tag);
					// $tags[$tag] = $model->uploadImage('images', $tag, $parameters);
				}
				if ($_FILES['images']) foreach ($_FILES['images']['name'] as $tag => $value) 
					foreach ($langs as $lang) 
						if ($_FILES['images']['name'][$tag][$lang])
						{
							$parameters = $model->getParametersByTag($tag);
							$file = $model->uploadImage('images', $tag, $lang, $parameters);
							if ($file) $tags[$tag][$lang] = $file;
						}

				foreach($tags as $tag => $values)
				{
					$tag = $this->db->link->real_escape_string($tag);
					foreach($values as $lang => $value)
					{
					    $update = array();
					    $update['value'] = $value;
					    $lang = $this->db->link->real_escape_string($lang);
					    $this->db->update(PRE.$this->flex_table,$update,"section='$section' AND lang='$lang' AND tag='$tag'");
					}

				}
				$this->template->assign('saved', true);
			}
		    
		    $sql = "SELECT * FROM ".PRE.$this->flex_table." WHERE section='$section' ORDER BY id_i18n";
		    $result = $this->db->getAll($sql);
		    $return = array();
		    foreach($result as $item) 
		    {
		    	$return[$item['lang']][$item['tag']] = $item;
		    }
		    // print_r($return); exit;
		    $this->template->assign('return', $return);

		    $this->output($this->modul.'/block.tpl', 0);
		}


		function delAction()
		{
			if (!$this->getAuth($this->modul) || !isset($_POST['ids'])) die();
			$del = $this->db->getAssoc("SELECT tag, section FROM ".PRE.$this->flex_table." WHERE id_i18n IN (".rtrim($_POST['ids'],",").")");
			foreach ($del as $tag => $section) $this->db->delete($this->flex_table, "section='$section' AND tag='$tag'");
		}

		function flexGridAction() { parent::flexGrid(); }

	}
