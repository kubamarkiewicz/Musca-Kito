{include file="support.tpl"}

<form id="form_send" method="post" autocomplete="off">
    <input type="hidden" name="send" value="1" />
	<fieldset>
    	<legend>{t section="set_order"}Drag & drop to change order{/t}</legend>
    	<div id="order">
    	    {foreach from=$elem item=e name=orden}
			<div class="order_item" id="pos_{$smarty.foreach.orden.index}">
				<input type="hidden" name="order[{$e.id}]" value="{$e.id}" /> {$e.name}
			</div>
			{/foreach}
		</div>
	</fieldset>
</form>


<div class="pad ui-corner-all">
	<ul>
		<li><a class="fg-button ui-state-default ui-corner-all save" href="{$musca_url}/{$modul}/order"><img src="{$musca_url}/css/buttons/save.png" />{t section="buttons"}Save{/t}</a></li>
		<li><a class="fg-button ui-state-default ui-corner-all return" href="{$musca_url}/{$modul}"><img src="{$musca_url}/css/buttons/return.png" />{t section="buttons"}Back{/t}</a></li>
	</ul>
</div>

<script src="{$musca_url}/js/jquery.sortable.js" type="text/javascript"></script>
<script type="text/javascript">
	{if $saved}
		var message = '<p class="aviso success">{t section="message"}Data has been saved successfully.{/t}</p>';
		$('#messages div').html(message).fadeIn('slow');
	{/if}

	var saved = '{$saved}';

	$('.save').click(function(){
		$('#form_send').attr('action', $(this).attr('href'))
		$('#form_send').submit();
		return false;
	});
	
	$(function () {
		$('#order').Sortable({
			accept : 'order_item',
			opacity: 1,
			axis :	'vertically'
		});
	});
</script>
