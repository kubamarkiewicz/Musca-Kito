<div class="colLeft">

	<fieldset>
		<legend>{t section="$modul"}Section{/t}</legend>
		{foreach $sections as $item}
			<p><a href="{$musca_url}/musca_translation_admin/block/{$item}/{$lang_start}/{$lang_end}" {if $item==$section}style="font-weight:bold"{/if}>{$item}</a></p>
		{/foreach}
	</fieldset>

	<div class="pad ui-corner-all">
		<ul>
			<li><a class="fg-button ui-state-default ui-corner-all" href="{$musca_url}/{$modul}"><img src="{$musca_url}/css/buttons/search.png" />{t section="buttons"}Search{/t}</a></li>
		</ul>
	</div>

</div>




<div class="colRight">
	
	{include file="$modul/buttons.tpl"}
	{include file="support.tpl"}


	<fieldset>
		<legend>{t section="$modul"}Language{/t}</legend>
		<form id="form_block">
			<table width="95%">
				<tr>
					<td>
					    {t section="$modul"}Translate from{/t}
						<select name="lang_start" id="lang_start">
						{foreach from=$langs item=lang key=k}
							<option value="{$lang}" {if $lang_start==$lang}selected="selected"{/if}>{t section="$modul"}{$lang}{/t}</option>
						{/foreach}
						</select>
					</td>
					<td>
					    {t section="$modul"}Translate to{/t}
						<select name="lang_end" id="lang_end">
						{foreach from=$langs item=lang key=k}
							<option value="{$lang}" {if $lang_end==$lang}selected="selected"{/if}>{t section="$modul"}{$lang}{/t}</option>
						{/foreach}
						</select>
					</td>
				</tr>
			</table>
		</form>
	</fieldset>
	
	<script type="text/JavaScript">
	
		$(function(){
	
			$('#form_block select').change(function(){
				var lang_start = $('#lang_start').val();
				var lang_end = $('#lang_end').val();
				var url = '{$musca_url}/musca_translation_admin/block/{$section}/'+lang_start+'/'+lang_end;
				document.location = url;
			});
	
			$('#block textarea').focus(function(e){
			    $(this).select();
			})
	
		});
	
	</script>
	
	<fieldset>
		<legend>{t section="$modul"}Translations{/t}</legend>
		<form id="form_send" method="post" enctype="multipart/form-data">
			<input type="hidden" name="send" value="1" />
			<input type="hidden" name="section" value="{$section}" />
			<input type="hidden" name="lang" value="{$lang_end}" />
			<input type="hidden" name="MAX_FILE_SIZE" value="{$MAX_FILE_SIZE}" />
			<table width="100%" id="block">
			{foreach from=$return.$lang_start item=ir key=kr}
			    <tr>
			        <td width="400">
			        	<p>
			        		{if $ir.file}
								<a href="{$return.$lang_start.$kr.value}" target="_blank">{$return.$lang_start.$kr.value}</a>
							{elseif $ir.image}
								{if $return.$lang_start.$kr.value}
									<a href="{$return.$lang_start.$kr.value}" target="_blank"><img src="{$return.$lang_start.$kr.value}" alt="" class="tranlsation_thumb" /></a>
								{/if}
							{else}
				        		{$return.$lang_start.$kr.value}
							{/if}
			        	</p>
			        </td>
			        <td width="20"></td>
			        <td>
			        	{if $ir.file}
			        		<a href="{$return.$lang_start.$kr.value}" target="_blank">{$return.$lang_end.$kr.value}</a>
							<p class="mensaje"><input name="files[{$kr}]" type="file" /> {t section="$modul"}Maximum file size is{/t} <strong>{$MAX_FILE_SIZE_HUMAN}</strong></p>
						{elseif $ir.image}
							{if $return.$lang_end.$kr.value}
								<a href="{$return.$lang_end.$kr.value}" target="_blank"><img src="{$return.$lang_end.$kr.value}" alt="" class="tranlsation_thumb" /></a>
							{/if}
							<p class="mensaje"><input name="images[{$kr}]" type="file" /> {t section="$modul"}Image will be resized to{/t} <strong>{$ir.width}x{$ir.height}</strong> px. {t section="$modul"}Maximum file size is{/t} <strong>{$MAX_FILE_SIZE_HUMAN}</strong></p>
						{else}
			        		<textarea name="tags[{$kr}]" class="{if $return.$lang_end.$kr.html}tinymce{/if}" style="height: {if $return.$lang_end.$kr.html}80{else}22{/if}px; ">{$return.$lang_end.$kr.value|@stripslashes}</textarea>
			        	{/if}
			        </td>
				</tr>
			{/foreach}
			</table>
		</form>
	</fieldset>
	
	<script type="text/JavaScript">
		{if $saved}
			var message = '<p class="aviso success">{t section="message"}Data has been saved successfully.{/t}</p>';
			$('#messages div').html(message).fadeIn('slow');
		{/if}
	{literal}
		$(function(){
			$('a.save').click(function(){
				$('#form_send').submit();
				return false;
			});
		});
	{/literal}
	</script>
</div>
