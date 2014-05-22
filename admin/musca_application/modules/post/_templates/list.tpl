{include file="support.tpl"}

<fieldset>
	<legend>{t section="grid"}Search{/t}</legend>
	<form id="sform" method="post">
		<table>
			<tr>
				<th>{t section="fields"}Title{/t}</th>
				<td><input type="text" name="search[name]" size="25" /></td>
			</tr>
		</table>
	</form>
</fieldset>

{include file="grid.tpl"}


