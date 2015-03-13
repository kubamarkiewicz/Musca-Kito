<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>{if $title}{$title|htmlspecialchars}{else}{t section="$section" label="Page title"}Page title{/t}{/if}</title>
    <meta name="description" content="{if $description}{$description|strip_tags|htmlspecialchars}{else}{t section="$section" label="Page description"}Page description{/t}{/if}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">
    <link rel="shortcut icon" href="{$musca_url}/assets/favicon.png">

    <!-- Le styles -->
    <link rel="stylesheet" href="{$musca_url}/assets/bootstrap/themes/united.min.css">
    <link rel="stylesheet" href="{$musca_url}/assets/css/custom.css">

    <!-- Le javascript -->
    <script src="{$musca_url}/assets/jquery/jquery.min.js"></script>

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
          <a class="navbar-brand" href="{$musca_url}">{t section="menu"}Home{/t}</a>
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
    <script src="{$musca_url}/assets/bootstrap/js/bootstrap.min.js"></script>

  </body>
</html>