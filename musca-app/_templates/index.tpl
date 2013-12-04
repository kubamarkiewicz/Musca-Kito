{extends file="layout.tpl"}
{block name=content}

	<div class="container">
    	{t section="$section"}Hello{/t}
    </div>


    <img src="{t section="$section" image=true width=100 height=100 crop=true}http://blog.berndtgroup.net/wp-content/uploads/2010/11/detail-wherePages.jpg{/t}">

    <a href="{t section="$section" file=true}link a pdf{/t}">descarga PDF</a>


{/block}