{include file="support.tpl"}

<fieldset class="">
	<form id="sform">
		<table>
			<tr>
				<th>{t section="$modul"}Parent page{/t}</th>
				<td>
					<select name="search_int[parent_id]">
						<option value="0"> root</option>
						{foreach $parentList as $item}
							<option value="{$item.id}" {if $item.id==$parent_id}selected="selected"{/if}>{for $i=1 to $item.depth}&nbsp; &nbsp; &nbsp; {/for}{$item.name}</option>
						{/foreach}
					</select>
				</td>
			</tr>
		</table>
	</form>
</fieldset>

{include file="grid.tpl"}


<div class="pad ui-corner-all">
	<ul>
		<li><a class="fg-button ui-state-default ui-corner-all" href="{$musca_url}/{$modul}/order"><img src="{$musca_url}/css/buttons/reorder.gif" />{t section="buttons"}Change order{/t}</a></li>
	</ul>
</div>