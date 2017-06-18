<#function lu str>
    <#assign splitted = str?matches("([A-Z][0-9a-z]*)") />
<#assign re><#list splitted as part >${part?lower_case}<#if part_has_next>_</#if></#list></#assign>
<#return re />
</#function>
<#macro showvar vname>${r"${"}${vname}${r"}"}</#macro>