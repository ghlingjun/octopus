<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${mapperPackage}.${schema.modelName}Mapper">
    <#list schema.aliasList as alias>
    <sql id="alias_col_${alias.name}">
        <#list schema.columnDefList as columnDef >
        ${alias.name}.${columnDef.name} as ${columnDef.javaName} <#if columnDef_has_next> ,</#if>
        </#list>
    </sql>
    </#list>

    <!-- Put the SQL script which has write by yourself to below area -->

</mapper>
