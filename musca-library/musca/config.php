<?php
	
	/* modified 2013.11.18 */

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
			$sql = "SELECT value FROM musca_config WHERE section='$section' AND name='$name'";
			$value = $this->db->getOne($sql);
		}
		
		function set($section=false, $name=false, $value)
		{
			$sql = "UPDATE musca_config SET value='".mysql_real_escape_string($value)."' 
					WHERE section='$section' AND name='$name'";
			return $this->db->query($sql);
		}

	}