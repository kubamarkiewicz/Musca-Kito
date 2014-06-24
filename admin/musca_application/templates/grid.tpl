{* modified 2013.05.02 *}

<link rel="stylesheet" type="text/css" href="{$musca_url}/css/flexigrid/flexigrid.css">
<script type="text/javascript" src="{$musca_url}/js/flexigrid.min.js"></script>

<table id="flex" style="display:none;"></table>

<script type="text/javascript">
	var modul = '{$modul}';
	var musca_url = '{$musca_url}';
	var sortname = '{$sortname}';
	var sortorder = '{$sortorder}';
	{literal}
	$(document).ready(function(){
		// FLEXGRID --------------- >>
			$("#flex").flexigrid({
				url: musca_url+'/admin/'+modul+'/flexGrid',
				dataType: 'json',
				colModel : {/literal}{$colModel}{literal},
                {/literal}{$buttons}{literal}
				sortname: sortname,
				sortorder: sortorder,
				usepager: true,
				title: false,
				useRp: true,
				rp: 32,
				showTableToggleBtn: false,
				width: 'auto',
				height: 440,
				showToggleBtn: false,
				onSubmit: addFormData,
				rpOptions: [32,256,1024],
				{/literal}
				pagestat: '{t section="grid"}Showing records from{/t} {literal}{from}{/literal} {t section="grid"}to{/t} {literal}{to}{/literal} ({literal}{total}{/literal} {t section="grid"}in total){/t}',
				procmsg: '{t section="grid"}Processing...{/t}',
				nomsg: '{t section="grid"}No records{/t}',
				errormsg: '{t section="grid"}Error connecting{/t}',
				dblclickFunction: doubleClick
				{literal}
			});
		});

		function sortAlpha(com)
		{
			jQuery('#flex').flexOptions({newp:1, params:[{name:'letter_pressed', value: com},{name:'qtype',value:$('select[name=qtype]').val()}]});
			jQuery("#flex").flexReload();
		}

		function test(com,grid)
		{
			// console.log(com);
			if (com=='{/literal}{t section="grid"}Delete{/t}{literal}')
			{
				if($('.trSelected',grid).length>0)
				{
					if(confirm('{/literal}{t section="grid"}Are you sure that you want to delete selected items?{/t}{literal}'))
					{
						var items = $('.trSelected',grid);
						var itemlist ='';
						for(i=0;i<items.length;i++) itemlist+= items[i].id.substr(3)+",";
						$.ajax({
							type: "POST",
							url: musca_url+'/admin/'+modul+'/del',
							data: 'ids='+itemlist,
							success: function(data)
							{
								$("#flex").flexReload();
							}
						});
					}
				}
				else return false;
			}
			else if (com=='{/literal}{t section="grid"}Add{/t}{literal}') window.location.href=musca_url+'/admin/'+modul+'/add';
			else if (com=='{/literal}{t section="grid"}Edit{/t}{literal}')
			{
				if ($('.trSelected',grid).length==1)
				{
					var items = $('.trSelected',grid);
					var id = items[0].id.substr(3);
					window.location.href=musca_url+'/admin/'+modul+'/edit/'+id;
				}
				else
				{
					//alert('Marca un registro si quieres editarlo');
                    var items = $('.trSelected',grid);
					var ids = '-1';

					$.each(items, function(key) {
						ids += ',' + items[key].id.substr(3);
					});
                    if (ids!=-1) window.location.href=musca_url+'/admin/'+modul+'/edit/'+ids;
                    else alert('{/literal}{t section="grid"}Select at least one item{/t}{literal}');
				}
			}
			else if (com=='{/literal}{t section="grid"}Select all{/t}{literal}')
			{
				$('.bDiv tbody tr',grid).addClass('trSelected');
			}
			else if (com=='{/literal}{t section="grid"}Deselect all{/t}{literal}')
			{
				$('.bDiv tbody tr',grid).removeClass('trSelected');
			}
			else if (com=='{/literal}{t section="grid"}Activate{/t}{literal}')
			{
				if ($('.trSelected',grid).length>0)
				{
					if(confirm('{/literal}{t section="grid"}Are you sure that you want to activate selected items?{/t}{literal}'))
					{
						var items = $('.trSelected',grid);
						var itemlist ='';
						for(i=0;i<items.length;i++) itemlist+= items[i].id.substr(3)+",";
						$.ajax({
							type: "POST",
							url: musca_url+'/admin/'+modul+'/activate',
							data: 'ids='+itemlist,
							success: function(data)
							{
								$("#flex").flexReload();
							}
						});
					}
				}
				else
				{
					alert('{/literal}{t section="grid"}Select at least one item{/t}{literal}');
				}
			}
			else if (com=='{/literal}{t section="grid"}Desactivate{/t}{literal}')
			{
				if ($('.trSelected',grid).length>0)
				{
					if(confirm('{/literal}{t section="grid"}Are you sure that you want to desactivate selected items?{/t}{literal}'))
					{
						var items = $('.trSelected',grid);
						var itemlist ='';
						for(i=0;i<items.length;i++) itemlist+= items[i].id.substr(3)+",";
						$.ajax({
							type: "POST",
							url: musca_url+'/admin/'+modul+'/desactivate',
							data: 'ids='+itemlist,
							success: function(data)
							{
								$("#flex").flexReload();
							}
						});
					}
				}
				else
				{
					alert('{/literal}{t section="grid"}Select at least one item{/t}{literal}');
				}
			}
			else
			{
				if ($('.trSelected',grid).length>0)
				{
					if(confirm('{/literal}{t section="grid"}Are you sure?{/t}{literal}'))
					{
						var items = $('.trSelected',grid);
						var itemlist ='';
						for(i=0;i<items.length;i++) itemlist+= items[i].id.substr(3)+",";
						$.ajax({
							type: "POST",
							url: musca_url+'/admin/'+modul+'/'+com,
							data: 'ids='+itemlist,
							success: function(data)
							{
								$("#flex").flexReload();
								if (data) alert(data.toString());
							}
						});
					}
				}
				else
				{
					alert('{/literal}{t section="grid"}Select at least one item{/t}{literal}');
				}
			}
		}

		function doubleClick(row)
		{
			var id = row.id.substr(3);
			window.location.href=musca_url+'/admin/'+modul+'/edit/'+id;
		}

		// SEARCH ------- >>
			function addFormData()
			{
				var dt = $('#sform').serializeArray();
				$("#flex").flexOptions({params: dt});
				return true;
			}

			$('#sform').submit(function (){
				$('#flex').flexOptions({newp: 1}).flexReload();
				return false;
			});

			$('.reset').click(function (){
				$('#sform')[0].reset();
				$('#flex').flexOptions({newp: 1}).flexReload();
			});

			// Activar el buscador ---------- >>
				$('#sform select').change(function(){
					$('#sform').submit();
				});

				$('#sform input').keyup(function(){
					$('#sform').submit();
				});
			// ---------------------------------- >>

		// --------------- >>

	// --------------------------------------------------- >>
	{/literal}
</script>

