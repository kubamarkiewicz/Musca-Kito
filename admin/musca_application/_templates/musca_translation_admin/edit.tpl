{include file="$modul/buttons.tpl"}
{include file="support.tpl"}

<form id="form_send" method="post" enctype="multipart/form-data">
	<input type="hidden" name="send" value="1" />
	<input type="hidden" name="tag" value="{$elem.tag}" />
	<input type="hidden" name="section" value="{$elem.section}" />
	<input type="hidden" name="MAX_FILE_SIZE" value="{$MAX_FILE_SIZE}" />
	<div id="tabs">
		<ul>
			{foreach from=$translations_langs item=iso key=k}
		    <li><a href="#{$iso}"><span>{t section="$modul"}{$iso}{/t}</span></a></li>
			{/foreach}
		</ul>
		{foreach from=$translations_langs item=iso key=k}
		<div id="{$iso}">
			<fieldset>
			    <!-- <legend>{t page="admin"}{$iso}{/t}</legend> -->
					<table width="95%">
						<tr>
							<td>
								{if $elem.file}
									<a href="{$elem.langs.$iso}" target="_blank">{$elem.langs.$iso}</a>
									<p class="mensaje"><input name="files[{$iso}]" type="file" /> {t section="$modul"}Maximum file size is{/t} <strong>{$MAX_FILE_SIZE_HUMAN}</strong></p>
								{elseif $elem.image}
									{if $elem.langs.$iso}
										<a href="{$elem.langs.$iso}" target="_blank"><img src="{$elem.langs.$iso}" alt="" /></a>
									{/if}
									<p class="mensaje"><input name="images[{$iso}]" type="file" /> {t section="$modul"}Image will be resized to{/t} <strong>{$elem.width}x{$elem.height}</strong> px. {t section="$modul"}Maximum file size is{/t} <strong>{$MAX_FILE_SIZE_HUMAN}</strong></p>
								{else}
									<textarea name="langs[{$iso}]" class="{if $elem.html}tinymce{/if}" style="width: 95%; height: {if $elem.html}80{else}22{/if}px;">{$elem.langs.$iso|@stripslashes}</textarea>
								{/if}
							</td>
						</tr>
					</table>
			</fieldset>
		</div>
		{/foreach}
	</div>
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
			section:	"required",
			tag:		"required"
		},
		messages: {
			section: 	'',
			tag: 		''
		}
	});

	$(function () {
		$('#tabs').tabs();
	});

</script>
