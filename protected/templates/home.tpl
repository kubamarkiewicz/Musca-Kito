{extends file="layout.tpl"}
{block name=content}

    <div class="container content-page">
        <h1>{t section="$section"}Hello World!{/t}</h1>
        param={$param}
    </div>

{/block}