<?php /* Smarty version Smarty-3.1.21, created on 2015-04-13 15:31:55
         compiled from "/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/app/Views/contact.tpl" */ ?>
<?php /*%%SmartyHeaderCode:880866259552bb6df7a5cd9-70251845%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'db5ad10f0d08a620783eeabb7764362ce50667db' => 
    array (
      0 => '/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/app/Views/contact.tpl',
      1 => 1426377166,
      2 => 'file',
    ),
    'd60da945d1fc7f650af7527c3b70f2b978e5c9a8' => 
    array (
      0 => '/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/app/Views/layout.tpl',
      1 => 1428931767,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '880866259552bb6df7a5cd9-70251845',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.21',
  'unifunc' => 'content_552bb6df8bfc15_06624314',
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
<?php if ($_valid && !is_callable('content_552bb6df8bfc15_06624314')) {function content_552bb6df8bfc15_06624314($_smarty_tpl) {?><?php if (!is_callable('smarty_block_t')) include '/Users/kuba/jacob marcus/projects/musca/MuscaKit-App/protected/vendor/kubamarkiewicz/musca-kit-framework/smarty_plugins/block.t.php';
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
Contact<?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value)), $_block_content, $_smarty_tpl, $_block_repeat);  } array_pop($_smarty_tpl->smarty->_tag_stack);?>
</h1>
    	<?php $_smarty_tpl->smarty->_tag_stack[] = array('t', array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value),'html'=>true)); $_block_repeat=true; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value),'html'=>true), null, $_smarty_tpl, $_block_repeat);while ($_block_repeat) { ob_start();?>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p><?php $_block_content = ob_get_clean(); $_block_repeat=false; echo smarty_block_t(array('section'=>((string)$_smarty_tpl->tpl_vars['section']->value),'html'=>true), $_block_content, $_smarty_tpl, $_block_repeat);  } array_pop($_smarty_tpl->smarty->_tag_stack);?>

    </div>


    

    <!-- Le javascript -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php echo '<script'; ?>
 src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"><?php echo '</script'; ?>
>

</body>
</html><?php }} ?>
