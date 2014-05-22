<div class="pad ui-corner-all">
	<ul>
		<li><a class="fg-button ui-state-default ui-corner-all save" href="{$musca_url}/{$modul}/save"><img src="{$musca_url}/css/buttons/save.png" />{t section="buttons"}Save{/t}</a></li>
		<li><a class="fg-button ui-state-default ui-corner-all return" href="{$musca_url}/{$modul}"><img src="{$musca_url}/css/buttons/return.png" />{t section="buttons"}Back{/t}</a></li>
		{if $smarty.session.edit_ids.$modul|@count gt 1}<li><a href="javascript:;" class="slide_button fg-button ui-state-default ui-corner-all">{t section="buttons"}Next item{/t} &nbsp;<img src="{$musca_url}/css/buttons/next.gif" /></a></li>{/if}
	</ul>
</div>