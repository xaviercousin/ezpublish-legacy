    <a href={"/sdk/tutorials/view/content_classes"|ezurl} target="_ezpublishmanual">
    <img src={"help.gif"|ezimage} align="right">
    </a>

    <!-- Object info box start-->
    <table class="menuboxright" width="120" cellpadding="1" cellspacing="0" border="0">
    <tr>
        <th class="menuheaddark" colspan="2">
        <p class="menuhead">{"Object info"|i18n("design/standard/content/edit")}</p>
        </th>
    </tr>
    <tr>
        <td class="menu" colspan="2">
	    <p class="menufieldlabel">{"Created"|i18n("design/standard/content/edit")}</p>
	    {section show=$object.published}
	    <p class="menufield">{$object.published|l10n(date)}</p>
	    {section-else}
	    <p class="menufield">
	    {"Not yet published"|i18n("design/standard/content/edit")}
	    </p>
	    {/section}
        </td>
    </tr>
    <tr>
        <th class="menuheaddark" colspan="2">
        <p class="menuhead">{"Versions"|i18n("design/standard/content/edit")}</p>
        </th>
    </tr>
    <tr>
        <td class="menu">
	    <p class="menufieldlabel">{"Editing"|i18n("design/standard/content/edit")}</p>
        </td>
        <td class="menu" width="1">
	    <p class="menufield">{$edit_version}</p>
        </td>
    </tr>
    <tr>
        <td class="menu">
	    <p class="menufieldlabel">{"Current"|i18n("design/standard/content/edit")}</p>
        </td>
        <td class="menu" width="1">
	    <p class="menufield">{$object.current_version}</p>
        </td>
    </tr>
    <tr>
        <td class="menu" colspan="2" align="right">
          <input class="menubutton" type="submit" name="VersionsButton" value="{'Manage'|i18n('design/standard/content/edit')}" />
        </td>
    </tr>
    <tr>
        <td class="menu" colspan="2" align="right">
          <input class="menubutton" type="submit" name="PreviewButton" value="{'Preview'|i18n('design/standard/content/edit')}" />
        </td>
    </tr>
    <!-- Object info box end-->

    <!-- Translation box start-->
{let name=Translation
     language_index=0
     default_translation=$content_version.translation
     other_translation_list=$content_version.translation_list
     translation_list=array_prepend($Translation:other_translation_list,$Translation:default_translation)}

{section show=$Translation:translation_list}
    <tr>
        <th class="menuheaddark" colspan="2">
        <p class="menuhead">{"Translations"|i18n("design/standard/content/edit")}</p>
        </th>
    </tr>

{section loop=$Translation:translation_list}
  {section show=eq($edit_language,$Translation:item.language_code)}
    {set language_index=$Translation:index}
  {/section}
{/section}

{section loop=$Translation:translation_list sequence=array("bgdark","bglight")}
    <tr>
        <td class="{$Translation:sequence}" colspan="{$Translation:other_translation_list|gt(0)|choose(2,1)}">
          {section show=$Translation:item.locale.is_valid}
            <p class="menufieldlabel">{$Translation:item.locale.intl_language_name}</p>
          {section-else}
            <p class="menufieldlabel">{"%1 (No locale information available)"|i18n("design/standard/content/edit",,array($Translation:item.language_code))}</p>
          {/section}
        </td>
{section show=$Translation:other_translation_list|gt(0)}
        <td class="{$Translation:sequence}">
          <input type="radio" name="EditSelectedLanguage" value="{$Translation:item.language_code}" {section show=eq($Translation:index,$Translation:language_index)}checked="checked"{/section} />
        </td>
{/section}
    </tr>
{/section}
    <tr>
        <td colspan="2" align="right">
	  <input class="menubutton" type="submit" name="TranslateButton" value="{'Manage'|i18n('design/standard/content/edit')}" />
{section show=$Translation:other_translation_list|gt(0)}
          <input class="menubutton" type="submit" name="EditLanguageButton" value="{'Edit'|i18n('design/standard/content/edit')}" />
{/section}
        </td>
    </tr>
{/section}

{/let}
    <!-- Translation box end-->

    <tr>
        <th class="menuheaddark" colspan="2">
        <p class="menuhead">{"Related objects"|i18n("design/standard/content/edit")}</p>
        </th>
    </tr>
    {section name=Object loop=$related_contentobjects sequence=array(bglight,bgdark)}
    <tr>
        <td class="{$Object:sequence}" align="left" colspan="1">
          <p class="box">{content_view_gui view=text_linked content_object=$Object:item}</p>
	  <span class="small">&lt;object id='{$Object:item.id}' /&gt;</span>
	</td>
        <td class="{$Object:sequence}" align="right" colspan="1" width="1">
          <input type="checkbox" name="DeleteRelationIDArray[]" value="{$Object:item.id}" />
	</td>
    </tr>
    {/section}
    <tr>
        <td align="right" colspan="2">
          <div class="buttonblock">
{*          <input class="menubutton" type="submit" name="BrowseObjectButton" value="{'Find'|i18n('design/standard/content/edit')}" />*}
            <input class="menubutton" type="image" name="BrowseObjectButton" value="{'Find'|i18n('design/standard/content/edit')}" src={"find.png"|ezimage} />
    {section show=$related_contentobjects}
{*          <input class="menubutton" type="submit" name="DeleteRelationButton" value="{'Remove'|i18n('design/standard/content/edit')}" />*}
            <input class="menubutton" type="image" name="DeleteRelationButton" value="{'Remove'|i18n('design/standard/content/edit')}" src={"trash.png"|ezimage} />
    {/section}
          <div>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="right">
	<br />
	<select	name="ClassID" class="classcreate">
	    {section name=Classes loop=$object.can_create_class_list}
	    <option value="{$Classes:item.id}">{$Classes:item.name}</option>
	    {/section}
	</select>
	<input class="menubutton" type="submit" name="NewButton" value="{'New'|i18n('design/standard/content/edit')}" />
	</td>
    </tr>
    </table>
