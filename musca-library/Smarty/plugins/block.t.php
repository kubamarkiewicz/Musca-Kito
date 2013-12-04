<?php

	/**
	 * modified 2013.11.18
	 *
	 * params:
	 *
	 * @param string $section
	 * @param string $detail
	 * @param bool $escape = true 	- escape special characters
	 * @param bool $html = false 	- use TinyMCE editor
	 * @param bool $file 			- file upload (URL)
	 * @param bool $image 			- image upload (URL)
	 * @param int $width 			- scale uploaded image to width
	 * @param int $height 			- scale uploaded image to height
	 * @param bool $crop 			- crop uploaded image
	 * @param bool $admin 			- admin panel traslation. by dafault use ADMIN constant
	 *
	 */

	function smarty_block_t($params, $tag, &$smarty)
	{
		$return = $smarty->i18n->t($tag, $params['section'], $params['detail'], $params);
		if ($params['html'] || (isset($params['escape']) && !$params['escape'])) return $return;
		else return htmlspecialchars($return);
	}

