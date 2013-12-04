<?php

	/* modified 2013.09.30 */
	
	class App_Auth extends Musca_Controller
	{
        private $utils_db;

		function auth()
		{
			if (isset($_POST['send']))
			{
            	$this->utils_db = new Musca_Utils_DB($this->db);
				$username = $this->utils_db->clean_user_input(trim($_POST['username']));
				$password_md5 = md5($this->utils_db->clean_user_input(trim($_POST['password'])));
				$password_sha1 = sha1($this->utils_db->clean_user_input(trim($_POST['password'])));

				$sql = "SELECT id_auth, name, id_auth_rol, indelible FROM musca_auth WHERE username='$username' AND (password='$password_md5' OR password='$password_sha1') AND enabled=1";
				$auth = $this->db->getRow($sql);
				if (!empty($auth))
				{
					// $auth['mods'] = $this->db->getAssoc("SELECT slug, slug FROM musca_mod_auth_rol_rel WHERE id_auth_rol=".$auth['id_auth_rol']);
					$_SESSION[CAPSULE]['auth'] = $auth;
					header('Location: ' . MUSCA_URL);
				}
				$this->smarty->assign('elems', $_POST);
			}
			$this->smarty->display('auth.tpl');
		}
		
		function getAuth($modul=false)
		{
/*
			if(!empty($_SESSION[CAPSULE]['auth']['id_auth_rol']) && $_SESSION[CAPSULE]['auth']['id_auth_rol']==1) return $_SESSION[CAPSULE]['auth'];

			$auth_rol = $this->db->getAssoc("SELECT DISTINCT id_auth_rol, id_auth_rol FROM musca_mod_auth_rol_rel WHERE slug='$modul'");
		    if (!empty($_SESSION[CAPSULE]['auth']) && is_array($auth_rol) && in_array($_SESSION[CAPSULE]['auth']['id_auth_rol'], $auth_rol)) return $_SESSION[CAPSULE]['auth'];
			else
			{
			    unset($_SESSION[CAPSULE]['auth']);
			    return false;
			}
			*/
			
			// kuba
			if (!empty($_SESSION[CAPSULE]['auth']['id_auth'])) return $_SESSION[CAPSULE]['auth'];
		}
		
		function logout()
		{
			unset($_SESSION[CAPSULE]['auth']);
			header('Location: ' . MUSCA_URL);
		}
	}
