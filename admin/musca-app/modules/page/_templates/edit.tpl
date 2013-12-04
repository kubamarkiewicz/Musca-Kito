{include file="support.tpl"}

<form id="form_send" method="post" enctype="multipart/form-data">
	<input type="hidden" name="send" value="1" />
	<input type="hidden" name="MAX_FILE_SIZE" value="{$MAX_FILE_SIZE}" />
	<input type="hidden" name="parent_id" value="{$elem.parent_id}" />

	<fieldset>
		<table width="95%">
			
			<tr>
				<th>{t section="$modul"}Name{/t}</th>
				<td><input type="text" name="name" value="{$elem.name}" style="width: 95%" /></td>
			</tr>
			<tr>
				<th>{t section="$modul"}Slug{/t}</th>
				<td>{$elem.slug}</td>
			</tr>
			<tr>
				<th>{t section="$modul"}Published{/t}</th>
				<td>
					<input type="checkbox" name="enabled" value="1" {if $elem.enabled}checked="1"{/if} />
				</td>
			</tr>

			<!-- image -->
			<tr>
				<th>{t section="$modul"}Image{/t}</th>
			    <td>
					{if $elem.image}
						<p>
							<img src="{$musca_url}{$content_dir}{$imageConfig.dir}/{$elem.image}" /><label class="aviso pointer"><input type="checkbox" name="image_del" value="1" /> {t section="$modul"}Delete image{/t}</label>
						</p>
					{/if}
					<p class="mensaje">
						<input name="image" type="file" />
						{t section="$modul"}Image will be resized to{/t} <strong>{$imageConfig.width}x{$imageConfig.height}</strong> px. {t section="$modul"}Maximum file size is{/t} <strong>{$MAX_FILE_SIZE_HUMAN}</strong>.
					</p>
				</td>
			</tr>	

			<tr>
				<th>{t section="$modul"}Introduction{/t}</th>
				<td>
					<textarea name="intro">{$elem.intro|@stripslashes}</textarea>
				</td>
			</tr>
			<tr>
				<th>{t section="$modul"}Content{/t}</th>
				<td>
					<textarea name="content" class="tinymce">{$elem.content|@stripslashes}</textarea>
				</td>
			</tr>
			
		</table>
	</fieldset>





</form>

{include file="buttons.tpl"}

<script type="text/javascript">
	{if $saved}
		var message = '<p class="aviso success">{t section="message"}Data has been saved successfully.{/t}</p>';
		$('#messages div').html(message).fadeIn('slow');
	{/if}

	$('.save').click(function(){
		$('#form_send').attr('action', $(this).attr('href'))
		$('#form_send').submit();
		return false;
	});
	
	$("#form_send").validate({
		event: "blur",
		rules: {
			name:				{ required: true }
		}
	});

    // override default validation messages
    $.extend($.validator.messages, {
        required: '{t section="message"}This field is required{/t}'
    });

</script>
