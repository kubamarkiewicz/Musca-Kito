<div class="pad ui-corner-all">
	<ul>
		<li><a class="fg-button ui-state-default ui-corner-all return" href="{$musca_url}/{$modul}"><img src="{$musca_url}/css/buttons/return.png" />{t section="buttons"}Back{/t}</a></li>
	</ul>
</div>

<fieldset>
		<table class="view">

			<tr>
				<th>{t section="fields"}Title{/t}</th>
				<td>{$elem.title}</td>
			</tr>

			<tr>
				<th>{t section="fields"}Date{/t}</th>
				<td>{$elem.createDate}</td>
			</tr>

			<tr>
				<th>{t section="fields"}Category{/t}</th>
				<td>{$elem.category}</td>
			</tr>

			<tr>
				<th>{t section="fields"}Description{/t}</th>
				<td>{$elem.description}</td>
			</tr>

			<tr>
				<th>{t section="fields"}Video URL{/t}</th>
				<td>{$elem.videoUrl}</td>
			</tr>

			<tr>
				<th>{t section="fields"}File 1{/t}</th>
				<td><a href="{$musca_url}/../content/marker/{$elem.file1}" target="_blank">{$elem.file1}</a></td>
			</tr>

			<tr>
				<th>{t section="fields"}File 2{/t}</th>
				<td><a href="{$musca_url}/../content/marker/{$elem.file2}" target="_blank">{$elem.file2}</a></td>
			</tr>

			<tr>
				<th>{t section="fields"}lat, long{/t}</th>
				<td>{$elem.latitude}, {$elem.longitude}</div>
				</td>
			</tr>

			<tr>
				<th>{t section="fields"}User name{/t}</th>
				<td>{$elem.name}</td>
			</tr>

			<tr>
				<th>{t section="fields"}Email{/t}</th>
				<td>{$elem.email}</td>
			</tr>

			<tr>
				<th>{t section="fields"}Connect with others{/t}</th>
				<td>{$elem.connect}</td>
			</tr>

			<tr>
				<th>{t section="fields"}Newsletter{/t}</th>
				<td>{$elem.newsletter}</td>
			</tr>

<!-- 			<tr>
				<th>{t section="$module"}Archivo{/t}</th>
			    <td>
					{if $elem.file}
						<p>
							<a href="{$musca_url}{$uploads_dir}{$fieldsConfig.file.dir}/{$elem.file}" target="_blank" />{$elem.file}</a>
						</p>
					{/if}
					<p class="mensaje">
						<input name="file" type="file" />
						{t section="$modul"}Maximum file size is{/t} <strong>{$MAX_FILE_SIZE_HUMAN}</strong>.
					</p>
				</td>
			</tr> -->

		</table>
</fieldset>	
