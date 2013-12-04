	
	<ul class="sf-menu">
		<li><a href='{$musca_url}/product'>{t section="product"}Products{/t}</a></li>
		<li><a href='{$musca_url}/page'>{t section="product"}Pages{/t}</a></li>
		<!-- <li><a href='{$musca_url}/sandbox'>{t section="sandbox"}Sandbox{/t}</a></li> -->
		<li><a href='{$musca_url}/musca_translation/block'>{t section="musca_translation"}Translations{/t}</a></li>
		<li>
			<a href="javascript:" class="no-link">{t section="menu"}Administration{/t}</a>
			<ul>
				<li><a href='{$musca_url}/musca_auth'>{t section="musca_auth"}Administrators{/t}</a></li></a></li>
				<li><a href='{$musca_url}/musca_configuration_user'>{t section="musca_configuration_user"}Configuration{/t}</a></li>
				{if $indelible==1}
					<li><a href='{$musca_url}/musca_translation_admin/block'>{t section="musca_translation_admin"}Admin Translations{/t}</a></li>
					<!-- <li><a href='{$musca_url}/musca_auth_rol'>{t section="musca_auth_rol"}Roles{/t}</a></li> -->
				{/if}

			</ul>
		</li>
	</ul>