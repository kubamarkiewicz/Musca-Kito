	
	<script type="text/javascript" src="{$musca_url}/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript">
		tinymce.init({
		    selector: "textarea.tinymce",
			skin: 'light',
		    convert_fonts_to_spans: true,
		    content_css: "{$musca_url}/css/tinymce.css",
		    menubar : false,
		    // statusbar: false,
		    // toolbar: "styleselect | bold italic | removeformat | alignleft aligncenter alignright | bullist numlist outdent indent | link unlink | responsivefilemanager | code",
		    toolbar: "bold italic | styleselect forecolor | alignleft aligncenter alignright | removeformat | link | responsivefilemanager",
		    plugins: "paste, link, code, responsivefilemanager, textcolor",
		    textcolor_map: [
		        "666666", "666666",
		        "B8B8B8", "B8B8B8",
		        "3FAE49", "3FAE49",
		        "1C6987", "1C6987"
		    ],
		    textcolor_rows: 1,
		    textcolor_cols: 4,
		    paste_as_text: true,
		    style_formats: [
		    	{ title: 'Arial 14', inline: 'span', styles: { 'font-size': '14px'}},
		    	{ title: 'Arial 16', inline: 'span', styles: { 'font-size': '16px'}}
			],
			external_filemanager_path:"{$musca_url}/js/filemanager/", 
			filemanager_title:"File manager" , 
			external_plugins: { "filemanager" : "{$musca_url}/js/filemanager/plugin.min.js"},
			relative_urls : false,
			remove_script_host : false,
			document_base_url : '{$musca_url}'
		});
	</script>
	