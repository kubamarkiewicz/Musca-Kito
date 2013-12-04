{include file="support.tpl"}

{include file="buttons.tpl"}

<form id="form_send" method="post">
	<input type="hidden" name="send" value="1" />
	<div id="basic_tabs">
		<ul>
		    <li><a href="#tab_basic"><span>Información Basica</span></a></li>
		    <li><a href="#tab_modul_user"><span>Modulos</span></a></li>
		    {if $smarty.session[$smarty.const.CAPSULE]['auth']['id_auth_rol']==1}<li><a href="#tab_modul_admin"><span>Admin Modulos</span></a></li>{/if}
		</ul>
		<div id="tab_basic">
			<fieldset>
				<table width="95%">
					<tr>
						<th width="20%">{t section="fields"}Name{/t}</th>
						<td><input type="text" name="name" value="{$elem.name}" size="25" maxlength="100" /></td>
					</tr>
					<tr>
						<th width="20%">{t section="$modul"}Descripción:{/t}</th>
						<td><textarea name="description" cols="40" rows="4">{$elem.description}</textarea></td>
					</tr>
					<tr>
						<th>{t section="$modul"}Activated:{/t}</th>
						<td><input type="checkbox" name="enabled" value="1" {if $elem.enabled}checked="1"{/if} /></td>
					</tr>
				</table>
			</fieldset>
		</div>
		<div id="tab_modul_user">
		    <fieldset>
		        <legend>Módulos a los que tendrá permiso</legend>
				<div class="cuartilla">
				    <input type="hidden" name="mods[start]" value="start" checked="checked" />
					{foreach from=$modul_user item=name key=slug}
					    {if $slug!='start'}
					    <span>
							<input type="checkbox" name="mods[{$slug}]" value="{$slug}" {if $elem.mods.$slug}checked="checked"{/if} /> {$name}
						</span>
						{/if}
					{/foreach}
				</div>
			</fieldset>
		</div>
		{if $smarty.session[$smarty.const.CAPSULE]['auth']['id_auth_rol']==1}
		<div id="tab_modul_admin">
		    <fieldset>
		        <legend>Módulos a los que tendrá permiso</legend>
				<div class="cuartilla">
				    <input type="hidden" name="mods[start]" value="start" checked="checked" />
					{foreach from=$modul_admin item=ma}
						<span>
							<input type="text" name="modul_admin[{$ma.id_mod}][name]" value="{$ma.name}" />
							<input type="checkbox" name="modul_admin[{$ma.id_mod}][enabled]" value="1" {if $ma.enabled}checked="checked"{/if} />
							<p><small><input type="checkbox" name="modul_admin[{$ma.id_mod}][delete]" value="1" /> Eliminar</small></p>
						</span>
					{/foreach}
				</div>
			</fieldset>
		</div>
		{/if}
	</div>
</form>

{include file="buttons.tpl"}

<script type="text/javascript">
	{if $saved}
		var message = '<p class="aviso success">{t section="message"}Data has been saved successfully.{/t}</p>';
		$('#messages div').html(message).fadeIn('slow');
	{/if}

	$('.save').click(function(){
		$('#form_send').attr('action', $(this).attr('href'))
		$('#form_send').submit();
		return false;
	});
	
	$("#form_send").validate({
		event: "blur",
		rules: {
			name: "required"
		},
		messages: {
			name: '{t section="message"}This field is required{/t}'
		}
	});

	$(function () {
		$("#basic_tabs").tabs();
	});
</script>
