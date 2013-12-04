<?php
	
	/* modified 2013.11.23 */
	/**
	 * Languages avaliable are defined in LANGS variable in config.php file
	 */

	class Musca_I18n
	{
		// array - languages activated in the app
		protected $langs; 
		// DB connection
		protected $db;


		/**
		 * PARAMS
		 * $langs (string) - languages activated in the app, ISO values seperated by coma eg. 'en,es,pl'. first language is the default.
		 * $db - DB connection
		 */
		function __construct($langs, $db=null)
		{
			$this->langs = explode(',', $langs);
			$this->db = $db;
		}



		/* return avaliable languages */
		function getLangs()
		{
			return $this->langs;
		}


		/* select language & save to session */
		function selectLang($iso)
		{
			if (in_array($iso, $this->getLangs())) return $_SESSION[CAPSULE]['lang'] = $iso;
		}


		/* return selected language */
		function getCurrentLang()
		{
			// read from session
			if ($_SESSION[CAPSULE]['lang']) return $_SESSION[CAPSULE]['lang'];

			// detect browser language
			if ($_SERVER['HTTP_ACCEPT_LANGUAGE'])
			{
				$browserIso = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
				if (in_array($browserIso, $this->getLangs()))
					return $this->selectLang($browserIso);
			} 
			
			// default language
			return current($this->getLangs());
		}


		
		/**
		 * translate text
		 * 
		 * @param unknown_type $tag - text to translate
		 * @param unknown_type $section
		 * @param unknown_type $detail
		 * @param unknown_type $params - array()
		 * 							html (bool)		- do not escape. show HTML editor in translatation panel	
		 * 							file (bool)		- file upload
		 * 							image (bool)	- image upload
		 * 							width (int)		- image width
		 * 							height (int)	- image height
		 * 							crop (int)		- image crop
		 * 							admin (bool) 	- admin panel traslation. by dafault use ADMIN constant
		 */
		function t($tag, $section, $detail=null, $params=null)
		{
			if (!$this->db) return 'no DB connection ';

			if (!isset($params['admin'])) $params['admin'] = (defined('ADMIN') && ADMIN);
			if ($params['admin'])	
				$table = 'musca_i18n_admin';
			else
				$table = 'musca_i18n';
			
			$lang = $this->getCurrentLang();
	
	        $tag = $tag_tpl = trim($tag);
			$tag_md5 = md5($tag);
			$str_tag = $tag_md5 ? " AND tag='$tag_md5' " : '';
			$str_section = !empty($section) ? " AND section='$section' " : '';
			$str_detail = !empty($detail) ? " AND detail='$detail' " : '';
			$sqlRow = "SELECT id_i18n, value FROM $table WHERE lang='$lang' $str_tag $str_section $str_detail";
			$return = $this->db->getRow($sqlRow);
			if(empty($return))
			{
			    if(!empty($tag))
			    {
			    	$langs = $this->getLangs();
			    	foreach($langs as $ilang)
			    	{
					    $insert['section'] = $section;
					    $insert['detail'] = !empty($detail) ? $detail : '';
					    $insert['tag'] = $tag_md5;
					    $insert['lang'] = $ilang;
					    $insert['value'] = $tag;
					    $insert['value_tpl'] = $tag_tpl;
					    $insert['html'] = $params['html'];
					    $insert['file'] = $params['file'];
					    $insert['image'] = $params['image'];
					    $insert['width'] = $params['width'];
					    $insert['height'] = $params['height'];
					    $insert['crop'] = $params['crop'];
	
					    @$this->db->insert($table,$insert);
					}
				    $return = $this->db->getRow($sqlRow);
				}
			}
			return stripslashes($return['value']);
		}
		
	}