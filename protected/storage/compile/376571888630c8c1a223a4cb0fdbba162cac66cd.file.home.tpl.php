<?php /* Smarty version Smarty-3.1.21, created on 2015-04-13 15:56:50
         compiled from "/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/app/Views/home.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1149345020552bc287ee4d18-83057025%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '376571888630c8c1a223a4cb0fdbba162cac66cd' => 
    array (
      0 => '/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/app/Views/home.tpl',
      1 => 1428932615,
      2 => 'file',
    ),
    'd60da945d1fc7f650af7527c3b70f2b978e5c9a8' => 
    array (
      0 => '/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/app/Views/layout.tpl',
      1 => 1428933405,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1149345020552bc287ee4d18-83057025',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21',
  'unifunc' => 'content_552bc28812ec33_08956376',
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
<?php if ($_valid && !is_callable('content_552bc28812ec33_08956376')) {function content_552bc28812ec33_08956376($_smarty_tpl) {?><?php if (!is_callable('smarty_block_t')) include '/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/vendor/kubamarkiewicz/musca-kit-framework/smarty_plugins/block.t.php';
?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <!-- Le styles -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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

    <div class="container">
        <a href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
">Home</a>
        <a href="<?php echo $_smarty_tpl->tpl_vars['musca_url']->value;?>
/contact">Contact</a>

        <div class="text-right">
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
        </div>
    </div>


    

	<div class="container content-page">
    	<h1><?php $_smarty_tpl->smarty->_tag_stack[] = array('t', array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value))); $_block_repeat=true; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value)), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
Hi there!<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value)), $_block_content, $_smarty_tpl, $_block_repeat);  } array_pop($_smarty_tpl->smarty->_tag_stack);?>
</h1>
    	<p>
    		Congratulations, you're running MuscaKit demo site<br>
    		<a href="https://github.com/kubamarkiewicz/MuscaKit-App" target="_blank">MuscaKit Documentation</a>
    	</p>
    	<p>param=<?php echo $_smarty_tpl->tpl_vars['param']->value;?>
</p>
    </div>


    

    <!-- Le javascript -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php echo '<script'; ?>
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"><?php echo '</script'; ?>
>

</body>
</html><?php }} ?>
