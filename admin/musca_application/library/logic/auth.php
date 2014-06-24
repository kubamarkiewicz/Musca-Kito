<?php

	/* modified 2014.05.29 */

	class Logic_Auth
	{
		
		function authorize()
		{
			if (!$_SESSION[CAPSULE]['auth']['id_auth'])
			{
				header('Location: ' . MUSCA_URL.'/auth');
				exit;
			}
		}
		
		function login($auth)
		{
			$_SESSION[CAPSULE]['auth'] = $auth;
		}

		function logout()
		{
			unset($_SESSION[CAPSULE]['auth']);
		}

	}
