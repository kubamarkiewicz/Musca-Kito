{include file="buttons.tpl"}
{include file="support.tpl"}

<form id="form_send" method="post">
	<input type="hidden" name="send" value="1" />
	<fieldset>
		<table width="95%">
			<tr>
				<th width="20%">Sección</th>
				<td><input type="text" name="section" value="{$elem.section}" size="50" /></td>
			</tr>
			<tr>
				<th>Name (slug)</th>
				<td><input type="text" name="name" value="{$elem.name}" size="50" /></td>
			</tr>
			<tr>
				<th>Descripción</th>
				<td><textarea style="width: 98%; height:16px" name="description">{$elem.description|@stripslashes}</textarea></td>
			</tr>
			<tr>
				<th>Valor</th>
				<td><textarea style="width: 98%; height:16px" name="value">{$elem.value|@stripslashes}</textarea></td>
			</tr>
			<tr>
				<th>{t section="$modul"}User{/t}</th>
				<td>
					<input type="checkbox" name="user_show" value="1" {if $elem.user_show}checked="1"{/if} />
					<span class="mensaje">Lo que verá el usuario en su zona de configuración</span>
				</td>
			</tr>
		</table>
	</fieldset>
</form>

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
			section: "required",
			name: "required"
		},
		messages: {
			section: '{t section="message"}This field is required{/t}',
			name: '{t section="message"}This field is required{/t}'
		}
	});
	
	$(function () {
		$('#categorias').tabs();
	});
	
	$('.modified').click(function(){
		$('.modified').hide();
		$('.save').removeClass('hide').show();
		$('input').attr('disabled', 0);
		$('textarea').attr('disabled', 0);
		return false;
	});
</script>
