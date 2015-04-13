<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <!-- Le styles -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="{$musca_url}/css/custom.css">

    <!-- Le javascript -->
    <script src="{$musca_url}/js/vendor/jquery/jquery.min.js"></script>

</head>
<body class="{$section}">

    <div class="container">
        <a href="{$musca_url}">Home</a>
        <a href="{$musca_url}/contact">Contact</a>

        <div class="text-right">
            {foreach $langs as $item}
                {if $item == $lang}
                    <span>{$item}</span>
                {else}
                    <a href="{$musca_url}/{$item}">{$item}</a>
                {/if}
            {/foreach}
        </div>
    </div>


    {block name=content}{/block}
    

    <!-- Le javascript -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>