<?php
	
	/* modified 2014.03.13 */

	/**
	 *	Get & set dynamic configuration stored in DB
	 */

	class Musca_Config
	{

		/* DB connection */
		protected $db;

		function __construct($db=null)
		{
			$this->db = $db;
		}

		function get($section=false, $name=false)
		{
			$sql = "SELECT value FROM ".PRE."musca_config WHERE section='$section' AND name='$name'";
			$value = $this->db->getOne($sql);
		}
		
		function set($section=false, $name=false, $value)
		{
			$sql = "UPDATE ".PRE."musca_config SET value='".mysql_real_escape_string($value)."' 
					WHERE section='$section' AND name='$name'";
			return $this->db->query($sql);
		}

	}