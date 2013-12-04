{include file="support.tpl"}

<div class="colLeft">

	<fieldset>
		<legend>{t section="$modul"}Section{/t}</legend>
		{foreach $sections as $section}
			<p><a href="{$musca_url}/musca_translation/block/{$section}/{$lang_start}/{$lang_end}">{$section}</a></p>
		{/foreach}
	</fieldset>

</div>


<div class="colRight">
	<fieldset>
		<legend>{t section="$modul"}Search for text{/t}</legend>
		<form id="sform">
			<table width="95%">
				<tr>
					<th>{t section="$modul"}Section{/t}</th>
					<td>
						<select name="search[section]">
						<option value="">{t section="$modul"}All{/t}</option>
						{html_options options=$sections}
						</select>
					</td>
					<th>{t section="$modul"}Language{/t}</th>
					<td>
						<select name="search[lang]">
						{foreach from=$langs item=lang key=k}
							<option value="{$lang}">{$lang}</option>
						{/foreach}
						</select>
					</td>
					<th>{t section="$modul"}Translated text{/t}</th>
					<td>
						<input size="40" type="text" name="search[value]" />
					</td>
					<th>{t section="$modul"}Original text{/t}</th>
					<td>
						<input size="40" type="text" name="search[value_tpl]" />
					</td>
				</tr>
			</table>
		</form>
	</fieldset>

	<script type="text/JavaScript">

		$(function(){
			$('#form_block select[name="section"]').change(function(){
				var section = $('#section').val();
				var lang_start = $('#lang_start').val();
				var lang_end = $('#lang_end').val();
				var url = '{$musca_url}/musca_translation/block/'+section+'/'+lang_start+'/'+lang_end;
				document.location = url;
			});
		});

	</script>

	{include file="grid.tpl"}

</div>