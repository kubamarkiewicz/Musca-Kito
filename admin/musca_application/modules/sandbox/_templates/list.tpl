{include file="support.tpl"}

<fieldset>
	<legend>{t section="listing"}Search{/t}</legend>
	<form id="sform" method="post">
		<table>
			<tr>
				<th>{t section="fields"}Name{/t}</th>
				<td><input type="text" name="search[name]" size="25" /></td>
			</tr>
		</table>
	</form>
</fieldset>

{include file="grid.tpl"}


<!-- reorder -->
<div class="pad ui-corner-all">
	<ul>
		<li><a class="fg-button ui-state-default ui-corner-all" href="{$musca_url}/{$modul}/order"><img src="{$musca_url}/css/buttons/reorder.gif" />{t section="buttons"}Change order{/t}</a></li>
	</ul>
</div>
<!-- /reorder -->
