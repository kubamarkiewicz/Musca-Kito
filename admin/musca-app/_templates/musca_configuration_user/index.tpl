{include file="support.tpl"}

<form id="form_send" method="post">
	<fieldset>
			{foreach from=$elem item=s key=ks}
			<table width="95%">
				<tr>
					<td>
						<p class="mensaje">{$s.description}</p>
						<input type="text" name="config[{$s.id_config}][value]" value="{$s.value|addslashes}" />
					</td>
				</tr>
			</table>
			{/foreach}
	</fieldset>
</form>

{include file="{$modul}/buttons.tpl"}

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
</script>
