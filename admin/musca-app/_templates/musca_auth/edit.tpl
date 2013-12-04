{include file="support.tpl"}

<form id="form_send" method="post" autocomplete="off">
	<input type="hidden" name="send" value="1" />
	<fieldset>
		<table width="95%">
			<tr>
				<th width="20%">{t section="fields"}Name{/t}</th>
				<td><input type="text" name="name" value="{$elem.name}" size="20" /></td>
			</tr>
			<tr>
				<th>{t section="$modul"}Login:{/t}</th>
				<td><input type="text" name="username" value="{$elem.username}" size="20" /></td>
			</tr>
			<tr>
				<th>{t section="$modul"}Password:{/t}</th>
				<td><input type="password" name="password" id="password" value="" size="20" /></td>
			</tr>
			<tr>
				<th>{t section="$modul"}Repeat password:{/t}</th>
				<td><input type="password" name="confirm_password" value="" size="20" /></td>
			</tr>
			<tr>
			    <th>{t section="$modul"}Role:{/t}</th>
			    <td>
			        <select name="id_auth_rol" {if $elem.indelible}disabled="1"{/if}>
					{html_options options=$rol selected=$elem.id_auth_rol}
					</select>
				</td>
			</tr>
			<tr>
				<th>{t section="$modul"}Activated:{/t}</th>
				<td>
					<input type="checkbox" name="enabled" value="1" {if $elem.indelible}disabled="1" checked="1"{else}{if $elem.enabled}checked="1"{/if}{/if} />
					{if $elem.indelible}<input type="hidden" name="enabled" value="1" />{/if}
				</td>
			</tr>
		</table>
	</fieldset>
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
				name:				{ required: true },
				{if !$id}
					password:			{ required: true },
					confirm_password:	{ required: true, equalTo: "#password" }
				{else}
					confirm_password:	{ equalTo: "#password" }
				{/if}
			},
			messages: {
				confirm_password: 	{ equalTo: '{t section="$modul"}Passwords do not match{/t}' }
			}
		});

        // override default validation messages
        $.extend($.validator.messages, {
            required: '{t section="message"}This field is required{/t}'
        });
		
		$(function () {
			$('#categorias').tabs();
		});
</script>
