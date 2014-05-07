<div class="colLeft">

	<fieldset>
		<legend>{t section="$modul"}Section{/t}</legend>
		{foreach $sections as $item}
			<p><a href="{$musca_url}/musca_translation/block/{$item}" {if $item==$section}style="font-weight:bold"{/if}>{$item}</a></p>
		{/foreach}
	</fieldset>

	<div class="pad ui-corner-all">
		<ul>
			<li><a class="fg-button ui-state-default ui-corner-all" href="{$musca_url}/{$modul}"><img src="{$musca_url}/css/buttons/search.png" />{t section="buttons"}Search{/t}</a></li>
		</ul>
	</div>

</div>




<div class="colRight">
	
	<div class="pad ui-corner-all">
		<ul>
			<li><a class="fg-button ui-state-default ui-corner-all save" href="{$musca_url}/{$modul}/{if $id}edit/{$id}{else}add{/if}"><img src="{$musca_url}/css/buttons/save.png" />{t section="buttons"}Save{/t}</a></li>
		</ul>
	</div>
	
	{include file="support.tpl"}

	<form id="form_send" method="post" enctype="multipart/form-data">
		<fieldset>
			<!-- <legend>{t section="$modul"}Translations{/t}</legend> -->
			<input type="hidden" name="send" value="1" />
			<input type="hidden" name="section" value="{$section}" />
			<input type="hidden" name="lang" value="{$lang_end}" />
			<input type="hidden" name="MAX_FILE_SIZE" value="{$MAX_FILE_SIZE}" />

			<div id="tabs_basic_i18n">
				<ul {if $web_langs|@count <= 1}style="display:none"{/if}>
					{foreach from=$web_langs item=iso key=k}
				    <li><a href="#{$iso}"><span>{t page="admin"}{$iso}{/t}</span></a></li>
					{/foreach}
				</ul>
				{foreach from=$web_langs item=iso key=k}
				<div id="{$iso}">
					<fieldset>
						<table id="block">
						{foreach $return.$iso as $item}
						    <tr>
						        <td>
						        	{if $item.label}
						        		<p class="label">{$item.label}</p>
						        	{/if}	
						        	{if $item.file}
						        		<div class="group">
							        		{if $item.value}
							        			<p><a href="{$item.value}" target="_blank"><strong>File:</strong> {$item.value}</a></p>
							        		{/if}
											<p class="mensaje">{t section="$modul"}Upload file:{/t} <input name="files[{$item.tag}][{$iso}]" type="file" /> {t section="$modul"}Maximum file size is{/t} <strong>{$MAX_FILE_SIZE_HUMAN}</strong></p>
						        		</div>
									{elseif $item.image}
						        		<div class="group">
											{if $item.value}
												<p>
													<a href="{$item.value}" target="_blank"><img src="{$item.value}" alt="" class="tranlsation_thumb" /></a>
												</p>
											{/if}
											<p class="mensaje">{t section="$modul"}Upload image:{/t} <input name="images[{$item.tag}][{$iso}]" type="file" /> {t section="$modul"}Image will be resized to{/t} <strong>{$item.width}x{$item.height}</strong> px. {t section="$modul"}Maximum file size is{/t} <strong>{$MAX_FILE_SIZE_HUMAN}</strong></p>
										</div>
									{else}
						        		<textarea name="tags[{$item.tag}][{$iso}]" class="{if $item.html}tinymce{/if}">{$item.value|@stripslashes}</textarea>
						        	{/if}
						        </td>
							</tr>
						{/foreach}
						</table>
					</fieldset>
				</div>
				{/foreach}
			</div>

		</fieldset>
	</form>
	
	<script type="text/JavaScript">
		{if $saved}
			var message = '<p class="aviso success">{t section="message"}Data has been saved successfully.{/t}</p>';
			$('#messages div').html(message).fadeIn('slow');
		{/if}
	{literal}
		$(function(){
			$('#tabs_basic_i18n').tabs();

			$('a.save').click(function(){
				$('#form_send').submit();
				return false;
			});
		});
	{/literal}
	</script>
</div>
