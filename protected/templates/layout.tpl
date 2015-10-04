<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="{if $description}{$description|strip_tags|htmlspecialchars}{else}{t section="$section" label="Page description"}Page description{/t}{/if}">
    <meta name="author" content="Kuba Markiewicz">
    <link rel="icon" href="{$musca_url}/images/favicon.png">

    <title>{if $title}{$title|htmlspecialchars}{else}{t section="$section" label="Page title"}Page title{/t}{/if}</title>

    <!-- Le styles -->
    <link rel="stylesheet" href="{$musca_url}/css/themes/united.min.css">
    <link rel="stylesheet" href="{$musca_url}/css/custom.css">
    {block name=css}{/block}

</head>
<body class="{$section}">

    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">{t section="menu"}Toggle navigation{/t}</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="{$musca_url}">{t section="menu"}MuscaKit Demo{/t}</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li {if $section=='contact'}class="active"{/if}><a href="{$musca_url}/contact">{t section="menu"}Contact{/t}</a></li>
                </ul>
                <p class="navbar-text navbar-right langs">
                    {foreach $langs as $item}
                        {if $item == $lang}
                            <span>{$item}</span>
                        {else}
                            <a href="{$musca_url}/{$item}">{$item}</a>
                        {/if}
                    {/foreach}
                </p>
            </div><!--/.nav-collapse -->
        </div>
    </div>

    {block name=content}{/block}

    <!-- Le javascript -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="{$musca_url}/js/vendor/jquery/dist/jquery.min.js"></script>
    <script src="{$musca_url}/js/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
    {block name=javascript}{/block}

</body>
</html>