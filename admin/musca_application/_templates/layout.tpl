<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>{t section="meta_tags"}CMS{/t} {$smarty.server.SERVER_NAME}</title>

	<link rel="shortcut icon" href="{$musca_url}/../assets/favicon.png">

	<link rel="stylesheet" type="text/css" href="{$musca_url}/css/_style.css" />
	<link rel="stylesheet" type="text/css" href="{$musca_url}/css/_extended.css" />
	<link rel="stylesheet" type="text/css" href="{$musca_url}/css/flexigrid/flexigrid.css" />
	<link rel="stylesheet" type="text/css" href="{$musca_url}/css/superfish/superfish.css" />
	<link rel="stylesheet" type="text/css" href="{$musca_url}/css/themes/default/default.css" />

	{if $list}
	<script type="text/javascript" src="{$musca_url}/js/jquery-1.3.2.min.js"></script>
	{else}
	<script type="text/javascript" src="{$musca_url}/js/jquery-1.7.2.min.js"></script>
	{/if}
	<script type="text/javascript" src="{$musca_url}/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="{$musca_url}/js/jquery-ui-1.8.11.custom.min.js"></script>

	<script type="text/javascript" src="{$musca_url}/js/superfish.js"></script>

	<script type="text/javascript">
	$(function(){
		$('ul.sf-menu').superfish({ 'delay': 1000 });

	    $('input.datepicker').datepicker({ dateFormat: 'yy-mm-dd' });
	});
	</script>


	<script src='{$musca_url}/js/autosize/jquery.autosize.min.js'></script>
	<script>
		$(function(){
			$('textarea').autosize();
		});
	</script>

	{include file="tinymce.tpl"}
</head>
<body class="{$list}">
	<div id="logout">
		<a class="link" href="{$musca_url|dirname}" target="_blank">{$musca_url|dirname|replace:"http://":""}</a> &middot;
		{if $langs|@count gt 1}
			<span class="lang">
				{foreach $langs as $item}
					{if $item == $lang}
						<span>{$item}</span>
					{else}
						<a href="{$musca_url}/{$item}/{$modul}">{$item}</a>
					{/if}
				{/foreach}
			</span> &middot;
		{/if}
		 <big>{$smarty.session[$smarty.const.CAPSULE]['auth']['username']}</big> &middot;
		<a href="{$musca_url}/auth/logout" class="logout">{t section="menu"}Logout{/t}</a>
	</div>

	<div id="menu">
		{include file='menu.tpl'}
	</div>

	<div id="content">
		{if $module_title}<h1 class="title_head">{t section="$modul"}{$module_title}{/t}</h1>{/if}
		{if $tpl}{include file=$tpl}{/if}
	</div>
</body>
</html>
