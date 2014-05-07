<?php

	/* modified 2013.11.18 */

	require_once('Smarty/Smarty.class.php');

	class Musca_Smarty extends Smarty
	{
		public $i18n;

		function __construct($i18n=null)
		{
			$this->i18n = $i18n;
			parent::__construct();
		}

	}
