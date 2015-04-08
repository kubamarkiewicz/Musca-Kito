<?php /* Smarty version Smarty-3.1.21, created on 2015-04-08 02:32:40
         compiled from "/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/app/Templates/home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2054030487552473c3a30f29-34248747%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '5cb0eb8d485e8b201771fa95d27c5a32186c14af' => 
    array (
      0 => '/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/app/Templates/home.tpl',
      1 => 1428453159,
      2 => 'file',
    ),
    '062ee718783a78e37e024fcfea62ae093a3813fc' => 
    array (
      0 => '/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/app/Templates/layout.tpl',
      1 => 1428452433,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2054030487552473c3a30f29-34248747',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21',
  'unifunc' => 'content_552473c3b394d0_48220379',
  'variables' => 
  array (
    'musca_url' => 0,
    'section' => 0,
    'langs' => 0,
    'item' => 0,
    'lang' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_552473c3b394d0_48220379')) {function content_552473c3b394d0_48220379($_smarty_tpl) {?><?php if (!is_callable('smarty_block_t')) include '/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/vendor/kubamarkiewicz/musca-kit-framework/smarty_plugins/block.t.php';
?><!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/images/favicon.png">

    <!-- Le styles -->
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/js/vendor/bootstrap/themes/united.min.css">
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/css/custom.css">

    <!-- Le javascript -->
    <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/js/vendor/jquery/jquery.min.js"><?php echo '</script'; ?>
>

  </head>

  <body class="<?php echo $_smarty_tpl->tpl_vars['section']->value;?>
">

    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
">Home</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li <?php if ($_smarty_tpl->tpl_vars['section']->value=='contact') {?>class="active"<?php }?>><a href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/contact">Contact</a></li>
          </ul>
          <p class="navbar-text navbar-right langs">
            <?php  $_smarty_tpl->tpl_vars['item'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['item']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['langs']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['item']->key => $_smarty_tpl->tpl_vars['item']->value) {
$_smarty_tpl->tpl_vars['item']->_loop = true;
?>
              <?php if ($_smarty_tpl->tpl_vars['item']->value==$_smarty_tpl->tpl_vars['lang']->value) {?>
                <span><?php echo $_smarty_tpl->tpl_vars['item']->value;?>
</span>
              <?php } else { ?>
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

    

	<div class="container content-page">
    	<h1><?php $_smarty_tpl->smarty->_tag_stack[] = array('t', array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value))); $_block_repeat=true; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value)), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
Home<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value)), $_block_content, $_smarty_tpl, $_block_repeat);  } array_pop($_smarty_tpl->smarty->_tag_stack);?>
</h1>
    	param=<?php echo $_smarty_tpl->tpl_vars['param']->value;?>

    </div>



    <!-- Le javascript -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/js/vendor/bootstrap/js/bootstrap.min.js"><?php echo '</script'; ?>
>

  </body>
</html><?php }} ?>
