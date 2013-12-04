<?php

	/**
	 * modified 2013.05.22 by Kuba Markiewicz
	 */

	class Musca_Utils_Log
	{
		static public $log_file = '/musca-app/log.txt';

		static function log($message)
		{
			// todo: set write permission
			file_put_contents(MUSCA_PATH.SELF::log_file, '['.date("Y-m-d H:i:s")."]\n$message\n\n", FILE_APPEND);
		}
	}
