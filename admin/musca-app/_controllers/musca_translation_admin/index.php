<?php

	class Index extends App_Controller
	{
		protected $modul = 'musca_translation_admin';
		protected $module_title = 'Administration Translations';

		protected $flex_table = 'musca_i18n_admin';
		protected $flex_fields = 'id_i18n, lang, section, detail, value, value_tpl, date_modified';
	    protected $flex_col_model = array(
										array('display' => 'ID', 'name' => 'id_i18n_lang', 'width' => 25, 'sortable' => true, 'align' => 'right'),
										array('display' => 'Lang', 'name' => 'lang', 'width' => 50, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Section', 'name' => 'section', 'width' => 120, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Detail', 'name' => 'detail', 'width' => 120, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Translated', 'name' => 'value', 'width' => 400, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Original', 'name' => 'value_tpl', 'width' => 250, 'sortable' => true, 'align' => 'left'),
										array('display' => 'Modified', 'name' => 'date_modified', 'width' => 120, 'sortable' => true, 'align' => 'left')
									);
        protected $flex_sortname = 'id_i18n';
        protected $flex_sortorder = 'ASC';
		

		function __construct($db, $i18n)
		{
			parent::__construct($db, $i18n);

			$this->flex_buttons = "buttons : [ {name: '".$this->i18n->t('Edit', 'grid')."', bclass: 'edit', onpress: test}, {name: '".$this->i18n->t('Delete', 'grid')."', bclass: 'delete', onpress: test}, {name: '".$this->i18n->t('Select all', 'grid')."', bclass : 'select', onpress : test}, {name: '".$this->i18n->t('Deselect all', 'grid')."', bclass : 'des-select', onpress : test} ],";
		}


		function first()
		{	
			$this->smarty->assign('colModel', json_encode($this->flex_col_model));
			$this->smarty->assign('sortname', $this->flex_sortname);
			$this->smarty->assign('sortorder', $this->flex_sortorder);
			$this->smarty->assign('modul', $this->modul);

			$this->smarty->assign('langs', $this->i18n->getLangs());
			$admin = new Model_Musca_TranslationAdmin($this->db);
			$this->smarty->assign('sections', $admin->getSections());
			
			$this->output($this->modul.'/list.tpl', 0);
		}
		
		function add()
		{
			$this->edit($this->db->getOne("SELECT MAX(id_i18n) FROM musca_i18n_admin")+1);
		}

		function edit($id=false)
		{
			$this->setEditIds($id, $this->modul, $this->flex_table, 'id_i18n', 'section');

			$admin = new Model_Musca_TranslationAdmin($this->db);
			if (isset($_POST['send']))
			{
				$admin->save($_POST, $id);
				$this->smarty->assign('saved', true);
			}
			if (!$id) $this->first();
			$elem = $admin->get($id);

			$this->smarty->assign('elem', $elem);
			$this->smarty->assign('id',$id);
			$this->smarty->assign('langs', $this->i18n->getLangs());
			$this->output($this->modul.'/edit.tpl', 1);
		}
		
		function block($section=false, $lang_start=false, $lang_end=false)
		{
			$admin = new Model_Musca_TranslationAdmin($this->db);

			if(!empty($_POST['send']))
			{
				// print_r($_POST); exit;
				$lang = $_POST['lang'];
				$tags = (!empty($_POST['tags']) && is_array($_POST['tags'])) ? $_POST['tags'] : array();
				
				// upload files
				// print_r($_FILES); exit;
				if ($_FILES['files']) foreach ($_FILES['files']['name'] as $tag => $value) {
					$tags[$tag] = $admin->uploadFile('files', $tag);
				}	

				// upload images
				// print_r($_FILES); exit;
				if ($_FILES['images']) foreach ($_FILES['images']['name'] as $tag => $value) {
					$parameters = $admin->getParametersByTag($tag);
					$tags[$tag] = $admin->uploadImage('images', $tag, $parameters);
				}

				foreach($tags as $tag => $value)
				{
				    $update = array();
				    $update['value'] = $value;
				    $this->db->update('musca_i18n_admin',$update,"section='$section' AND lang='$lang' AND tag='$tag'");
				}
				$this->smarty->assign('saved', true);
			}

			$admin = new Model_Musca_TranslationAdmin($this->db);
			$sections = $admin->getSections();
			$this->smarty->assign('sections', $sections);

		    if (!$section) $section = current($sections);
		    $section = addslashes($section);
		    $this->smarty->assign('section', $section);
		    
		    $langs = $this->i18n->getLangs();

		    $lang_start = $lang_start ? addslashes($lang_start) : $langs[0];
		    $this->smarty->assign('lang_start', $lang_start);
		    
		    $lang_end = $lang_end ? addslashes($lang_end) : $langs[0];
		    $this->smarty->assign('lang_end', $lang_end);
		    
		    $res = $this->db->getAll("SELECT * FROM musca_i18n_admin WHERE section='$section' AND lang in ('$lang_start', '$lang_end') ORDER BY id_i18n");
		    $return = array();
		    foreach($res as $k => $v) 
		    {
		    	$return[$v['lang']][$v['tag']] = $v;
		    }
		    $this->smarty->assign('return', $return);

			$this->smarty->assign('langs', $this->i18n->getLangs());

		    $this->output($this->modul.'/block.tpl', 0);
		}


		function del()
		{
			if (!$this->getAuth($this->modul) || !isset($_POST['ids'])) die();
			$del = $this->db->getAssoc("SELECT tag, section FROM musca_i18n_admin WHERE id_i18n IN (".rtrim($_POST['ids'],",").")");
			foreach ($del as $tag => $section) $this->db->delete($this->flex_table, "section='$section' AND tag='$tag'");
		}

		function flexGrid() { parent::flexGrid(); }

	}
