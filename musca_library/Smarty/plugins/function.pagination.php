<?php

	/**
	 * modified 2013.08.01 by Kuba Markiewicz
	 */
/*
	function smarty_function_pagination($params, &$smarty) 
	{
		$count = isset($params['count'])? intval($params['count']) : trigger_error('smarty_function_paginador: missing count parameter');
		$limit = isset($params['limit'])? intval($params['limit']) : trigger_error('smarty_function_paginador: missing limit parameter');
		$page = isset($params['page'])? intval($params['page']) : trigger_error('smarty_function_paginador: missing page parameter');

		$pageCount = ceil($count/$limit);
		if ($pageCount<2) return '';
		
		$html = '';

		// left arrow
		if ($page > 0) $html .= '<a href="?page='.($page-1).'" class="prev">&laquo;</a> '; 
	
		// numbers
		for ($i=0; $i<$pageCount; $i++) 
		{
			if ($i==$page) $html .= '<span class="current">'.($i+1).'</span> ';
			else $html .= '<a href="?page='.$i.'">'.($i+1).'</a> ';
		}
		
		// right arrow
		if ($page < $pageCount-1) $html .= '<a href="'.$base.'?page='.($page+1).'" class="next">&raquo;</a>';

		return $html;
	}

*/
	function smarty_function_pagination($params, &$smarty) 
	{
		$count = isset($params['count'])? intval($params['count']) : trigger_error('smarty_function_paginador: missing count parameter');
		$limit = isset($params['limit'])? intval($params['limit']) : trigger_error('smarty_function_paginador: missing limit parameter');
		$page = isset($params['page'])? intval($params['page']) : trigger_error('smarty_function_paginador: missing page parameter');

		$pageCount = ceil($count/$limit);
		if ($pageCount<2) return '';
		
		$html = '';

		// left arrow
		if ($page > 0) $html .= '<li><a href="?page='.($page-1).'" class="prev">&laquo;</a></li>'; 
		else $html .= '<li class="disabled"><span>&laquo;</span></li>'; 
	
		// numbers
		for ($i=0; $i<$pageCount; $i++) 
		{
			if ($i==$page) $html .= '<li class="active"><span class="current">'.($i+1).'</span></a></li>';
			else $html .= '<li><a href="?page='.$i.'">'.($i+1).'</a></li>';
		}
		
		// right arrow
		if ($page < $pageCount-1) $html .= '<li><a href="'.$base.'?page='.($page+1).'" class="next">&raquo;</a></li>';
		else $html .= '<li class="disabled"><span>&raquo;</span></li>'; 

		return $html;
	}

?>
<!--  -->