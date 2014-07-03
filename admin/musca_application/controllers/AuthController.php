<?php

	/* modified 2014.05.29 */
	
	class AuthController extends Musca_Controller
	{

        private $utils_db;
        protected $logic;

		function __construct($db, $i18n, $template, $config, $auth)
		{			
			$this->logic = $auth;
			parent::__construct($db, $i18n, $template, $config);
		}

		function indexAction()
		{
			if (isset($_POST['send']))
			{
            	$this->utils_db = new Musca_Utils_DB($this->db);
				$username = $this->utils_db->clean_user_input(trim($_POST['username']));
				$password_md5 = md5($this->utils_db->clean_user_input(trim($_POST['password'])));
				$password_sha1 = sha1($this->utils_db->clean_user_input(trim($_POST['password'])));

				$sql = "SELECT id_auth, username FROM ".PRE."musca_auth WHERE username='$username' AND (password='$password_md5' OR password='$password_sha1') AND enabled=1";
				$auth = $this->db->getRow($sql);
				if (!empty($auth))
				{
					$this->logic->login($auth);
					header('Location: ' . MUSCA_URL);
				}
				$this->template->assign('elems', $_POST);
			}
			$this->template->display('auth.tpl');
		}
		
		function logoutAction()
		{
			$this->logic->logout();
			header('Location: ' . MUSCA_URL);
		}
		
	}
