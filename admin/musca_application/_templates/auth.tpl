<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="es" xml:lang="es" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<link rel="shortcut icon" href="{$musca_url}/../assets/favicon.png">

	<link rel="stylesheet" type="text/css" href="{$musca_url}/css/_auth.css" />
	<title>{t section="meta_tags"}CMS{/t} {$smarty.server.SERVER_NAME}</title>
</head>
<body>
	<form id="login-form"  method="post">
        <input type="hidden" name="send" value="1" class="hide" />
		<fieldset>
			<legend>Entrar</legend>

			<label for="login">{t section="login"}Username{/t}</label>
            <input type="text" id="login" name="username" value="{$elems.username}" />
			<div class="clear"></div>

			<label for="password">{t section="login"}Password{/t}</label>
            <input type="password" id="password" name="password" />
			<div class="clear"></div>

			<br />

			<input type="submit" style="margin: -20px 0 0 287px;" class="button" name="commit" value="{t section="login"}Enter{/t}"/>
		</fieldset>
	</form>
</body>
</html>
