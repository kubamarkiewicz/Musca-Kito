
	<script type="text/javascript" src="{$musca_url}/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript">
		tinymce.init({
		    selector: "textarea.tinymce",
			skin: 'light',
		    convert_fonts_to_spans: true,
		    content_css: "{$musca_url}/css/tinymce.css",
		    menubar : false,
		    // statusbar: false,
		    // toolbar: "styleselect | bold italic | removeformat | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link unlink | responsivefilemanager | code",
		    toolbar: "bold italic superscript | styleselect forecolor | removeformat | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link | responsivefilemanager | code",
		    plugins: "paste, link, code, responsivefilemanager, textcolor, autoresize",
		    textcolor_map: [
		        "666666", "666666",
		        "B8B8B8", "B8B8B8",
		        "3FAE49", "3FAE49",
		        "1C6987", "1C6987"
		    ],
		    textcolor_rows: 4,
		    textcolor_cols: 1,
		    paste_as_text: false,
		    valid_elements : "p[style|class],br,h1,h2,h3,em,strong,table,tr,td,img,ul,ol,li,span[class],a[href|target],div,sup",
		    invalid_elements : "",
		    valid_styles: {
		        "p": "text-align"
		    },
		    // http://www.tinymce.com/wiki.php/Configuration:style_formats
		    style_formats: [
		    	{ title: 'Default text', block: 'p'},
		    	{ title: 'Header 1', block: 'h1'},
		    	{ title: 'Header 2', block: 'h2'},
		    	{ title: 'Header 3', block: 'h3'},
		    	{ title: 'Small text', inline: 'span', classes: 'small'}
			],
			external_filemanager_path:"{$musca_url}/js/filemanager/", 
			filemanager_title:"File manager" , 
			external_plugins: { "filemanager" : "{$musca_url}/js/filemanager/plugin.min.js"},
			relative_urls : false,
			remove_script_host : false,
			document_base_url : '{$musca_url}'
		});
	</script>
