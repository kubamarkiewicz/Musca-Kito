{extends file="layout.tpl"}
{block name=content}

	<div class="container content-page">
    	<h1>{t section="$section"}Hi there!{/t}</h1>
    	<p>
    		Congratulations, you're running MuscaKit demo site<br>
    		<a href="https://github.com/kubamarkiewicz/MuscaKit-App" target="_blank">MuscaKit Documentation</a>
    	</p>
    	<p>param={$param}</p>
    </div>

{/block}