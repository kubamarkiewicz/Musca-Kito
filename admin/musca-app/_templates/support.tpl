	
	<div class="messages" id="messages"><div></div></div>

	{if $smarty.session.edit_ids.$modul|@count gt 1}
	<div id="slideMenu" class="closed">
		<div id="effect" class="ui-widget-content ui-corner-all">
			<h3 class="ui-widget-header ui-corner-all">Registros a editar</h3>
			<ul>
			{foreach from=$smarty.session.edit_ids.$modul item=v key=k}
				<li {if $id==$k}class="sel"{/if}><a href="{$musca_url}/{$modul}/edit/{$k}">{$v|truncate:40}</a></li>
			{/foreach}
			</ul>
		</div>
	</div>
	<script type="text/JavaScript">
		$(function(){
			$("a.slide_button").click(function(){
				if($("#slideMenu").hasClass('closed')){
					$("#slideMenu").stop().animate({ left:-5 }, 'fast', function(){
						$(this).removeClass('closed').addClass('opened');
					});
				}
				else
				{
					$("#slideMenu").stop().animate({ left:-340 }, 'fast', function(){
						$(this).removeClass('opened').addClass('closed');
					});
				}
				return false;
			});
		});
	</script>
	{/if}
