<?php /* Smarty version Smarty-3.1.11, created on 2014-05-07 15:58:26
         compiled from "/home/kuba/projekty/musca/MuscaKit/musca_application/_templates/home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1977447524536a3c02734741-06379579%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'bde3a4137f4c21693efcf098dbee0febaedd4de0' => 
    array (
      0 => '/home/kuba/projekty/musca/MuscaKit/musca_application/_templates/home.tpl',
      1 => 1399225745,
      2 => 'file',
    ),
    'b41386db8be5abc169295ae4c8e51ce7474210f1' => 
    array (
      0 => '/home/kuba/projekty/musca/MuscaKit/musca_application/_templates/layout.tpl',
      1 => 1399225023,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1977447524536a3c02734741-06379579',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'title' => 0,
    'description' => 0,
    'musca_url' => 0,
    'section' => 0,
    'langs' => 0,
    'item' => 0,
    'lang' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.11',
  'unifunc' => 'content_536a3c028b6ec6_09102072',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_536a3c028b6ec6_09102072')) {function content_536a3c028b6ec6_09102072($_smarty_tpl) {?><?php if (!is_callable('smarty_block_t')) include '/home/kuba/projekty/musca/MuscaKit/musca_library/Smarty/plugins/block.t.php';
?><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><?php if ($_smarty_tpl->tpl_vars['title']->value){?><?php echo htmlspecialchars($_smarty_tpl->tpl_vars['title']->value);?>
<?php }else{ ?><?php $_smarty_tpl->smarty->_tag_stack[] = array('t', array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value),'label'=>"Page title")); $_block_repeat=true; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value),'label'=>"Page title"), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
Page title<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value),'label'=>"Page title"), $_block_content, $_smarty_tpl, $_block_repeat);  } array_pop($_smarty_tpl->smarty->_tag_stack);?>
<?php }?></title>
    <meta name="description" content="<?php if ($_smarty_tpl->tpl_vars['description']->value){?><?php echo htmlspecialchars(preg_replace('!<[^>]*?>!', ' ', $_smarty_tpl->tpl_vars['description']->value));?>
<?php }else{ ?><?php $_smarty_tpl->smarty->_tag_stack[] = array('t', array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value),'label'=>"Page description")); $_block_repeat=true; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value),'label'=>"Page description"), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
Page description<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value),'label'=>"Page description"), $_block_content, $_smarty_tpl, $_block_repeat);  } array_pop($_smarty_tpl->smarty->_tag_stack);?>
<?php }?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/assets/favicon.png">

    <!-- Le styles -->
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/assets/bootstrap/themes/united.min.css">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/assets/css/custom.css">

    <!-- Le javascript -->
    <script src="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/assets/jquery/jquery.min.js"></script>

  </head>

  <body class="<?php echo $_smarty_tpl->tpl_vars['section']->value;?>
">

    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only"><?php $_smarty_tpl->smarty->_tag_stack[] = array('t', array('section'=>"menu")); $_block_repeat=true; echo smarty_block_t(array('section'=>"menu"), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
Toggle navigation<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t(array('section'=>"menu"), $_block_content, $_smarty_tpl, $_block_repeat);  } array_pop($_smarty_tpl->smarty->_tag_stack);?>
</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
"><?php $_smarty_tpl->smarty->_tag_stack[] = array('t', array('section'=>"menu")); $_block_repeat=true; echo smarty_block_t(array('section'=>"menu"), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
Map<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t(array('section'=>"menu"), $_block_content, $_smarty_tpl, $_block_repeat);  } array_pop($_smarty_tpl->smarty->_tag_stack);?>
</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li <?php if ($_smarty_tpl->tpl_vars['section']->value=='product'){?>class="active"<?php }?>><a href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/product"><?php $_smarty_tpl->smarty->_tag_stack[] = array('t', array('section'=>"menu")); $_block_repeat=true; echo smarty_block_t(array('section'=>"menu"), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
Contact<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t(array('section'=>"menu"), $_block_content, $_smarty_tpl, $_block_repeat);  } array_pop($_smarty_tpl->smarty->_tag_stack);?>
</a></li>
          </ul>
          <p class="navbar-text navbar-right langs">
            <?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['langs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value){
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
              <?php if ($_smarty_tpl->tpl_vars['item']->value==$_smarty_tpl->tpl_vars['lang']->value){?>
                <span><?php echo $_smarty_tpl->tpl_vars['item']->value;?>
</span>
              <?php }else{ ?>
                <a href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/<?php echo $_smarty_tpl->tpl_vars['item']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value;?>
</a>
              <?php }?>
            <?php } ?>
          </p>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    

	<div class="container">
    	<h1><?php $_smarty_tpl->smarty->_tag_stack[] = array('t', array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value))); $_block_repeat=true; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value)), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
Plastic bag free day<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value)), $_block_content, $_smarty_tpl, $_block_repeat);  } array_pop($_smarty_tpl->smarty->_tag_stack);?>
</h1>

    	<!-- google maps -->
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
		<script type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/assets/js/initMap.js"></script>
		<div id="map"></div>

		<script type="text/javascript">
			var startLocation;
			var map;

			var data = [];
			var markers = [];
			var locations = new Array();
			var infoWindows = [];


			function initialize() 
			{
				initMap();

				// load markers
				loadMarkers();
			}
			google.maps.event.addDomListener(window, 'load', initialize);

			function loadMarkers()
			{
				// get markes data
				$.get('<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/ajaxGetMarkers/<?php echo $_smarty_tpl->tpl_vars['lighter']->value['id'];?>
', function(result) {
		            data = jQuery.parseJSON(result);
		            displayMarkers();
		        });
			}

			function displayMarkers() 
			{

				//  Create a new viewpoint bound
				var bounds = new google.maps.LatLngBounds();

				// create markers
				$.each(data, function(index, elem) { 
					if (elem.latitude && elem.longitude) 
					{
						// create marker
						LatLng = new google.maps.LatLng(elem.latitude, elem.longitude);
						locations.push(LatLng);
						switch (elem.category)
						{
							case "story":
								iconFile = '<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/assets/images/marker2.png';
								break;
							default:
								iconFile = '<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/assets/images/marker.png';
						}
						markers[index] = new google.maps.Marker({
							position: LatLng,
							map: map,
							draggable: false,
							icon: iconFile,
							title: elem.title
						});
						bounds.extend(LatLng);

						// create infoWindow
						infoWindows[index] = new google.maps.InfoWindow({
					        content: '<div class="infoWindow">' + elem.title + '</div>'
							// maxWidth: 150
					    });
					    google.maps.event.addListener(markers[index], 'click', function() {
					    	$.each(infoWindows, function(i, item) { 
					    		if (item) item.close();
					    	});
					    	infoWindows[index].open(map, markers[index]);
					    });
					}
				});

				//  Fit these bounds to the map
				map.fitBounds (bounds);
			}

		</script>


		<div>
			<a href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/step1/story">Tell a story</a>
		</div>

    </div>




    <!-- Le javascript -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/assets/bootstrap/js/bootstrap.min.js"></script>

  </body>
</html><?php }} ?>