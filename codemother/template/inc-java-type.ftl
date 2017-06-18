<#macro out_java_type typename>
    <#assign typeMap = {'string':'String','int':'Integer','long':'Long','number':'Long',
    'boolean':'Boolean','date':'Date', 'varchar':'String','bigint':'Long', 'bit':'Boolean'} />
    <#t /><#attempt>${typeMap[typename]}<#recover >Failed to find type for "${typename}"</#attempt>
</#macro>