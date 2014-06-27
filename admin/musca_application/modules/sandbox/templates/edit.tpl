{include file="support.tpl"}

<form id="form_send" method="post" enctype="multipart/form-data">
	<input type="hidden" name="send" value="1" />
	<input type="hidden" name="MAX_FILE_SIZE" value="{$MAX_FILE_SIZE}" />





	<!-- i18n  ***************************************************************************************** -->

	<fieldset>
   		<input type="hidden" name="name" value="{$elem.name.es}" id="duplicate_out" />
		<div id="tabs_basic_i18n">
			<ul {if $langs|@count <= 1}style="display:none"{/if}>
				{foreach from=$langs item=iso key=k}
			    <li><a href="#{$iso}"><span>{t page="admin"}{$iso}{/t}</span></a></li>
				{/foreach}
			</ul>
			{foreach from=$langs item=iso key=k}
			<div id="{$iso}">
				<fieldset>
					<table width="95%">
						<tr>
							<th width="100">{t section="fields"}Name{/t}</th>
							<td><input type="text" name="i18n[name][{$iso}]" size="60" value="{$elem.name.$iso}" id="duplicate_in_{$iso}" /></td>
						</tr>
						<tr>
							<th>{t section="fields"}Description{/t}</th>
							<td><textarea class="tinymce" name="i18n[description][{$iso}]">{$elem.description.$iso}</textarea></td>
						</tr>
					</table>
				</fieldset>
			</div>
			{/foreach}
		</div>
	</fieldset>
	<script type="text/javascript">
	    /* i18n */
		$(function () {
			$('#tabs_basic_i18n').tabs();

			$('#duplicate_in_{$langs.0}').keyup(function(){
	              $('#duplicate_out').val($(this).val());
			});
		});
	</script>

	<!-- i18n end  ***************************************************************************************** -->



	<fieldset>
		<table width="95%">

			<!-- __fields__ -->
<!-- 			
			<tr>
				<th>{t section="fields"}Name{/t}</th>
				<td><input type="text" name="name" value="{$elem.name}" style="width: 95%" /></td>
			</tr>
			<tr>
				<th>{t section="fields"}Description{/t}</th>
				<td>
					<textarea name="description" class="tinymce">{$elem.description|@stripslashes}</textarea>
				</td>
			</tr>
 -->
			<tr>
				<th>{t section="fields"}Published{/t}</th>
				<td>
					<input name="enabled" value="0" type="hidden" />
					<input name="enabled" value="1" type="checkbox" {if $elem.enabled}checked="1"{/if} />
				</td>
			</tr>
			
			<!-- __field_date__ -->
			<tr>
				<th>{t section="$modul"}Date{/t}</th>
				<td><input type="text" name="date" value="{$elem.date}" class="datepicker" /></td>
			</tr>
			<!-- /__field_date__ -->

			<!-- image -->
			<tr>
				<th>{t section="fields"}Image{/t}</th>
			    <td>
					{if $elem.image}
						<p>
							<img src="{$musca_url}{$uploads_dir}{$model->fields.image.dir}/{$elem.image}" /><label class="aviso pointer"><input type="checkbox" name="image_del" value="1" /> {t section="$modul"}Delete image{/t}</label>
						</p>
					{/if}
					<p class="mensaje">
						<input name="image" type="file" />
						{t section="$modul"}Image will be resized to{/t} <strong>{$model->fields.image.width}x{$model->fields.image.height}</strong> px. {t section="$modul"}Maximum file size is{/t} <strong>{$MAX_FILE_SIZE_HUMAN}</strong>.
					</p>
				</td>
			</tr>

			<!-- /__fields__ -->

		</table>
	</fieldset>



	<!-- gallery ***************************************************************************************** -->

	<div id="tab_gallery">
		<fieldset class="gallery">
		    <legend>{t section="gallery"}Gallery{/t}</legend>
            <table>
                <tr><td>
			        {foreach $elem.gallery as $item}
			            <div class="image_box">
                            <div class="image">
                                <a href="{$musca_url}{$uploads_dir}{$model->gallery.dir}/{$elem.id}/{$item.image}" target="_blank"><img src="{$musca_url}{$uploads_dir}{$model->gallery.dir}/{$elem.id}/{$item.image}" /></a>
							</div>
							<div class="text_box">
			                    <label class="aviso pos"><input type="text" size="2" name="gallery[{$item.id}][pos]" value="{$item.pos}" /> {t section="gallery"}Order{/t}</label>
			                    <label class="aviso del"><input type="checkbox" name="gallery_del[]" value="{$item.id}" /> {t section="gallery"}Delete image{/t}</label>
{*}
								{foreach from=$langs item=iso key=k}
									<p><b>{t page="admin"}{$iso}{/t}</b></p>
									<textarea name="product_gallery_i18n[{$item.id}][description][{$iso}]" cols="30" rows="2">{$item.description.$iso}</textarea>
								{/foreach}
{/*}
							</div>
						</div>
			        {/foreach}
				</td></tr>
			</table>
            <table>
                <tr>
                    <td><input name="gallery[]" type="file"></td>
                    <td><input name="gallery[]" type="file"></td>
                    <td><input name="gallery[]" type="file"></td>
				</tr>
                <tr>
                    <td><input name="gallery[]" type="file"></td>
                    <td><input name="gallery[]" type="file"></td>
                    <td><input name="gallery[]" type="file"></td>
				</tr>
			</table>
			<p class="mensaje">
				{t section="gallery"}Images will be resized to{/t} <strong>{$model->gallery.width}x{$model->gallery.height}</strong> px. 
				{t section="gallery"}Maximum file size is{/t} <strong>{$MAX_FILE_SIZE_HUMAN}</strong>.</p>
		</fieldset>
	</div>

	<!-- gallery end ***************************************************************************************** -->


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


