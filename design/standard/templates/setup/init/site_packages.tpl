{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{*?template charset=latin1?*}

<form method="post" action="{$script}">

  <div align="center">
    <h1>{"Site functionality"|i18n("design/standard/setup/init")}</h1>
  </div>

  <p>
    {"Please choose what kind of functionality you want on your site."i18n("design/standard/setup/init")}
  </p>

{section show=$error}
<div class="error">
<p>
{$error|wash}
</p>
</div>
{/section}

{let site_type=$site_types[0]}

    <h2>{$site_types[0].name|wash}</h2>

    <p>{section show=$site_type.thumbnail}
        <img align="left" class="site-type" src={concat( "design/standard/images/setup/thumbnails/", $site_type.thumbnail )|ezroot} alt="{$site_type.name|wash}" />
    {section-else}
        <img align="left" class="site-type" src={"design/standard/images/setup/eZ_setup_template_default.png"|ezroot} alt="{$site_type.name|wash}" />
    {/section}
    <input type="hidden" name="eZSetup_site_packages[]" value="" />

    {$site_type.summary|wash|break}</p>

{/let}

{section show=$required_package_array|count}
<h2>{"Current site functionality"|i18n("design/standard/setup/init")}</h2>

<ul>
{section loop=$required_package_array}
    <li>{$:item.name|wash}</li>
{/section}
</ul>
{/section}

<h2>{"Please select additional functionality"|i18n("design/standard/setup/init")}</h2>
{section loop=$package_array}
    <div class="block">
        <input id="package_{$:item.identifier|wash}" type="checkbox" name="AdditionalPackages[]" value="{$:item.identifier|wash}" {section show=$recommended_package_array|contains( $:item.identifier )}checked="checked"{/section}/>&nbsp;<label for="package_{$:item.identifier|wash}">{$:item.name|wash}</label><br/>
         <p>
         {$:item.description|wash}
         </p>
    </div>
{/section}

  {include uri="design:setup/persistence.tpl"}

  {include uri='design:setup/init/navigation.tpl'}

</form>
